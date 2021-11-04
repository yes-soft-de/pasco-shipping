import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_subcontract_services/request/sub_contract_service_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AddSubContractServiceInit extends StatefulWidget {
  final Function onSave;
  const AddSubContractServiceInit({ required this.onSave});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<AddSubContractServiceInit> {
 late TextEditingController name ;
 late  TextEditingController description;
 late List<Category> services;


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
              Image.asset(StaticImage.service),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).service , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing:30,
                  runSpacing: 10.0,
                  children: services.map((item) {
                    var index = services.indexOf(item);
                    return InkWell(
                        onTap: () {
                          setState(() {
                            services.forEach((element) {
                              element.isSelected = false;
                            });
                          });
                          services[index].isSelected = true;
                          name.text= services[index].name;
                        },
                        child: ChoiceCard(item));
                  }).toList(),
                ),
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
                      hintText: S.of(context).service,
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
                  Text(S.of(context).description , style: AppTextStyle.mediumBlackBold,)
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
                    controller: description,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).description,

                    ),
                  ),
                ),
              ),

              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                if(name.text.isEmpty || description.text.isEmpty) {
                  Fluttertoast.showToast(msg: S.of(context).fillAllField);
                }else {
                  SubContractServiceRequest re = SubContractServiceRequest(description: description.text ,name: name.text );
                  widget.onSave(re);
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
    description = TextEditingController();
    services= [
      Category(id: 0, name: 'تخليص جمركي-Customs Clearance' , description: '', isSelected: false),
      Category(id: 0, name: 'LOGISTIC SERVICES & STORING MANAGEMENT' , description: '', isSelected: false),
      Category(id: 0, name: 'IMPORT AND EXPORT' , description: '', isSelected: false),
      Category(id: 0, name: 'CASH ON PURCHASE' , description: '', isSelected: false),
      Category(id: 0, name: 'UNLOADING CHARGES' , description: '', isSelected: false),
      Category(id: 0, name: 'LOADING CHARGES' , description: '', isSelected: false),
      Category(id: 0, name: 'Air freight' , description: '', isSelected: false),
      Category(id: 0, name: 'LCL Sea freight -شحن بحري مشترك' , description: '', isSelected: false),
      Category(id: 0, name: 'شحن حاوية كاملة-FCL Sea freight' , description: '', isSelected: false),
      Category(id: 0, name: 'Consignee' , description: '', isSelected: false),
      Category(id: 0, name: 'Container providing' , description: '', isSelected: false),
      Category(id: 0, name: 'Air waybill providing' , description: '', isSelected: false),
      Category(id: 0, name: 'Travels providing' , description: '', isSelected: false),
      Category(id: 0, name: 'Carrier' , description: '', isSelected: false),
    ];
  }

}
