import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state.dart';
import 'package:pasco_shipping/module_auth/ui/widget/auth_buttons.dart';
import 'package:pasco_shipping/module_auth/ui/widget/custom_field.dart';
import 'package:pasco_shipping/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:pasco_shipping/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:pasco_shipping/module_auth/ui/widget/user_type_selector/user_type_selector.dart';
import 'package:flutter/material.dart';

import '../../../authorization_routes.dart';

class LoginStateInit extends LoginState {
  LoginStateInit(LoginScreenState screen, {String? error}) : super(screen){
    if (error != null) {
      Fluttertoast.showToast(msg: error);
    }
  }
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Stack(
        children: [
          Column(
            children: [
              EmailPasswordForm(
                onLoginRequest: (email, pass) {
                  screen.loginClient(
                     email, pass);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
