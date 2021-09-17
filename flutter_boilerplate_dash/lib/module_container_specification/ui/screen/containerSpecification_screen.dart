import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_container_specification/state_manger/container_specification_state_manager.dart';
import 'package:pasco_shipping/module_container_specification/ui/state/containerSpecifications_state/containerSpecification_state.dart';
import 'package:pasco_shipping/module_container_specification/ui/state/containerSpecifications_state/containerSpecification_successfully.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class ContainerSpecificationsScreen extends StatefulWidget {
  final ContainerSpecificationStateManager _stateManager;

  ContainerSpecificationsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ContainerSpecificationsScreen> {
  late ContainerSpecificationsState currentState;
  late List<ContainerSpecificationModel> items;
  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title:S.of(context).containerSpecification
    );
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
    widget._stateManager.getContainerSpecifications();
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
      items = state!.distributors;
      return ContainerSpecificationsSuccessfully(items: items ,
        onDelete: (id){
        // widget._stateManager.deleteSupplier(id.toString());
      },
        onEdit: (request){
          // widget._stateManager.updateSupplier(request);
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