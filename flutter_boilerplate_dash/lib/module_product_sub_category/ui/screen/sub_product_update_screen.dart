import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';
import 'package:pasco_shipping/module_product_sub_category/state_manger/new_sub_product_state_manger.dart';
import 'package:pasco_shipping/module_product_sub_category/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_product_sub_category/ui/state/update_state/update_sub_product_init.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class UpdateSubProduct extends StatefulWidget {
  final AddSubProductStateManager  _stateManager;

  const UpdateSubProduct(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<UpdateSubProduct> {
  late AddSubProductState currentState;
  late List<ProductModel> products;
  late SubProductModel model;

  @override
  Widget build(BuildContext context) {

    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: S.of(context).add
    );
  }


  @override
  void initState() {
    super.initState();
    products = [];
    currentState = LoadingAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        if(currentState is SuccessfullyAddState){
          Navigator.pop(context);
        }else {
          setState(() {});
        }
      }
    });
    widget._stateManager.getProducts();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    model =arguments['subProductModel'];
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
      products = state!.products;
      return UpdateSubProductInit(onUpdate: (request){
        widget._stateManager.updateSubProduct(request);
      }, products:products, subProductModel: model,);
    }
    // else if (currentState is SuccessfullyAddState){
    //   Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
    //   return Container();
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
