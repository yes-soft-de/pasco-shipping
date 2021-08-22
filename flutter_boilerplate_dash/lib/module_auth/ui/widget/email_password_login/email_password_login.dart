import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/authorization_routes.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class EmailPasswordForm extends StatefulWidget {
  final Function(String, String)? onLoginRequest;
  final String? email;
  final String? password;

  EmailPasswordForm({
    this.onLoginRequest,
    this.email,
    this.password,
  });

  @override
  State<StatefulWidget> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    _loginEmailController.text = widget.email ?? '';
    _loginPasswordController.text = widget.password ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Form(
      key: _loginFormKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: TextFormField(
                      cursorColor: AppThemeDataService.AccentColor,
                      controller: _loginEmailController,
                      decoration: InputDecoration(
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color:Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:Colors.black)),
                          labelText: S.of(context).email,
                          labelStyle: black14text),
                      style: black14text,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                      // Move focus to next
                      validator: (result) {
                        if (result == null) {
                          return S.of(context).required;
                        } else {
                          if (result.isEmpty) {
                            return S.of(context).required;
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Container(
                      child: TextFormField(
                        cursorColor: AppThemeDataService.AccentColor,
                        controller: _loginPasswordController,
                        decoration: InputDecoration(
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(color:Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:Colors.black)),
                          labelText: S.of(context).password,
                          labelStyle: black14text,
                        ),
                        style: black14text,
                        validator: (result) {
                          if (result == null) {
                            return S.of(context).passwordIsTooShort;
                          } else {
                            if (result.isEmpty) {
                              if (result.length < 5) {
                                return S.of(context).passwordIsTooShort;
                              }
                            }
                          }
                          return null;
                        },
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) =>
                            node.unfocus(), // Submit and hide keyboard
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16,),

                Container(
                  child: RoundedButton(
                    radius: 15,
                    lable: S.of(context).signIn,
                    icon: StaticImage.personRegister,
                    color: Theme.of(context).accentColor,
                    go: loading == true
                        ? () {}
                        : () {
                            if (_loginFormKey.currentState!.validate()) {
                              loading = true;
                              setState(() {});
                              widget.onLoginRequest!(
                                _loginEmailController.text,
                                _loginPasswordController.text,
                              );
                            }
                          },
                    style: white24text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Text(
                      loading == true
                          ? S.of(context).loading
                          : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppThemeDataService.PrimaryDarker
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
