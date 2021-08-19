import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class FilterAirwaybillInit extends StatefulWidget {
  final List<SubcontractModel> subContracts;
  final Function onSave;
  // final String type;
  const FilterAirwaybillInit({ required this.onSave , required this.subContracts});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<FilterAirwaybillInit> {
 // late TextEditingController travelNumber ;
  late AirwaybillFilterRequest containerFilterRequest;

 late DropListModel dropListModelSubContract;
 late Entry optionItemSelectedSubContract;
 late List<Entry> entrySub;

  late DropListModel dropListModelShipper;
  late Entry optionItemSelectedShipper;
  late List<Entry> entryShipper;

  late DropListModel dropListModelConsign;
  late Entry optionItemSelectedConsign;
  late List<Entry> entryConsign;

 // late String status;
 // late String type;
 // late int selectedRadioType;
 // late int shipperID;

 // TimeOfDay selectedTimeStart = TimeOfDay.now();
 // TimeOfDay selectedTimeEnd = TimeOfDay.now();
 //
 // DateTime now = DateTime.now();
 //
 // DateTime startDate = DateTime.now();
 // DateTime endDate = DateTime.now();
 // var formatter = new DateFormat('dd-MM-yyyy');
 // late String formattedDateStart;
 // late String formattedDateEnd;
 //
 //  late String formattedTimeStart;
 //  late String formattedTimeEnd;

 late List<Category> status;
 late List<Category> typeList;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text('Status :' , style: AppTextStyle.mediumBlackBold,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing:30,
                runSpacing: 10.0,
                children: status.map((item) {
                  var index = status.indexOf(item);
                  return InkWell(
                      onTap: () {
                        setState(() {
                          status.forEach((element) {
                            element.isSelected = false;
                          });
                        });
                        status[index].isSelected = true;
                        containerFilterRequest.status = status[index].description;
                      },
                      child: ChoiceCard(item));
                }).toList(),
              ),
            ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Type :' , style: AppTextStyle.mediumBlackBold,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing:30,
                  runSpacing: 10.0,
                  children: typeList.map((item) {
                    var index = typeList.indexOf(item);
                    return InkWell(
                        onTap: () {
                          setState(() {
                            typeList.forEach((element) {
                              element.isSelected = false;
                            });
                          });
                          typeList[index].isSelected = true;
                          containerFilterRequest.type = typeList[index].description;
                        },
                        child: ChoiceCard(item));
                  }).toList(),
                ),
              ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sub Contract' , style: AppTextStyle.mediumBlackBold,),
            ),
            SelectDropList(
              this.optionItemSelectedSubContract,
              this.dropListModelSubContract,
                  (optionItem) {
                    FocusScope.of(context).unfocus();
                    optionItemSelectedSubContract = optionItem;
                // launchCountry = optionItem.title;
                    containerFilterRequest.providedBy = optionItem.id;
                    setState(() {});
              },
            ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Shipper' , style: AppTextStyle.mediumBlackBold,),
              ),
              SelectDropList(
                this.optionItemSelectedShipper,
                this.dropListModelShipper,
                    (optionItem) {
                  FocusScope.of(context).unfocus();
                  optionItemSelectedShipper = optionItem;
                  // launchCountry = optionItem.title;
                  containerFilterRequest.shipperID = optionItem.id;
                  setState(() {});
                },
              ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Consign' , style: AppTextStyle.mediumBlackBold,),
            ),
            SelectDropList(
              this.optionItemSelectedConsign,
              this.dropListModelConsign,
                  (optionItem) {
                optionItemSelectedConsign = optionItem;
                containerFilterRequest.consigneeID = optionItem.id;
                setState(() {});
              },
            ),
              RoundedButton(lable: 'Save', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                widget.onSave(containerFilterRequest);

              }, radius: 15)
          ],),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    containerFilterRequest = AirwaybillFilterRequest();
    entrySub= <Entry>[];
    entryShipper = <Entry>[];
    entryConsign =<Entry>[];
    status = [
      Category(id: 1, name: 'Full', description: 'full', isSelected: true),
      Category(id: 1, name: 'Not Full', description: 'notfull', isSelected: false),
    ];
    typeList = [
      Category(id: 1, name: 'LCL', description: 'LCL', isSelected: true),
      Category(id: 1, name: 'FCL', description: 'FCL', isSelected: false),
    ];
    // travelNumber =TextEditingController();
    // status=TravelStatusName[TravelStatus.CURRENT]!;

    // selectedRadioType = 1;
    // type = TravelTypeName[TravelType.SEA]!;

    optionItemSelectedSubContract =  Entry('choose', 1, []);
    optionItemSelectedShipper =  Entry('choose', 1, []);
    optionItemSelectedConsign =  Entry('choose', 1, []);

    initList();

  }

  void initList(){
    for(SubcontractModel item in widget.subContracts){
      Entry v = Entry(item.fullName! ,item.id! ,[]);
      entrySub.add(v);
      entryConsign.add(v);
      entryShipper.add(v);
    }
    dropListModelSubContract = DropListModel(entrySub);
    dropListModelConsign  =DropListModel(entryConsign);
    dropListModelShipper  =DropListModel(entryShipper);
  }


}
