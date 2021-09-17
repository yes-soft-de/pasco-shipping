import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class FilterContainerInit extends StatefulWidget {
  final List<SubcontractModel> subContracts;
  final List<ContainerSpecificationModel> specification;
  final Function onSave;
  // final String type;
  const FilterContainerInit({ required this.onSave , required this.subContracts,required this.specification});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<FilterContainerInit> {
 // late TextEditingController travelNumber ;
  late ContainerFilterRequest containerFilterRequest;

  late DropListModel dropListModelSpecification;
  late Entry optionItemSelectedSpecification;
  late List<Entry> entrySpecification;

 late DropListModel dropListModelSubContract;
 late Entry optionItemSelectedSubContract;
 late List<Entry> entrySub;

  late DropListModel dropListModelShipper;
  late Entry optionItemSelectedShipper;
  late List<Entry> entryShipper;

  late DropListModel dropListModelConsign;
  late Entry optionItemSelectedConsign;
  late List<Entry> entryConsign;
  late bool withoutNumber;
  late bool isRequested;
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
              Row(children: [
                Expanded(
                  child: Row(children: [
                    Text('Without number' +': ' , style: AppTextStyle.mediumBlackBold,),
                    Checkbox(onChanged: (bool? value) {
                      setState(() {
                        withoutNumber = value!;
                      });
                    }, value: withoutNumber,
                    ),
                  ],),
                ),
                Expanded(
                  child: Row(children: [
                    Text('IS Requested' +': ' , style: AppTextStyle.mediumBlackBold,),
                    Checkbox(onChanged: (bool? value) {
                      setState(() {
                        isRequested = value!;
                      });
                    }, value: isRequested,
                    ),
                  ],),
                ),
              ],),
              Text(S.of(context).status+': ' , style: AppTextStyle.mediumBlackBold,),
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
                child: Text(S.of(context).type+': ' , style: AppTextStyle.mediumBlackBold,),
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
              child: Text(S.of(context).provided , style: AppTextStyle.mediumBlackBold,),
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
                child: Text(S.of(context).shipper , style: AppTextStyle.mediumBlackBold,),
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
              child: Text(S.of(context).consignee , style: AppTextStyle.mediumBlackBold,),
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


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).specification , style: AppTextStyle.mediumBlackBold,),
              ),
              SelectDropList(
                this.optionItemSelectedSpecification,
                this.dropListModelSpecification,
                    (optionItem) {
                  optionItemSelectedSpecification= optionItem;
                  containerFilterRequest.specificationID = optionItem.id;
                  setState(() {});
                },
              ),


              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                containerFilterRequest.withoutNumber=withoutNumber? withoutNumber :null;
                containerFilterRequest.isRequested=isRequested?isRequested:null;
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
    containerFilterRequest = ContainerFilterRequest();
    entrySub= <Entry>[];
    entrySpecification= <Entry>[];
    entryShipper = <Entry>[];
    entryConsign =<Entry>[];

    // travelNumber =TextEditingController();
    // status=TravelStatusName[TravelStatus.CURRENT]!;

    // selectedRadioType = 1;
    // type = TravelTypeName[TravelType.SEA]!;

    optionItemSelectedSubContract =  Entry('choose', 0, []);
    optionItemSelectedShipper =  Entry('choose', 0, []);
    optionItemSelectedConsign =  Entry('choose', 0, []);
    optionItemSelectedSpecification =  Entry('choose', 0, []);
    containerFilterRequest.status='full';
    containerFilterRequest.type='LCL';

    withoutNumber =false;
    isRequested=false;

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



    for(ContainerSpecificationModel item in widget.specification){
      Entry v = Entry(item.name! ,item.id! ,[]);
      entrySpecification.add(v);
    }
    dropListModelSpecification  =DropListModel(entrySpecification);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    status = [
      Category(id: 1, name: S.of(context).full, description: 'full', isSelected: true),
      Category(id: 1, name: S.of(context).notFull, description: 'notfull', isSelected: false),
    ];
    typeList = [
      Category(id: 1, name: S.of(context).LCL, description: 'LCL', isSelected: true),
      Category(id: 1, name: S.of(context).FCL, description: 'FCL', isSelected: false),
    ];
  }
}
