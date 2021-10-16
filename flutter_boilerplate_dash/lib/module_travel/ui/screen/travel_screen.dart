import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/module_travel/state_manger/travels_state_manager.dart';
import 'package:pasco_shipping/module_travel/travel_routes.dart';
import 'package:pasco_shipping/module_travel/ui/state/travels_state/travel_state.dart';
import 'package:pasco_shipping/module_travel/ui/state/travels_state/travels_successfully.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import 'travel_filter_screen.dart';

@injectable
class TravelScreen extends StatefulWidget {
  final TravelStateManager _stateManager;

  TravelScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<TravelScreen> {
  late TravelsState currentState;
  late List<TravelModel> items;
  late String type;
  late TravelFilterRequest travelFilterRequest;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: true,
        goBack: ()  {
          // final arguments = ModalRoute.of(context)!.settings.arguments as Map;
          // TravelFilterRequest filterRequest =arguments['travelFilter'];
          Navigator.pushNamed(context, TravelRoutes.FILTER , arguments:  {'type' :type}).then((value) {
            travelFilterRequest = (value as Map)['filter'];

            widget._stateManager.getTravelWithFilter(travelFilterRequest);

          });

        },
        child: Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: S.of(context).travels
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    travelFilterRequest =arguments['travelFilter'];
    type = travelFilterRequest.type;
    travelFilterRequest.status= TravelStatusName[TravelStatus.NotReleased] ?? '';

    widget._stateManager.getTravelWithFilter(travelFilterRequest);

  }

  @override
  void initState() {
    super.initState();
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
      SuccessfullyFetchState? state = currentState as SuccessfullyFetchState?;
      items = state!.travels;
      return TravelSuccessfully(items: items ,onDelete: (id){
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          width: 150,
          title:  S.of(context).careful,
          confirmBtnText: S.of(context).ok,
          backgroundColor:AppThemeDataService.PrimaryColor,
          confirmBtnColor:AppThemeDataService.AccentColor,
          onConfirmBtnTap: (){
            Navigator.pop(context);
            widget._stateManager.deleteTravel(id.toString() ,travelFilterRequest);
          },
          text: 'Do you really want to delete the travel',
        );
      },
        onEdit: (model){
        Navigator.pushNamed(context, TravelRoutes.UPDATE ,arguments: {'travelModel':model}).then((value) {
          widget._stateManager.getTravelWithFilter(travelFilterRequest);
        });
        },
        onDetails: (id){
        Navigator.pushNamed(context, TravelRoutes.DETAILS , arguments: {'id' : id}).then((value){
          widget._stateManager.getTravelWithFilter(travelFilterRequest);
        });
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
