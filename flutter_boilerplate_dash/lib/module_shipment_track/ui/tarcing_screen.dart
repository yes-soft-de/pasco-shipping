import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_profile/ui/state/profile_state.dart';
import 'package:pasco_shipping/module_shipment_track/state_manager/tracking_state_manager.dart';
import 'package:pasco_shipping/module_shipment_track/ui/state/tarcking_state.dart';
import 'package:pasco_shipping/module_shipment_track/ui/state/tracking_successfully_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class TrackingScreen extends StatefulWidget {
  final TrackingStateManager _stateManager;

  TrackingScreen(this._stateManager);

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  ScrollController controller = ScrollController();
  late TrackingState currentState;

  @override
  Widget build(BuildContext context) {
    return Screen();
  }
  @override
  void initState() {
    super.initState();
    currentState = LoadingTrackingState();
    widget._stateManager.stateStream.listen((event) {
      print('newEvent'+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String trackNumber =arguments['trackNumber'];
    print(trackNumber);
    widget._stateManager.getTrackDetails(trackNumber);
  }

  Widget Screen(){
    if(currentState is LoadingTrackingState){
      return Background(
        goBack: (){
          Navigator.pop(context);
        },
        title:  S.of(context).resultTrack,
        // currentIndex: -1,
        // isResultScreen: false,
        // controller: controller,
        // isHome: false,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            LoadingIndicator(AppThemeDataService.AccentColor),
          ],
        ),
      );
    }
    else if (currentState is FetchedTrackingSuccessfullyState){
      FetchedTrackingSuccessfullyState? state = currentState as FetchedTrackingSuccessfullyState?;
      return TrackingSuccessfullyScreen(state!.model);
    }
    else {
      ErrorTrackState? state = currentState as ErrorTrackState?;
      return Background(
        goBack: (){
          Navigator.pop(context);
        },
        title:  S.of(context).resultTrack,
        // currentIndex: -1,
        // isResultScreen: false,
        // controller: controller,
        // isHome: false,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            ErrorScreen(retry: (){},error: state!.message,),
          ],
        ),
      );
    }
  }
}