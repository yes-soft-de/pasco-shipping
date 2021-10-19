import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:pasco_shipping/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';


class LoginStateSuccess extends LoginState {
  // final bool inited;
  LoginStateSuccess(LoginScreenState screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    print("Successfully");
    Future.delayed(Duration.zero, () => _showDialog(context));
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
              // screen.moveToNext();
            },
          ),
        ),
      ],
    );
  }
  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      width: 150,
      type: CoolAlertType.success,
      // title: S.of(context).success,
      backgroundColor:AppThemeDataService.PrimaryColor,
      confirmBtnColor:AppThemeDataService.AccentColor,
      onConfirmBtnTap: (){
        Navigator.pushNamedAndRemoveUntil(
            context,
            HomeRoutes.controller,
                (route) => false);
      },
      text: S.of(context).loggedIn,
    );
  }

}
