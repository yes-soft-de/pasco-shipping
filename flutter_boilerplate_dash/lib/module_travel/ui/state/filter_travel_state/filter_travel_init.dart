import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class FilterTravelInit extends StatefulWidget {
  final List<SubcontractModel> subContracts;
  final List<CountryModel> countries;
  final Function onSave;
  final String type;
  const FilterTravelInit({ required this.onSave , required this.subContracts,required this.countries,required this.type});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<FilterTravelInit> {
 // late TextEditingController travelNumber ;
  late TravelFilterRequest travelFilterRequest;

 late DropListModel dropListModelSubContract;
 late Entry optionItemSelectedSubContract;

 late DropListModel dropListModelFromCountries;
 late DropListModel dropListModelToCountries;
 late Entry optionItemSelectedFrom;
 late Entry optionItemSelectedTo;

 late List<Entry> entryFrom;
 late List<Entry> entryTo;
 late List<Entry> entrySub;

 // late String status;
 // late String type;
 late String launchCountry;
 late String destinationCountry;
 // late int selectedRadioType;
 // late int shipperID;

 TimeOfDay selectedTimeStart = TimeOfDay.now();
 TimeOfDay selectedTimeEnd = TimeOfDay.now();

 DateTime now = DateTime.now();

 DateTime startDate = DateTime.now();
 DateTime endDate = DateTime.now();
 var formatter = new DateFormat('dd-MM-yyyy');
 late String formattedDateStart;
 late String formattedDateEnd;

  late String formattedTimeStart;
  late String formattedTimeEnd;

 late List<Category> stats;

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
            Text('State :' , style: AppTextStyle.mediumBlackBold,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing:30,
                runSpacing: 10.0,
                children: stats.map((item) {
                  var index = stats.indexOf(item);
                  return InkWell(
                      onTap: () {
                        setState(() {
                          stats.forEach((element) {
                            element.isSelected = false;
                          });
                        });
                        stats[index].isSelected = true;
                        travelFilterRequest.status = stats[index].description;
                        // widget.shipmentRequest.productCategoryID = widget.categories[index].id;
                        // widget.shipmentRequest.productCategoryName = widget.categories[index].name;
                      },
                      child: ChoiceCard(item));
                }).toList(),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).launchCountry , style: AppTextStyle.mediumBlackBold,),
            ),
            SelectDropList(
              this.optionItemSelectedFrom,
              this.dropListModelFromCountries,
                  (optionItem) {
                    FocusScope.of(context).unfocus();
                optionItemSelectedFrom = optionItem;
                launchCountry = optionItem.title;
                    travelFilterRequest.launchCountry = optionItem.title;

                    setState(() {});
              },
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(S.of(context).startDate , style: AppTextStyle.mediumBlackBold,),
                    ),
                    InkWell(
                      onTap: (){
                        _selectStartDate(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: Text(formattedDateStart),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(S.of(context).startTime  , style: AppTextStyle.mediumBlackBold,),
                    ),
                    InkWell(
                      onTap: (){
                        _selectTimeStart(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: Text(formattedTimeStart),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).destinationCountry , style: AppTextStyle.mediumBlackBold,),
            ),
            SelectDropList(
              this.optionItemSelectedTo,
              this.dropListModelToCountries,
                  (optionItem) {
                optionItemSelectedTo = optionItem;
                destinationCountry = optionItem.title;
                travelFilterRequest.destinationCountry = optionItem.title;
                setState(() {});
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(S.of(context).arrivalDate, style: AppTextStyle.mediumBlackBold,),
                    ),
                    InkWell(
                      onTap: (){
                        _selectEndDate(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: Text(formattedDateEnd),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(S.of(context).arrivalTime , style: AppTextStyle.mediumBlackBold,),
                    ),
                    InkWell(
                      onTap: (){
                        _selectTimeEnd(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: Text(formattedTimeEnd),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                widget.onSave(travelFilterRequest);

              }, radius: 15)
          ],),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    travelFilterRequest = TravelFilterRequest(type: widget.type);

    formattedDateStart = ''; //formatter.format(startDate);
    formattedDateEnd =''; //  formatter.format(endDate);

    formattedTimeStart ='';
    formattedTimeEnd ='';

    entryTo = <Entry>[];
    entryFrom= <Entry>[];
    entrySub= <Entry>[];
    stats = [
      Category(id: 1, name: 'Current', description: 'current', isSelected: true),
      Category(id: 1, name: 'Started', description: 'started', isSelected: false),
      Category(id: 1, name: 'Released', description: 'released', isSelected: false),
      Category(id: 1, name: 'All', description: '', isSelected: false),
    ];
    // travelNumber =TextEditingController();
    // status=TravelStatusName[TravelStatus.CURRENT]!;

    // selectedRadioType = 1;
    // type = TravelTypeName[TravelType.SEA]!;

    optionItemSelectedFrom =  Entry('choose', 0, []);
    optionItemSelectedTo =  Entry('choose', 0, []);
    optionItemSelectedSubContract =  Entry('choose', 0, []);

    initList();

  }

  void initList(){
    for(SubcontractModel item in widget.subContracts){
      Entry v = Entry(item.fullName! ,item.id! ,[]);
      entrySub.add(v);
    }
    dropListModelSubContract = DropListModel(entrySub);


    for(CountryModel item in widget.countries){
      Entry v = Entry(item.name! ,item.id! ,[]);
      entryFrom.add(v);
      entryTo.add(v);
    }
    dropListModelFromCountries = DropListModel(entryFrom);
    dropListModelToCountries = DropListModel(entryTo);
  }


 Future<void> _selectTimeStart(BuildContext context) async {
   final TimeOfDay? picked_s = await showTimePicker(
       context: context,
       initialTime: selectedTimeStart,
       builder: (BuildContext context, Widget? child) {
         return MediaQuery(
           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
           child: child!,
         );
       });

   if (picked_s != null && picked_s != selectedTimeStart) {
     setState(() {
       selectedTimeStart = picked_s;
       travelFilterRequest.launchDate = DateTime(startDate.year , startDate.month , startDate.day , selectedTimeStart.hour ,selectedTimeStart.minute).toUtc().toString();
       formattedTimeStart = selectedTimeStart.format(context);
       print(selectedTimeStart);
     });
   }
 }
 Future<void> _selectTimeEnd(BuildContext context) async {
   final TimeOfDay? picked_s = await showTimePicker(
       context: context,
       initialTime: selectedTimeEnd,
       builder: (BuildContext context, Widget? child) {
         return MediaQuery(
           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
           child: child!,
         );
       });
   if (picked_s != null && picked_s != selectedTimeEnd) {
     setState(() {
       selectedTimeEnd = picked_s;
       formattedTimeEnd = selectedTimeEnd.format(context);
       travelFilterRequest.arrivalDate = DateTime(endDate.year , endDate.month , endDate.day , selectedTimeEnd.hour ,selectedTimeEnd.minute).toUtc().toString();
     });
   }
 }

 Future<void> _selectStartDate(BuildContext context) async {
   final DateTime? picked = await showDatePicker(
       context: context,
       initialDate: now,
       firstDate: DateTime(2021, 6),
       lastDate: DateTime(2101));
   if (picked != null && picked != now) {
     setState(() {
       startDate = picked;
       travelFilterRequest.launchDate = DateTime(startDate.year , startDate.month , startDate.day , selectedTimeStart.hour ,selectedTimeStart.minute).toUtc().toString();
       print(travelFilterRequest.launchDate);
       formattedDateStart = formatter.format(startDate);
     });
   }
 }
 Future<void> _selectEndDate(BuildContext context) async {
   final DateTime? picked = await showDatePicker(
       context: context,
       initialDate: now,
       firstDate: DateTime(2021, 6),
       lastDate: DateTime(2101));
   if (picked != null && picked != now) {
     setState(() {
       endDate = picked;
       travelFilterRequest.arrivalDate = DateTime(endDate.year , endDate.month , endDate.day , selectedTimeEnd.hour ,selectedTimeEnd.minute).toUtc().toString();
       formattedDateEnd = formatter.format(endDate);
     });
   }
 }
}
