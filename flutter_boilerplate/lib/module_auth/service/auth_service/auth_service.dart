import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:yessoft/module_auth/enums/auth_source.dart';
import 'package:yessoft/module_auth/enums/auth_status.dart';
import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/exceptions/auth_exception.dart';
import 'package:yessoft/module_auth/manager/auth_manager/auth_manager.dart';
import 'package:yessoft/module_auth/model/app_user.dart';
import 'package:yessoft/module_auth/preferences/auth_pereferences.dart';
import 'package:yessoft/module_auth/request/login_request/login_request.dart';
import 'package:yessoft/module_auth/request/register_request/register_request.dart';
import 'package:yessoft/module_auth/response/login_response/login_response.dart';
import 'package:yessoft/utils/logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/subjects.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:uuid/uuid.dart';

@provide
class AuthService {
  final AuthManager _authManager;
  final AuthPreferences _prefsHelper;
  final PublishSubject<AuthStatus> _authSubject = PublishSubject<AuthStatus>();

  final _auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  String _verificationCode;

  AuthService(this._authManager, this._prefsHelper);

  // Delegates
  bool get isLoggedIn => _auth.currentUser != null;

  String get userID => _auth.currentUser.uid;

  Future<UserRole> get userRole => _prefsHelper.getUserRole();

  Stream<AuthStatus> get authListener => _authSubject.stream;

  /// This is a generator for Yes Soft API Token
  /// If this function is invoked without registering first,
  /// it will throw a LoginException
  ///
  /// @throws LoginException when password is not generated in Firebase
  /// @throws UnauthorizedException when password in Firebase Doesn't match API Password
  Future<void> _loginApiUser(UserRole role, AuthSource source) async {
    var user = _auth.currentUser;
    String password;

    try {
      password = await _getUserPassword();
    } catch (e) {
      Logger().error('Authorization Error',
          'Login is requested without a password', StackTrace.empty);
      throw UnauthorizedException('Error: Logging in before registering!');
    }

    // Change This
    LoginResponse loginResult = await _authManager.login(LoginRequest(
      username: user.email ?? user.uid,
      password: password,
    ));

    if (loginResult == null) {
      _authSubject.addError('Error getting the authorization from the API');
      await logout();
      throw UnauthorizedException(
          'Error getting the authorization from the API');
    }

    await _prefsHelper.setToken(loginResult.token);
    _authSubject.add(AuthStatus.AUTHORIZED);
  }

  Future<void> _registerApiNewUser(AppUser user) async {
    String password;

    try {
      // If this works, the user already have a password
      password = await _getUserPassword();
    } catch (e) {
      // if this is indicated, generate new password and register new account with it

      // Create the profile password
      password = Uuid().v1();

      // Create the profile in our database
      await _authManager.register(RegisterRequest(
        userID: user.credential.email ?? user.credential.uid,
        password: password,
        // This should change from the API side
        roles: [user.userRole.toString().split('.')[1]],
      ));

      // Save the profile password in his account
      await store
          .collection('users')
          .doc(user.credential.uid)
          .set({'password': password});
    }

    await _loginApiUser(user.userRole, user.authSource);
  }

  void verifyWithPhone(String phone, UserRole role) {
    var user = _auth.currentUser;
    if (user == null) {
      _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (authCredentials) {
            _auth.signInWithCredential(authCredentials).then((credential) {
              _registerApiNewUser(
                  AppUser(credential.user, AuthSource.PHONE, role));
            });
          },
          verificationFailed: (FirebaseAuthException err) {
            _authSubject.addError(err.message);
          },
          codeSent: (String verificationId, int forceResendingToken) {
            _verificationCode = verificationId;
            _authSubject.add(AuthStatus.CODE_SENT);
          },
          codeAutoRetrievalTimeout: (verificationId) {
            _authSubject.add(AuthStatus.CODE_TIMEOUT);
          });
    } else {
      _registerApiNewUser(AppUser(user, AuthSource.PHONE, role));
    }
  }

  Future<void> verifyWithGoogle(UserRole role) async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      ).signIn();
      Logger().info('AuthStateManager', 'Got Google User');
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await _registerApiNewUser(
          AppUser(userCredential.user, AuthSource.PHONE, role));
    } catch (e) {
      Logger().error('AuthService', e.toString(), StackTrace.current);
    }
  }

  Future<void> verifyWithApple(UserRole role) async {
    var oauthCred = await _createAppleOAuthCred();
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(oauthCred);

    await _registerApiNewUser(
        AppUser(userCredential.user, AuthSource.APPLE, role));
  }

  /// login to Firebase Authentication with an Email and Password
  /// If success, Continue to login to the API
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    UserRole role,
  ) async {
    try {
      var creds = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _registerApiNewUser(AppUser(creds.user, AuthSource.EMAIL, role));
    } catch (e) {
      if (e is FirebaseAuthException) {
        FirebaseAuthException x = e;
        Logger().info('AuthService', 'Got Authorization Error: ${x.message}');
        _authSubject.addError(x.message);
      } else {
        _authSubject.addError(e.toString());
      }
    }
  }

  /// This helps create new accounts with email and password
  /// 1. Create a Firebase User
  /// 2. Create an API User
  void registerWithEmailAndPassword(
      String email, String password, String name, UserRole role) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      signInWithEmailAndPassword(email, password, role);
    }).catchError((err) {
      if (err is FirebaseAuthException) {
        FirebaseAuthException x = err;
        Logger().info('AuthService', 'Got Authorization Error: ${x.message}');
        _authSubject.addError(UnauthorizedException(x.message));
      } else {
        logout().then((value) {
          _authSubject
              .addError(UnauthorizedException('Error: ${err.toString()}'));
        });
      }
    });
  }

  /// This confirms Phone Number
  /// @return void
  void confirmWithCode(String code, UserRole role) {
    AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: _verificationCode,
      smsCode: code,
    );

    _auth.signInWithCredential(authCredential).then((credential) {
      _registerApiNewUser(AppUser(credential.user, AuthSource.PHONE, role));
    }).catchError((err) {
      if (err is FirebaseAuthException) {
        FirebaseAuthException x = err;
        throw UnauthorizedException(x.message);
      } else {
        logout().then((_) {
          throw UnauthorizedException('Error Registering with Auth Provider');
        });
      }
    });
  }

  /// @return cached token
  /// @throw UnauthorizedException
  /// @throw TokenExpiredException
  Future<String> getToken() async {
    var token = await this._prefsHelper.getToken();
    if (token == null) {
      throw UnauthorizedException('Token was not generated');
    }

    return token;
  }

  /// refresh API token, this is done using Firebase Token Refresh
  /// @throws
  Future<String> refreshToken() async {
    String uid = _auth.currentUser.uid;
    String password = await _getUserPassword();

    LoginResponse loginResponse = await _authManager.login(LoginRequest(
      username: uid,
      password: password,
    ));
    await _prefsHelper.setToken(loginResponse.token);
    return loginResponse.token;
  }

  /// apple specific function
  Future<OAuthCredential> _createAppleOAuthCred() async {
    final nonce = _createNonce(32);
    final nativeAppleCred = Platform.isIOS
        ? await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
            nonce: sha256.convert(utf8.encode(nonce)).toString(),
          )
        : await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
            webAuthenticationOptions: WebAuthenticationOptions(
              redirectUri: Uri.parse(
                  'https://your-project-name.firebaseapp.com/__/auth/handler'),
              clientId: 'your.app.bundle.name',
            ),
            nonce: sha256.convert(utf8.encode(nonce)).toString(),
          );

    return new OAuthCredential(
      providerId: 'apple.com',
      // MUST be "apple.com"
      signInMethod: 'oauth',
      // MUST be "oauth"
      accessToken: nativeAppleCred.identityToken,
      // propagate Apple ID token to BOTH accessToken and idToken parameters
      idToken: nativeAppleCred.identityToken,
      rawNonce: nonce,
    );
  }

  /// apple specific function
  String _createNonce(int length) {
    final random = Random();
    final charCodes = List<int>.generate(length, (_) {
      int codeUnit;

      switch (random.nextInt(3)) {
        case 0:
          codeUnit = random.nextInt(10) + 48;
          break;
        case 1:
          codeUnit = random.nextInt(26) + 65;
          break;
        case 2:
          codeUnit = random.nextInt(26) + 97;
          break;
      }

      return codeUnit;
    });

    return String.fromCharCodes(charCodes);
  }

  /// Log users out
  Future<void> logout() async {
    await _auth.signOut();
    await _prefsHelper.deleteToken();
  }

  /// Get User Password from FirebaseFirestore
  /// @throws LoginException when no password is found
  Future<String> _getUserPassword() async {
    var existingProfile = await store
        .collection('users')
        .doc(_auth.currentUser.uid)
        .get()
        .catchError((e) {
      throw LoginException('Error Logging in, can\'t find access token');
    });
    if (existingProfile.data() == null) {
      _authSubject.addError('Error logging in, firebase account not found');
      throw LoginException('Error Logging in, can\'t find access token');
    }

    String password = existingProfile.data()['password'];
    if (password == null) {
      throw LoginException('Error Logging in, can\'t generate access token');
    }
    if (password.isEmpty) {
      throw LoginException('Error Logging in, can\'t generate access token');
    }

    return password;
  }
}
