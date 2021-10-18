import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_price/state_manager/container_price_state_manager/container_price_state_manager.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/container_price_state/conatiner_price_state.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/container_price_state/container_price_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class ContainerPriceScreen extends StatefulWidget {
  final ContainerPriceStateManager _stateManager;

  ContainerPriceScreen(this._stateManager);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ContainerPriceScreen> {
  ScrollController controller = ScrollController();
  late ContainerPriceState currentState;

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
      title: S.of(context).prices,
      // currentIndex: -1,
      // isResultScreen: false,
    );
  }
  @override
  void initState() {
    super.initState();
    currentState = LoadingPriceState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getPrice();
  }
  Widget Screen(){
    if(currentState is LoadingPriceState){
      return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            LoadingIndicator(AppThemeDataService.AccentColor),
          ],
        ),
      );
    }
    else if (currentState is FetchedContainerPriceSuccessfullyState){
      FetchedContainerPriceSuccessfullyState? state = currentState as FetchedContainerPriceSuccessfullyState?;
      return ContainerPriceSuccessfullyScreen(model: state!.model,
        updateContainerPrice:(model){
          // Navigator.pushNamed(context, PriceRoutes.Update_LINE_PRICE_SCREEN,arguments: {'model':model}).then((value){
          //   widget._stateManager.getPrice();
          });
        }
    else {
      return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            ErrorScreen(retry: (){},error: 'connection error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
}