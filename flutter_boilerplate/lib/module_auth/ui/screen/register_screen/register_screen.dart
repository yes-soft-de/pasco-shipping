import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_auth/enums/user_type.dart';
import 'package:pasco_shipping/module_auth/state_manager/register_state_manager/register_state_manager.dart';
import 'package:pasco_shipping/module_auth/ui/states/register_states/register_state.dart';
import 'package:pasco_shipping/module_auth/ui/states/register_states/register_state_init.dart';
import 'package:flutter/material.dart';
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
  UserRole? currentUserRole;
  UserRole? initRole;
  UserRole? get getInitRole => this.initRole;
  @override
  void initState() {
    super.initState();

    _currentState = RegisterStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      if (this.mounted) {
        setState(() {
          _currentState = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: Container(
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
                            "Sign Up",
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
      ),
    );
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  void registerCaptain(String phoneNumber) {
    currentUserRole = UserRole.ROLE_CAPTAIN;
    widget._stateManager.registerCaptain(phoneNumber, this);
  }

  void registerOwner(String email, String username, String password) {
    currentUserRole = UserRole.ROLE_OWNER;
    widget._stateManager.registerOwner(email, username, password, this);
  }

  void confirmCaptainSMS(String smsCode) {
    currentUserRole = UserRole.ROLE_CAPTAIN;
    widget._stateManager.confirmCaptainCode(smsCode);
  }

  void retryPhone() {
    currentUserRole = UserRole.ROLE_CAPTAIN;
    _currentState = RegisterStateInit(this);
  }

  void moveToNext() {
   //move to init screen
  }
  void setRole(UserRole userType) {
    initRole = userType;
  }
}
