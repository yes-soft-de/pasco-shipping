import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_airwaybill/state_manger/airwaybill_state_manager.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/airwaybill_state/airwaybill_state.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/airwaybill_state/airwaybill_successfully.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../airwaybill_routes.dart';

@injectable
class AirwaybillScreen extends StatefulWidget {
  final AirwaybillStateManager _stateManager;

  AirwaybillScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AirwaybillScreen> {
  late AirwaybillsState currentState;
  late List<AirwaybillModel> items;
  late String type;
  late bool isExternalWarehouse;
  late AirwaybillFilterRequest containerFilterRequest;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: true,
        goBack: ()  {
          // final arguments = ModalRoute.of(context)!.settings.arguments as Map;
          // TravelFilterRequest filterRequest =arguments['travelFilter'];
          Navigator.pushNamed(context, AirwaybillRoutes.FILTER ).then((value) {
            containerFilterRequest = (value as Map)['filter'];

            widget._stateManager.getAirwaybillsWithFilter(containerFilterRequest);

          });

        },
        child: Screen(),
        title:S.of(context).airWaybills
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    isExternalWarehouse =arguments['isExternalWarehouse'];
    containerFilterRequest.isExternalWarehouse =isExternalWarehouse;
    // type = containerFilterRequest.type!;
    widget._stateManager.getAirwaybillsWithFilter(containerFilterRequest);

  }

  @override
  void initState() {
    super.initState();
    containerFilterRequest  =AirwaybillFilterRequest();
    currentState = LoadingState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  Widget Screen(){
    if(currentState is LoadingState){
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
    else if (currentState is SuccessfullyFetchState){
      items = [];
      SuccessfullyFetchState? state = currentState as SuccessfullyFetchState?;
      items = state!.travels;
      return AirwaybillSuccessfully(items: items ,onDelete: (id){
        widget._stateManager.deleteAirwaybill(id.toString() ,containerFilterRequest);
      },
        onEdit: (model){
          Navigator.pushNamed(context, AirwaybillRoutes.UPDATE ,arguments: {'airwaybillModel':model}).then((value) {
            widget._stateManager.getAirwaybillsWithFilter(containerFilterRequest);
          });
        },
        onDetails: (id , isFull){
        Navigator.pushNamed(context, AirwaybillRoutes.DETAILS , arguments: {'id' : id,'isFull':isFull}).then((value){
          widget._stateManager.getAirwaybillsWithFilter(containerFilterRequest);
        });
        }, onSearch: (number){
        containerFilterRequest.airwaybillNumber = number;
          widget._stateManager.getAirwaybillsWithFilter(containerFilterRequest);
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
    else if(currentState is ErrorState) {
      ErrorState? state = currentState as ErrorState?;
      bool   empty = state!.isEmptyData;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: state.error,isEmptyData: empty,),
          ],
        ),
      );
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'Error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
}
