import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/request/register_request/register_request.dart';
import 'package:pasco_shipping/module_auth/state_manager/register_state_manager/register_state_manager.dart';
import 'package:pasco_shipping/module_auth/ui/states/register_states/register_state.dart';
import 'package:pasco_shipping/module_auth/ui/states/register_states/register_state_init.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

@injectable
class RegisterScreen extends StatefulWidget {
  final RegisterStateManager _stateManager;

  RegisterScreen(this._stateManager);

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  late RegisterState _currentState;
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;
  int? returnToMainScreen;
  bool? returnToPreviousScreen;
  @override
  void initState() {
    super.initState();
    loadingSnapshot = AsyncSnapshot.nothing();
    _currentState = RegisterStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (this.mounted) {
        setState(() {
          _currentState = event;
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
                                'Sign Up',
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
                    _currentState.getUI(context),
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

  void refresh() {
    if (mounted) setState(() {});
  }

  void registerClient(RegisterRequest request) {
    widget._stateManager.registerClient(request, this);
  }

  void moveToNext()async {
    Navigator.of(context).pop();
    await Fluttertoast.showToast(msg: S.current.registerSuccess);
  }
  Future<void> userRegistered() async{
    await Fluttertoast.showToast(msg: S.current.registerSuccess);
    // await CustomFlushBarHelper.createSuccess(title: S.current.warnning, message:S.current.registerSuccess,timeout: 2).show(context);
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }
}
