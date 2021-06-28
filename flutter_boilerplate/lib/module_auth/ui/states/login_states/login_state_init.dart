import 'package:pasco_shipping/module_auth/enums/user_type.dart';
import 'package:pasco_shipping/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state.dart';
import 'package:pasco_shipping/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:pasco_shipping/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:pasco_shipping/module_auth/ui/widget/user_type_selector/user_type_selector.dart';
import 'package:flutter/material.dart';

import '../../../authorization_routes.dart';

class LoginStateInit extends LoginState {
  LoginStateInit(LoginScreenState screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    print("init");
    return Column(
      children: [
        EmailPasswordForm(
          onLoginRequest: (email ,pass){
            screen.moveToNext();
          },
        )
      ],
    );
  }
}
