import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_home/state_manager/state_manager_home.dart';
import 'package:pasco_shipping/module_home/ui/state/home_state.dart';
import 'package:pasco_shipping/module_home/ui/state/home_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class HomeScreen extends StatefulWidget {
  final HomeStateManager _stateManager;
  const HomeScreen(this._stateManager);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeState currentState;
  @override
  Widget build(BuildContext context) {
    return Background(
      goBack: () {},
      title: 'Dashboard',
      child: Screen()
    );
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingHomeState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getStatistic();
  }
  Widget Screen(){
    if(currentState is LoadingHomeState){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingIndicator(AppThemeDataService.AccentColor),
          ],
        ),
      );
    }
    else if (currentState is FetchedHomeSuccessfullyState){
      FetchedHomeSuccessfullyState? state = currentState as FetchedHomeSuccessfullyState?;
      return HomeSuccessfully(model: state!.model,);
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'connection error',),
          ],
        ),
      );
    }
  }

  // void getPro() async {
  //   await widget._profileService.getMyProfile().then((value) {
  //     ProfileRequest request = ProfileRequest(
  //         userName: value!.userName!,
  //         city: value.city!,
  //         country: value.country!,
  //         image: value.image!,
  //         location: value.location!,
  //         phone: value.phone!);
  //     setProfile(request);
  //   });
  // }
}
