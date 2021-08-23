import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/module_auth/enums/user_type.dart';
import 'package:pasco_shipping/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state.dart';
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

  @override
  Widget getUI(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
          color: Colors.white,
          child: EmailPasswordForm(
            isLoading: false,
            onLoginRequest: (email ,pass){
              screen.loginClient(
                  email, pass);
            },
          ),
        )
      ],
    );
  }
}
