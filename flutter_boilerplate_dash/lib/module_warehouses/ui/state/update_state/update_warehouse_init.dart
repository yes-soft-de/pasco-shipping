import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_unit/request/unit_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/alert_widget.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class UpdateWarehouseInit extends StatefulWidget {
  final Function onUpdate;
  final List<ProxyModel> proxies;
  final List<SubcontractModel> subcontract;
  final List<CountryModel> countries;
  final WarehousesModel model;
  const UpdateWarehouseInit({ required this.onUpdate,required this.proxies,required this.subcontract,required this.countries,required this.model});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<UpdateWarehouseInit> {
 late TextEditingController name ;
 late  TextEditingController city;
 late  TextEditingController location;
 late String type;
 late int selectedRadioType;
 // late int countryID = 0;
 // late int subID = 0;
 // late int proxyID =0;

 late DropListModel dropListModelSubContract;
 late DropListModel dropListModelProxy;
 late DropListModel dropListModelCountry;

 late Entry optionItemSelectedSub = Entry('choose', 0, []);
 late Entry optionItemSelectedProxy = Entry('choose', 0, []);
 late Entry optionItemSelectedCountry = Entry('choose', 0, []);

 late List<Entry> countryEntry;
 late List<Entry> proxyEntry;
 late List<Entry> subConEntry;


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
              Image.asset(StaticImage.warehouse),
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
                  Text(S.of(context).country , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedCountry,
                this.dropListModelCountry,
                    (optionItem) {
                  optionItemSelectedCountry = optionItem;
                  // countryID = optionItem.id;
                  setState(() {});
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).type+': ' , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioType(1);
                          },
                          value: 1,
                          groupValue: selectedRadioType,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).local,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioType(2);
                          },
                          value: 2,
                          groupValue: selectedRadioType,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).subcontract,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            selectedRadioType == 2?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                      SizedBox(width: 5,),
                      Text(S.of(context).subcontract , style: AppTextStyle.mediumBlackBold,)
                    ],),
                  ),
                  SelectDropList(
                    this.optionItemSelectedSub,
                    this.dropListModelSubContract,
                        (optionItem) {
                      optionItemSelectedSub = optionItem;
                      // subID = optionItem.id;
                      setState(() {});
                    },
                  ),
                ],
              ):Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                    SizedBox(width: 5,),
                    Text(S.of(context).proxies , style: AppTextStyle.mediumBlackBold,)
                  ],),
                ),
                SelectDropList(
                  this.optionItemSelectedProxy,
                  this.dropListModelProxy,
                      (optionItem) {
                    optionItemSelectedProxy = optionItem;
                    // proxyID = optionItem.id;
                    setState(() {});
                  },
                ),
              ],
            ) ,


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).city , style: AppTextStyle.mediumBlackBold,)
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
                    controller: city,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).city,

                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).location , style: AppTextStyle.mediumBlackBold,)
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
                    controller: location,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).location,

                    ),
                  ),
                ),
              ),

              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                if(name.text.isEmpty || city.text.isEmpty || location.text.isEmpty ||type.isEmpty) {
                  AlertWidget.showAlert(context, false, S.of(context).fillAllField);
                }else {
                  WarehouseRequest re = WarehouseRequest(city: city.text ,name: name.text,location: location.text,proxyID: optionItemSelectedProxy.id,subContractID: optionItemSelectedSub.id,type: type,countryID: optionItemSelectedCountry.id,rentingFee: 0 ,id: widget.model.id);
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
    name..text = widget.model.name??'';
    city = TextEditingController();
    city..text = widget.model.city ??'';
    location = TextEditingController();
    location..text=widget.model.location??'';

    type =widget.model.type!;
    if(type == 'local'){
      selectedRadioType = 1;
    }else{
      selectedRadioType = 2;
    }

    countryEntry = <Entry>[];
    proxyEntry = <Entry>[];
    subConEntry = <Entry>[];
    initList();
  }

  void initList(){
    for(CountryModel item in widget.countries){
      if(widget.model.countryName == item.name){
        optionItemSelectedCountry =Entry(item.name! ,item.id! ,[]);
      }
      Entry v = Entry(item.name! ,item.id! ,[]);
      countryEntry.add(v);
    }
    dropListModelCountry = DropListModel(countryEntry);

    for(ProxyModel item in widget.proxies){
      if(widget.model.proxyName == item.fullName){
        optionItemSelectedProxy =Entry(item.fullName! ,item.id! ,[]);
      }
      Entry v = Entry(item.fullName! ,item.id??0 ,[]);
      proxyEntry.add(v);
    }
    dropListModelProxy = DropListModel(proxyEntry);

    for(SubcontractModel item in widget.subcontract){
      if(widget.model.subContractName == item.fullName){
        optionItemSelectedSub =Entry(item.fullName! ,item.id! ,[]);
      }
      Entry v = Entry(item.fullName! ,item.id??0 ,[]);
      subConEntry.add(v);
    }
    dropListModelSubContract = DropListModel(subConEntry);
  }

 void _setSelectedRadioType(int val) {
   setState(() {
     selectedRadioType = val;
     if (val == 1) {
       type = 'local';
     } else if (val == 2) {
       type = 'subcontract';
     }
     print(val);
   });
 }
}
