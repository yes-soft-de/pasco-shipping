import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/state_manager/login_state_manager/login_state_manager.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_auth/ui/states/login_states/login_state_success.dart';
import 'package:pasco_shipping/module_employees/enums/employee_role.dart';
import 'package:pasco_shipping/module_employees/service/employees_service.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

@injectable
class LoginScreen extends StatefulWidget {
  final LoginStateManager _stateManager;
  final EmployeeService _employeeService;

  LoginScreen(this._stateManager, this._employeeService);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  late LoginState _currentStates;
  // late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;
  // bool deepLinkChecked = false;
  void refresh() {
    if (mounted) setState(() {});
  }
  // int? returnToMainScreen;
  // bool? returnToPreviousScreen;
  @override
  void initState() {
    super.initState();
    // loadingSnapshot = AsyncSnapshot.nothing();
    _currentStates = LoginStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (mounted) {
        setState(() {
          _currentStates = event;
        });
      }
    });
    // widget._stateManager.loadingStream.listen((event) {
    //   if (this.mounted) {
    //     setState(() {
    //       loadingSnapshot = event;
    //     });
    //   }
    // });
  }
  dynamic args;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var fucos = FocusScope.of(context);
          if (fucos.canRequestFocus) {
            fucos.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.blue.shade700,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(StaticImage.intro),
                        fit: BoxFit.cover,
                      )),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        S.of(context).signIn,
                        style: white24text,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      _currentStates.getUI(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));

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
    widget._employeeService.getEmployeeProfile().then((employModel) {
      if(employModel != null) {
        ConstVar.Roles = employModel.roles!;
        Navigator.of(context).pushNamedAndRemoveUntil(HomeRoutes.controller, (route) => false);
      }

    });
    // CustomFlushBarHelper.createSuccess(title:S.current.warnning, message: S.current.loginSuccess).show(context);
  }
}
