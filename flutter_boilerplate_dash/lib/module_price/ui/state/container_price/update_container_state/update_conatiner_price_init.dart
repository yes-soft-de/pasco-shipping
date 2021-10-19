import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/container_price_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class UpdateContainerPriceInit extends StatefulWidget {
  // final List<SubcontractModel> subContracts;
  final List<Countries> countriesExports;
  final List<HarborModel> harbors;
  final List<ContainerSpecificationModel> specification;
  final ContainerPriceModel model;
  final Function onUpdate;
  const UpdateContainerPriceInit({required this.countriesExports , required this.specification, required this.harbors,required this.onUpdate,required this.model });

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<UpdateContainerPriceInit> {
  late TextEditingController price ;
  // late TextEditingController oneKiloPrice ;



  late DropListModel dropListModelFromCountries;
  late DropListModel dropListModelHarbor;
  late DropListModel dropListModelSpecification;

  late Entry optionItemSelectedFrom;
  late Entry optionItemSelectedHarbor;
  late Entry optionItemSelectedSpecification;

  late List<Entry> entryFrom;
  late List<Entry> entryHarbor;
  late List<Entry> entrySpecification;

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

  void initHarbor(){
    for(HarborModel  item in widget.harbors){
      Entry v = Entry(item.name! ,item.id! ,[]);
      entryHarbor.add(v);
    }
    dropListModelHarbor = DropListModel(entryHarbor);
  }
  void initSpecification(){
    for(ContainerSpecificationModel  item in widget.specification){
      Entry v = Entry(item.name! ,item.id! ,[]);
      entrySpecification.add(v);
    }
    dropListModelSpecification = DropListModel(entrySpecification);
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
                  Text(S.of(context).type, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedSpecification,
                this.dropListModelSpecification,
                    (optionItem) {
                  optionItemSelectedSpecification = optionItem;
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
                  Text(S.of(context).harbors, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedHarbor,
                this.dropListModelHarbor,
                    (optionItem) {
                  optionItemSelectedHarbor = optionItem;
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
                  Text(S.of(context).prices , style: AppTextStyle.mediumBlackBold,)
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
                    ),
                    controller: price,
                  ),
                ),
              ),


              RoundedButton(lable: S.of(context).edit, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                ContainerPriceRequest re = ContainerPriceRequest(
                    id:widget.model.id,
                    price: int.parse(price.text),
                    exportCity: optionItemSelectedFrom.title,
                    exportCountryID: optionItemSelectedFrom.id,
                    containerSpecificationID: optionItemSelectedSpecification.id,
                    destinationPortID: optionItemSelectedHarbor.id
                );
                print(re.exportCity);
                print(re.exportCountryID);
                widget.onUpdate(re);

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
    initHarbor();
    initSpecification();


    optionItemSelectedHarbor = Entry('choose', 0, []);
    optionItemSelectedSpecification= Entry('choose', 0, []);
    optionItemSelectedFrom = Entry('choose', 0, []);

  }

  @override
  void initState() {
    super.initState();
    entryFrom =[];
    entryHarbor=[];
    entrySpecification=[];
    price = TextEditingController();
    price..text = widget.model.price??'0';



  }





}