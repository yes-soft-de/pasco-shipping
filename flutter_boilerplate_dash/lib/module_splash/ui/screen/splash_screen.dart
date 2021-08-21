import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_auth/authorization_routes.dart';
import 'package:pasco_shipping/module_auth/enums/user_type.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';

@injectable
class SplashScreen extends StatefulWidget {
  final AuthService _authService;
  SplashScreen(
      this._authService,
      );
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("hello splash");
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   _getNextRoute().then((route) {
    //     Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
    //   });
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget._authService.getToken().then((value) {
      if (value == null) {
        _getNextRoute(false).then((value) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(value, (route) => false);
        });
      } else {
        _getNextRoute(true).then((value) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(value, (route) => false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(StaticImage.intro),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(StaticImage.logo),
              SizedBox(
                height: 40,
              ),
              // Container(
              //     width: 200,
              //     child: Divider(color: AppThemeDataService.PrimaryColor,thickness: 2,)),
              // Container(
              //   width: 250,
              //   child: RoundedButton(
              //       radius: 12,
              //       color: AppThemeDataService.PrimaryColor,
              //       style: white24text,
              //       icon: '',
              //       go: () {
              //         Navigator.of(context).pushNamed(
              //           IntroRoutes.WELCOME_SCREEN,
              //         );
              //       },
              //       lable: S.of(context).getStarted),
              // ),
              // Container(
              //     width: 200,
              //     child: Divider(color: AppThemeDataService.PrimaryColor,thickness: 2,)),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _getNextRoute(bool isLoggin) async {
    await Future.delayed(Duration(seconds: 3));
    if (isLoggin) {
      return HomeRoutes.Home;
    } else {
      return  AuthorizationRoutes.LOGIN_SCREEN;
    }
  }
}
