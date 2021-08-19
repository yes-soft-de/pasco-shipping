
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/module_travel/state_manger/details_travel_state_manager.dart';
import 'package:pasco_shipping/module_travel/travel_routes.dart';
import 'package:pasco_shipping/module_travel/ui/state/details_state/details_state.dart';
import 'package:pasco_shipping/module_travel/ui/state/details_state/travel_details_successfully.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class TravelDetailsScreen extends StatefulWidget {
  final TravelDetailsStateManager _stateManager;

  TravelDetailsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<TravelDetailsScreen> {
  late TravelDetailsState currentState;
  late TravelDetailsModel items;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title:'Details'
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String id =arguments['id'].toString();
    widget._stateManager.getTravelDetails(id);

  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingDetailsState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  Widget Screen(){
    if(currentState is LoadingDetailsState){
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
    else if (currentState is SuccessfullyDetailsState){
      SuccessfullyDetailsState? state = currentState as SuccessfullyDetailsState?;
      items = state!.response;
      return TravelDetailsSuccessfully(model: items,onChangeStatus: (request){
        widget._stateManager.updateTravelStatus(request);
      },onShowFinance: (id){
       Navigator.pushNamed(context, TravelRoutes.FINANCE ,arguments: {'id' :id});
      },
      );
    }
    // else if(currentState is SuccessfullyModifyMarkState){
    //   SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
    //   items = state.marks;
    //   // Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
    //   _markNumberController.clear();
    //   return MarkSuccessfullyScreen(deleteMark: (id){
    //     widget._stateManager.deleteMark(id.toString());
    //   }, items: items, addMark: (request){
    //     widget._stateManager.createMark(request);
    //   },markNumberController: _markNumberController,);
    // }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
}