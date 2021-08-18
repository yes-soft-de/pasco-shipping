import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_auth/state_manager/login_state_manager/login_state_manager.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state_success.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
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

  late LoginState _currentStates;
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;
  bool deepLinkChecked = false;
  void refresh() {
    if (mounted) setState(() {});
  }
  int? returnToMainScreen;
  bool? returnToPreviousScreen;
  @override
  void initState() {
    super.initState();
    loadingSnapshot = AsyncSnapshot.nothing();
    _currentStates = LoginStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (mounted) {
        setState(() {
          _currentStates = event;
        });
      }
    });
    widget._stateManager.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
  }
  dynamic args;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.3),
        body:
        // loadingSnapshot.connectionState != ConnectionState.waiting ?
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(StaticImage.intro),
                fit: BoxFit.cover,
              )),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 20),
                            child: Text(
                              "Sign In",
                              style: titleBlackStyle,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    StaticImage.divider,
                    width: MediaQuery.of(context).size.width,
                  ),
                  _currentStates.getUI(context),
                ],
              ),
            ),
          ),
        )

        //     : Stack(
        //   children: [
        //     _currentStates.getUI(context),
        //     Container(
        //       width: double.maxFinite,
        //       color: Colors.transparent.withOpacity(0.0),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }
  void loginClient(String email, String password) {
    widget._stateManager.loginClient(email, password, this);
  }

  void moveToNext() {
    if (returnToMainScreen != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(HomeRoutes.Home, (route) => false,arguments: returnToMainScreen);
    }
    else if (returnToPreviousScreen != null ){
      Navigator.of(context).pop();
    }
    else {
      Navigator.of(context).pushNamedAndRemoveUntil(HomeRoutes.Home, (route) => false);
    }
    // CustomFlushBarHelper.createSuccess(title:S.current.warnning, message: S.current.loginSuccess).show(context);
  }
}
