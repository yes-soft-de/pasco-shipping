import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/enums/auth_source.dart';
import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_auth/ui/widget/auth_options_form/auth_options_form.dart';

import '../../../../module_auth/ui/states/auth_states/auth_state.dart';
import '../../../../module_auth/ui/widget/email_password_login/email_password_login.dart';
import '../../../../module_auth/ui/widget/phone_login/phone_login.dart';

class AuthStateInit extends AuthState {
  AuthStateInit(AuthStateManager stateManager) : super(stateManager);

  @override
  Widget getUI(BuildContext context) {
    return AuthOptionsForm(
      requestPhoneSignIn: (phone) {
        stateManager.signInWithPhone(phone, UserRole.ROLE_OWNER);
      },
      requestAppleSignIn: () {
        stateManager.signInWithApple(UserRole.ROLE_OWNER);
      },
      requestEmailAndPasswordSignIn: (email, password) {
        stateManager.signInWithEmailAndPassword(email, password, UserRole.ROLE_OWNER);
      },
      requestGoogleSignIn: () {
        stateManager.signInWithGoogle(UserRole.ROLE_OWNER);
      },
    );
  }
}
