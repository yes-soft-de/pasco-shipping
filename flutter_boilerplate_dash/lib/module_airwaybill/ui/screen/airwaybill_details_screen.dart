
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_details_response.dart';
import 'package:pasco_shipping/module_airwaybill/state_manger/details_airwaybill_state_manager.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/details_state/airwaybill_details_successfully.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/details_state/airwaybill_travel_details_successfully.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/details_state/details_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../airwaybill_routes.dart';


@injectable
class AirwaybillDetailsScreen extends StatefulWidget {
  final AirwaybillDetailsStateManager _stateManager;

  AirwaybillDetailsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AirwaybillDetailsScreen> {
  late AirwaybillDetailsState currentState;
  late AirwaybillDetailsModel items;
  late List<TravelModel> travels;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title:S.of(context).details
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String id =arguments['id'].toString();
    bool isFull = arguments['isFull'];
    if(isFull){
      TravelFilterRequest request = TravelFilterRequest(type: TravelTypeName[ TravelType.SEA]!);
      widget._stateManager.getAirwaybillDetailsAndTravels(id);

    }
    widget._stateManager.getAirwaybillDetails(id);

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

      TravelFilterRequest travelRequest = TravelFilterRequest(type: TravelTypeName[TravelType.SEA]! ,status: TravelStatusName[TravelStatus.CURRENT]);
      return AirwaybillDetailsSuccessfully(model:items ,onChangeStatus:(request){
        widget._stateManager.updateAirwaybillStatus(request,travelRequest);
      },onShipmentReview: (model){
        Navigator.pushNamed(context, AirwaybillRoutes.AIRWAYBILL_SHIPMENT_REVIEW, arguments:  model);
      }, onShowFinance: (id){
        Navigator.pushNamed(context, AirwaybillRoutes.FINANCE ,arguments: {'id' :id});
      },
      );
    }
    else if (currentState is SuccessfullyUploadedContainerState){
      // SuccessfullyUploadedContainerState? state = currentState as SuccessfullyUploadedContainerState?;
      Fluttertoast.showToast(msg: 'Holder has been loaded onto Trip successfully');
      TravelFilterRequest travelRequest = TravelFilterRequest(type: TravelTypeName[TravelType.SEA]! ,status: TravelStatusName[TravelStatus.CURRENT]);
      return AirwaybillDetailsSuccessfully(model:items ,
        onChangeStatus:(request){
        widget._stateManager.updateAirwaybillStatus(request ,travelRequest);
      },onShipmentReview: (model){
        Navigator.pushNamed(context, AirwaybillRoutes.AIRWAYBILL_SHIPMENT_REVIEW , arguments:  model);
      }, onShowFinance: (id){
          Navigator.pushNamed(context, AirwaybillRoutes.FINANCE ,arguments: {'id' :id});

        },
      );
    }
    else if (currentState is SuccessfullyDetailsWithTravelsState){
      SuccessfullyDetailsWithTravelsState? state = currentState as SuccessfullyDetailsWithTravelsState?;
      items = state!.response;
      // travels = state.travels;
      return AirWaybillTravelDetailsSuccessfully(model:items ,
        onShipmentReview: (model){
          Navigator.pushNamed(context, AirwaybillRoutes.AIRWAYBILL_SHIPMENT_REVIEW , arguments:  model);
        }, onUploadedToTravel: (addContainerToTravelRequest){
        widget._stateManager.uploadedAirwaybillToTravel(addContainerToTravelRequest);
        },
        onClearedOrArrived: (re){
        widget._stateManager.clearedOrArrived(re);
        },
      );
    }
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