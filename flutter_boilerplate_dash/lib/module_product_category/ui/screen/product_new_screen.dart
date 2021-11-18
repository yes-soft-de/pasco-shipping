import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_product_category/state_manger/new_product_state_manger.dart';
import 'package:pasco_shipping/module_product_category/ui/state/addnew_state/add_product_init.dart';
import 'package:pasco_shipping/module_product_category/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_subcontract_services/state_manger/new_contract_service_state_manger.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewProduct extends StatefulWidget {
  final AddProductStateManager  _stateManager;

  const AddNewProduct(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewProduct> {
  late AddProductState currentState;

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
        title: S.of(context).addNewCategory
    );
  }


  @override
  void initState() {
    super.initState();
    currentState = InitAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    // widget._stateManager.getCountries();
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
      return AddProductInit(onSave: (request){
        widget._stateManager.createSubContractService(request);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
      return AddProductInit(onSave: (request){
        widget._stateManager.createSubContractService(request);
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
