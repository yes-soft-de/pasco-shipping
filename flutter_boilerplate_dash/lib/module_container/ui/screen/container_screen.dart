import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/state_manger/container_state_manager.dart';
import 'package:pasco_shipping/module_container/ui/state/container_state/container_state.dart';
import 'package:pasco_shipping/module_container/ui/state/container_state/container_successfully.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../container_routes.dart';
import 'container_filter_screen.dart';

@injectable
class ContainerScreen extends StatefulWidget {
  final ContainerStateManager _stateManager;

  ContainerScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ContainerScreen> {
  late ContainersState currentState;
  late List<ContainerModel> items;
  late String type;
  late bool isExternalWarehouse;
  late ContainerFilterRequest containerFilterRequest;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: true,
        goBack: ()  {
          // final arguments = ModalRoute.of(context)!.settings.arguments as Map;
          // TravelFilterRequest filterRequest =arguments['travelFilter'];
          Navigator.pushNamed(context, ContainerRoutes.FILTER ).then((value) {
            containerFilterRequest = (value as Map)['filter'];

            widget._stateManager.getContainersWithFilter(containerFilterRequest);

          });

        },
        child: Screen(),
        title: S.of(context).containers
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    isExternalWarehouse =arguments['isExternalWarehouse'];
    containerFilterRequest.isExternalWarehouse = isExternalWarehouse;
    // type = containerFilterRequest.type!;
    widget._stateManager.getContainersWithFilter(containerFilterRequest);

  }

  @override
  void initState() {
    super.initState();
    containerFilterRequest  =ContainerFilterRequest();
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
      return ContainerSuccessfully(items: items ,onDelete: (id){
        widget._stateManager.deleteContainer(id.toString() ,containerFilterRequest);
      },
        onEdit: (model){
          Navigator.pushNamed(context, ContainerRoutes.UPDATE ,arguments: {'containerModel':model}).then((value) {
            widget._stateManager.getContainersWithFilter(containerFilterRequest);
          });
        },
        onDetails: (id , isFull){
        Navigator.pushNamed(context, ContainerRoutes.DETAILS , arguments: {'id' : id,'isFull':isFull}).then((value){
          widget._stateManager.getContainersWithFilter(containerFilterRequest);
        });
        }, onSearch: (number){
        containerFilterRequest.containerNumber = number;
          widget._stateManager.getContainersWithFilter(containerFilterRequest);
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
