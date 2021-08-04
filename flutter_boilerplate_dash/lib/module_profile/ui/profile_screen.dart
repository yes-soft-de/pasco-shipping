import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_profile/manager/profile_manager.dart';
import 'package:pasco_shipping/module_profile/state_manager/profile_state_manager.dart';
import 'package:pasco_shipping/module_profile/ui/state/profile_state.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import 'state/profile_successfully.dart';

@injectable
class ProfileScreen extends StatefulWidget {
  final ProfileStateManager _stateManager;

  ProfileScreen(this._stateManager);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController controller = ScrollController();
  late ProfileState currentState;

  @override
  Widget build(BuildContext context) {

    return Background(
      showFilter: false,
      goBack: (){
        Navigator.pop(context);
      },
      // controller: controller,
      // isHome: false,
      child: Screen(),
      title: S.of(context).profile,
      // currentIndex: -1,
      // isResultScreen: false,
    );
  }
  @override
  void initState() {
    super.initState();
    currentState = LoadingProfileState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getProfile();
  }
  Widget Screen(){
    if(currentState is LoadingProfileState){
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          LoadingIndicator(AppThemeDataService.AccentColor),
        ],
      );
    }
    else if (currentState is FetchedProfileSuccessfullyState){
      FetchedProfileSuccessfullyState? state = currentState as FetchedProfileSuccessfullyState?;
      return ProfileSuccessfullyScreen(model: state!.model, updateProfile: (request){
        widget._stateManager.updateProfile(request);
      },);
    }
    else {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          ErrorScreen(retry: (){},error: 'connection error',isEmptyData: false,),
        ],
      );
    }
  }
}
