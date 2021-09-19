import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_product_category/request/product_caetgory_request.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_product_sub_category/request/product__sub_caetgory_request.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class UpdateSubContractInit extends StatefulWidget {
  final List<SubContractServiceModel> services;
  final Function onUpdate;
  final SubcontractModel subProductModel;
  const UpdateSubContractInit({ required this.onUpdate,required this.services,required this.subProductModel});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<UpdateSubContractInit> {
  late TextEditingController name ;
  late  TextEditingController phone;

 late DropListModel dropListModelProducts;
 late Entry optionItemSelectedProducts;
 late List<Entry> entryProducts;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Image.asset(StaticImage.subcontract),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).service , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedProducts,
                this.dropListModelProducts,
                    (optionItem) {
                      optionItemSelectedProducts = optionItem;
                  setState(() {});
                },
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).name , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).name,
                    ),
                    controller: name,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).phone , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).phone,

                    ),
                  ),
                ),
              ),


              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                if(name.text.isEmpty || phone.text.isEmpty ) {
                  Fluttertoast.showToast(msg: S.of(context).fillAllField);
                }else {
                  SubcontractRequest re = SubcontractRequest(fullName: name.text, serviceID: optionItemSelectedProducts.id ,id: widget.subProductModel.id, phone: phone.text);
                  widget.onUpdate(re);
                }
              }, radius: 15)
            ],),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    name =TextEditingController();
    name..text=widget.subProductModel.fullName ?? '';

    phone = TextEditingController();
    phone..text = widget.subProductModel.phone??'';


    optionItemSelectedProducts =  Entry('choose', 0, []);
    entryProducts = <Entry>[];


  }

 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for(SubContractServiceModel  item in widget.services){
      if(widget.subProductModel.serviceName == item.name){
        optionItemSelectedProducts = Entry(item.name! ,item.id! ,[]);
      }
      Entry v = Entry(item.name! ,item.id! ,[]);
      entryProducts.add(v);
    }
    dropListModelProducts = DropListModel(entryProducts);
  }
}
