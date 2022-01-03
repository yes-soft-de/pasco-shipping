import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_employees/response/employees_response.dart';
import 'package:pasco_shipping/module_employees/state_manger/employees_state_manager.dart';
import 'package:pasco_shipping/module_employees/ui/state/suppliers_state/employee_successfully.dart';
import 'package:pasco_shipping/module_employees/ui/state/suppliers_state/employees_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../employee_routes.dart';

@injectable
class EmployeesScreen extends StatefulWidget {
  final EmployeeStateManager _stateManager;

  EmployeesScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<EmployeesScreen> {
  late EmployeesState currentState;
  late List<EmployeeModel> items;
  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child:Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: S.of(context).employees
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
    widget._stateManager.getEmployees();
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
      return EmployeesSuccessfully(items: items ,onDelete: (id){

        CoolAlert.show(
            width: 150,
          context: context,
          type: CoolAlertType.warning,
          title:  S.of(context).deleteClient,
          confirmBtnText: S.of(context).ok,
          backgroundColor:AppThemeDataService.PrimaryColor,
          confirmBtnColor:AppThemeDataService.AccentColor,
          onConfirmBtnTap: () {
            Navigator.pop(context);
            widget._stateManager.deleteEmployee(id.toString());
          });
      },
        onEdit: (request){
           widget._stateManager.updateEmployee(request);
        }, onEditRole: (model){
        Navigator.pushNamed(context, EmployeeRoutes.UPDATE,arguments: {'model':model} ).then((value) {
          widget._stateManager.getEmployees();
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
