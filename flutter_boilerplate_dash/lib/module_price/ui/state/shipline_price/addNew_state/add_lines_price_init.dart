import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AddShippingLinePriceInit extends StatefulWidget {
  // final List<SubcontractModel> subContracts;
  final List<Countries> countriesImports;
  final List<Countries> countriesExports;
  final Function onSave;
  const AddShippingLinePriceInit({required this.countriesExports , required this.countriesImports,required this.onSave });

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<AddShippingLinePriceInit> {
  late TextEditingController oneCPMPrice ;
  late TextEditingController oneKiloPrice ;



  late DropListModel dropListModelFromCountries;
  late DropListModel dropListModelToCountries;
  late Entry optionItemSelectedFrom;
  late Entry optionItemSelectedTo;

  late List<Entry> entryFrom;
  late List<Entry> entryTo;

  void initShippingFrom() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.countriesExports) {
      if (item.warehouses!.isNotEmpty && item.type=='export') {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (Warehouse warehouseItem in item.warehouses!) {
          print(warehouseItem.countryName);
          Entry warehouse = Entry(warehouseItem.city!, country.id, []);
          children.add(warehouse);
        }
        country.children = children;
        entryFrom.add(country);
      }
    }
    dropListModelFromCountries = DropListModel(entryFrom);
  }
  void initShippingTo() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.countriesImports) {
      if (item.warehouses!.isNotEmpty && item.type=='import') {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (Warehouse warehouseItem in item.warehouses!) {
          print(warehouseItem.countryName);
          Entry warehouse = Entry(warehouseItem.city!, country.id, []);
          children.add(warehouse);
        }
        print('Hii');
        print(children.length);
        country.children = children;
        entryTo.add(country);
      }
    }
    dropListModelToCountries = DropListModel(entryTo);
  }

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
              Image.asset(StaticImage.price),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).from, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropListl(
                this.optionItemSelectedFrom,
                this.dropListModelFromCountries,
                    (optionItem) {
                      optionItemSelectedFrom = optionItem;
                      print(optionItem.title);
                      print(optionItem.id);
                  // widget.shipmentRequest.exportWarehouseID =optionItem.id;
                  // widget.shipmentRequest.exportWarehouseName =optionItem.title;
                  setState(() {});
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).to, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropListl(
                this.optionItemSelectedTo,
                this.dropListModelToCountries,
                    (optionItem) {
                  optionItemSelectedTo = optionItem;
                  // widget.shipmentRequest.exportWarehouseID =optionItem.id;
                  // widget.shipmentRequest.exportWarehouseName =optionItem.title;
                  setState(() {});
                },
              ),

                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).oneKiloPrice , style: AppTextStyle.mediumBlackBold,)
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).number,
                      suffix: Text('USD',style: TextStyle(color: Colors.blue),),
                    ),
                    controller: oneKiloPrice,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).oneCBMPrice , style: AppTextStyle.mediumBlackBold,)
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).number,
                      suffix: Text('USD',style: TextStyle(color: Colors.blue),),
                    ),
                    controller: oneCPMPrice,
                  ),
                ),
              ),

              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){


                ShippingLinePriceRequest re = ShippingLinePriceRequest(
                    oneCBMPrice: double.parse(oneCPMPrice.text),
                    oneKiloPrice:  double.parse(oneKiloPrice.text),
                  exportCity: optionItemSelectedFrom.title,
                  exportCountryID: optionItemSelectedFrom.id,
                  importCity: optionItemSelectedTo.title,
                  importCountryID: optionItemSelectedTo.id
                );
                print(re.exportCity);
                print(re.exportCountryID);

                print(re.importCity);
                print(re.importCountryID);
                widget.onSave(re);

              }, radius: 15)
            ],),
          ),
        ),
      ),
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initShippingFrom();
    initShippingTo();
  }

  @override
  void initState() {
    super.initState();
    entryFrom =[];
    entryTo=[];
    oneCPMPrice = TextEditingController();
    oneKiloPrice = TextEditingController();
    optionItemSelectedTo = Entry('choose', 0, []);
    optionItemSelectedFrom = Entry('choose', 0, []);

  }





}