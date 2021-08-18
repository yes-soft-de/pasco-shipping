import 'package:pasco_shipping/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_auth/request/register_request/register_request.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

import '../../../authorization_routes.dart';

class EmailPasswordRegisterForm extends StatefulWidget {
  final Function(RegisterRequest)? onRegisterRequest;

  EmailPasswordRegisterForm({
    this.onRegisterRequest,
  });

  @override
  State<StatefulWidget> createState() => _EmailPasswordRegisterFormState();
}

class _EmailPasswordRegisterFormState extends State<EmailPasswordRegisterForm> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();

  bool loading = false;
  bool agreed = false;

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    Future.delayed(Duration(seconds: 30), () {
      loading = false;
      if (mounted) setState(() {});
    });
    if (mounted) setState(() {});
    return SingleChildScrollView(
      child: Form(
        key: _registerFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Container(
                    child: TextFormField(
                      controller: _registerEmailController,
                      cursorColor: AppThemeDataService.AccentColor,
                      decoration: InputDecoration(
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                              new BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppThemeDataService.AccentColor)),
                          suffixIcon: Icon(Icons.check ,color: AppThemeDataService.AccentColor,),
                          labelText: S.of(context).email,
                          labelStyle: white16text),
                      style: white16text,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                      // Move focus to next
                      validator: (result) {
                        if (result!.isEmpty) {
                          return S.of(context).required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: _registerPasswordController,
                      decoration: InputDecoration(
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                              new BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppThemeDataService.AccentColor)),
                          suffixIcon: Icon(Icons.remove_red_eye,color: AppThemeDataService.AccentColor,),
                          labelText: S.of(context).password,
                          labelStyle: white16text),
                      style: white16text,
                      validator: (result) {
                        if (result!.length < 5) {
                          return '';
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: _registerNameController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.check ,color: AppThemeDataService.AccentColor,),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                              new BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppThemeDataService.AccentColor)),
                          labelText: S.of(context).nameHere,
                          labelStyle: white16text),
                      style: white16text,
                      validator: (result) {
                        if (result!.length < 4) {
                          return '';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) =>
                          node.unfocus(), // Submit and hide keyboard
                    ),
                  ),
                ),

              ],
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
                      lable:loading ? 'Loading': S.of(context).signUp,
                      icon: StaticImage.person,
                      color: Theme.of(context).accentColor,
                      go: loading == true
                          ? () {}
                          : () {
                        if (_registerFormKey.currentState!.validate()) {
                          loading = true;
                          setState(() {});
                          RegisterRequest rre = RegisterRequest(userID: _registerEmailController.text ,password: _registerPasswordController.text,userName: _registerNameController.text);
                          widget.onRegisterRequest!(
                            rre
                          );
                        }
                      },
                      style: mainHeaderBlackStyle,
                    ),
                  ),
                ],
              ),
            ),
            // CheckboxListTile(
            //     value: agreed,
            //     title: Text(S.of(context).iAgreeToTheTermsOfServicePrivacyPolicy),
            //     onChanged: (v) {
            //       agreed = v!;
            //       if (mounted) setState(() {});
            //     }),
            // loading == true
            //     ? Text(S.of(context).loading)
            //     : Flex(
            //         direction: Axis.vertical,
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(16.0),
            //             child: GestureDetector(
            //               onTap: () {
            //                 Navigator.of(context).pop();
            //               },
            //               child: Text(
            //                 S.of(context).iHaveAnAccount,
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(16.0),
            //             child: FlatButton(
            //               padding: const EdgeInsets.all(16.0),
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(16)),
            //               color: Theme.of(context).primaryColor,
            //               onPressed: (!agreed) ? null : () {
            //                 if (_registerFormKey.currentState!.validate()) {
            //                   loading = true;
            //                   setState(() {});
            //                   widget.onRegisterRequest!(
            //                     _registerEmailController.text.trim(),
            //                     _registerPasswordController.text.trim(),
            //                     _registerNameController.text.trim(),
            //                   );
            //                 }
            //               },
            //               child: Text(
            //                 S.of(context).next,
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
          ],

        ),
      ),
    );
  }
}
