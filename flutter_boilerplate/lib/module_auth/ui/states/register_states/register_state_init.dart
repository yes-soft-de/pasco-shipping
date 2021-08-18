import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/module_auth/ui/screen/register_screen/register_screen.dart';
import 'package:pasco_shipping/module_auth/ui/states/register_states/register_state.dart';
import 'package:pasco_shipping/module_auth/ui/widget/email_password_register/email_password_register.dart';
import 'package:pasco_shipping/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:pasco_shipping/module_auth/ui/widget/user_type_selector/user_type_selector.dart';
import 'package:flutter/material.dart';

class RegisterStateInit extends RegisterState {
  RegisterStateInit(RegisterScreenState screen, {String? error, bool registered = false})
      : super(screen) {
    if (error != null) {
      Fluttertoast.showToast(msg: error);
    }
  }

  @override
  Widget getUI(BuildContext context) {
    return Column(
      children: [
        EmailPasswordRegisterForm(onRegisterRequest: (request){
          screen.registerClient(request);
        },),
      ],
    );
  }
}
