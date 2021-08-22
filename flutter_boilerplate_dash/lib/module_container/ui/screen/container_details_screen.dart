
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/container_routes.dart';
import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_container/state_manger/details_container_state_manager.dart';
import 'package:pasco_shipping/module_container/ui/state/details_state/container_details_successfully.dart';
import 'package:pasco_shipping/module_container/ui/state/details_state/container_travel_details_successfully.dart';
import 'package:pasco_shipping/module_container/ui/state/details_state/details_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import 'container_shipment_review_screen.dart';

@injectable
class ContainerDetailsScreen extends StatefulWidget {
  final ContainerDetailsStateManager _stateManager;

  ContainerDetailsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ContainerDetailsScreen> {
  late ContainerDetailsState currentState;
  late ContainerDetailsModel items;
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
      widget._stateManager.getContainerDetailsAndTravels(id,request);

    }
    widget._stateManager.getContainerDetails(id);

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
      return ContainerDetailsSuccessfully(model:items ,onChangeStatus:(request){
        widget._stateManager.updateContainerStatus(request,travelRequest);
      },onShipmentReview: (model){
        Navigator.pushNamed(context, ContainerRoutes.CONTAINER_SHIPMENT_REVIEW , arguments:  model);
      }, onShowFinance: (id){
        Navigator.pushNamed(context, ContainerRoutes.CONTAINER_FINANCE ,arguments: {'id' :id});
      },
      );
    }
    else if (currentState is SuccessfullyUploadedContainerState){
      // SuccessfullyUploadedContainerState? state = currentState as SuccessfullyUploadedContainerState?;
      Fluttertoast.showToast(msg: 'Holder has been loaded onto Trip successfully');
      TravelFilterRequest travelRequest = TravelFilterRequest(type: TravelTypeName[TravelType.SEA]! ,status: TravelStatusName[TravelStatus.CURRENT]);
      return ContainerDetailsSuccessfully(model:items ,
        onChangeStatus:(request){
        widget._stateManager.updateContainerStatus(request ,travelRequest);
      },onShipmentReview: (model){
        Navigator.pushNamed(context, ContainerRoutes.CONTAINER_SHIPMENT_REVIEW , arguments:  model);
      }, onShowFinance: (id){
          Navigator.pushNamed(context, ContainerRoutes.CONTAINER_FINANCE ,arguments: {'id' :id});
        },
      );
    }
    else if (currentState is SuccessfullyDetailsWithTravelsState){
      SuccessfullyDetailsWithTravelsState? state = currentState as SuccessfullyDetailsWithTravelsState?;
      items = state!.response;
      travels = state.travels;
      return ContainerTravelDetailsSuccessfully(model:items ,
        onShipmentReview: (model){
          Navigator.pushNamed(context, ContainerRoutes.CONTAINER_SHIPMENT_REVIEW , arguments:  model);
        }, onUploadedToTravel: (addContainerToTravelRequest){
        widget._stateManager.uploadedContainerToTravel(addContainerToTravelRequest);
        }, travels: travels,
        onClearedOrArrived: (re){
        widget._stateManager.clearedOrArrived(re);
        },onShowFinance: (id){
          Navigator.pushNamed(context, ContainerRoutes.CONTAINER_FINANCE ,arguments: {'id' :id});
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