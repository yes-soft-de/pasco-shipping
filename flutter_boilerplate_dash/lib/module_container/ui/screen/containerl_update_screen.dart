import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/state_manger/new_container_state_manger.dart';
import 'package:pasco_shipping/module_container/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_container/ui/state/update_state/update_container_init.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';
import 'package:pasco_shipping/module_shipper/shipper_routes.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_sub_contract/subcontract_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class UpdateContainer extends StatefulWidget {
  final AddContainerStateManager _stateManager;

  const UpdateContainer(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<UpdateContainer> {
  late AddContainerState currentState;
  late List<SubcontractModel> subs;
  late List<ContainerSpecificationModel> specification;
  late List<ShipperModel> shippers;
  late List<HarborModel> harbors;
  late List<Countries> countries;
  late ContainerModel model;
  late Entry option;

  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child:  Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 600
              ),
              child:  Screen(   )))),
        title: S.of(context).updateContainer
    );
  }


  @override
  void initState() {
    super.initState();
    currentState = LoadingAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        if(currentState is SuccessfullyAddState){
          Navigator.pop(context,option);
        }else {
          setState(() {});
        }
      }
    });
    widget._stateManager.getSubContractAndSpecificationAndShipper();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    model =arguments['containerModel'];
  }
  Widget Screen(){
    if(currentState is LoadingAddState){
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
    else if (currentState is InitAddState){
      InitAddState? state = currentState as InitAddState?;
      specification = state!.specifications;
      subs = state.subcontracts;
      harbors = state.harbor;
      shippers = state.shippers;
      countries = state.countries;
      return UpdateContainerInit(
        goToShipper: (){
          Navigator.pushNamed(context, ShipperRoutes.ADD_NEW).then((value) {
            widget._stateManager.getSubContractAndSpecificationAndShipper();

          });
        },
        goToSubcontract: (){
          Navigator.pushNamed(context, SubcontractRoutes.ADD_NEW).then((value) {
            widget._stateManager.getSubContractAndSpecificationAndShipper();
          });
        },
        specifications: specification,
        subContracts: subs,
        model: model,
        shippers: shippers,
        onUpdate: (request , c){
          option = c;
        widget._stateManager.updateContainer(request);
      },);
    }else if (currentState is ErrorAddState){
      ErrorAddState? state = currentState as ErrorAddState?;
      Fluttertoast.showToast(msg: state!.error);
      return UpdateContainerInit(
          goToShipper: (){
            Navigator.pushNamed(context, ShipperRoutes.ADD_NEW).then((value) {
              widget._stateManager.getSubContractAndSpecificationAndShipper();

            });
          },
          goToSubcontract: (){
            Navigator.pushNamed(context, SubcontractRoutes.ADD_NEW).then((value) {
              widget._stateManager.getSubContractAndSpecificationAndShipper();
            });
          },
        specifications: specification,
        subContracts: subs,
        model: model,
        shippers: shippers,
        onUpdate: (request , c){
          option = c;
          widget._stateManager.updateContainer(request);
        },);
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
