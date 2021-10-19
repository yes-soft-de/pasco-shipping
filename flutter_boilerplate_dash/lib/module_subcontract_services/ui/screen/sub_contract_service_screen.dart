import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_subcontract_services/state_manger/sub_contract_services_state_manager.dart';
import 'package:pasco_shipping/module_subcontract_services/ui/state/sub_contract_service_state/sub_contract_service_state.dart';
import 'package:pasco_shipping/module_subcontract_services/ui/state/sub_contract_service_state/sub_contract_service_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class SubContractServiceScreen extends StatefulWidget {
  final SubContractServiceStateManager _stateManager;

  SubContractServiceScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<SubContractServiceScreen> {
  late SubContractServiceState currentState;
  late List<SubContractServiceModel> items;
  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
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
        title: S.of(context).subcontractService
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
    widget._stateManager.getSubContractServices();
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
      return SubContractServiceSuccessfully(items: items ,onDelete: (id){
        widget._stateManager.deleteSubContractService(id.toString());
      },
        onEdit: (request){
          widget._stateManager.updateSubContractService(request);
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
