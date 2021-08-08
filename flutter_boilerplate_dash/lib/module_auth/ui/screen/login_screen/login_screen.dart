import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_auth/enums/user_type.dart';
import 'package:pasco_shipping/module_auth/state_manager/login_state_manager/login_state_manager.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state_success.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

@injectable
class LoginScreen extends StatefulWidget {
  final LoginStateManager _stateManager;

  LoginScreen(this._stateManager);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  UserRole? currentUserRole;

  LoginState? _currentStates;

  late StreamSubscription _stateSubscription;
  bool deepLinkChecked = false;
  UserRole? initRole;
  UserRole? get getInitRole => this.initRole;

  void refresh() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentStates = LoginStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (mounted) {
        setState(() {
          _currentStates = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var fucos = FocusScope.of(context);
          if (fucos.canRequestFocus) {
            fucos.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.blue.shade700,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(StaticImage.intro),
                    fit: BoxFit.cover,
                  )),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        'Sign In',
                        style: white24text,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      _currentStates!.getUI(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  void moveToNext() {
    // if (!inited) {
    //  //move to init screen
    //
    //   return;
    // }
    // if (currentUserRole == UserRole.ROLE_OWNER) {
    // // move to this user Role based screen
    // } else if (currentUserRole == UserRole.ROLE_CAPTAIN) {
    // //move to this user Role based screen
    // }
    print("move");
    _currentStates = LoginStateSuccess(this);
    if (mounted) setState(() {});
  }

  void loginCaptain(String phoneNumber) {
    currentUserRole = UserRole.ROLE_CAPTAIN;
    widget._stateManager.loginCaptain(phoneNumber, this);
  }

  void loginOwner(String email, String password) {
    currentUserRole = UserRole.ROLE_OWNER;
    widget._stateManager.loginOwner(email, password, this);
  }

  void confirmCaptainSMS(String smsCode) {
    currentUserRole = UserRole.ROLE_CAPTAIN;
    widget._stateManager.confirmCaptainCode(smsCode, this);
  }

  void retryPhone() {
    _currentStates = LoginStateInit(this);
    if (mounted) setState(() {});
  }

  void setRole(UserRole userType) {
    initRole = userType;
  }
}
