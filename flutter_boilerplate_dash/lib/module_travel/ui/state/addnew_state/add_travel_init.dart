import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AddTravelInit extends StatefulWidget {
  final List<SubcontractModel> subContracts;
  final List<CountryModel> countries;
  final Function onSave;
  const AddTravelInit({ required this.onSave , required this.subContracts,required this.countries});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<AddTravelInit> {
 late TextEditingController travelNumber ;

 late DropListModel dropListModelSubContract;
 late Entry optionItemSelectedSubContract;

 late DropListModel dropListModelFromCountries;
 late DropListModel dropListModelToCountries;
 late Entry optionItemSelectedFrom;
 late Entry optionItemSelectedTo;

 late List<Entry> entryFrom;
 late List<Entry> entryTo;
 late List<Entry> entrySub;

 late String status;
 late String type;
 late String launchCountry;
 late String destinationCountry;
 late int selectedRadioType;
 late int shipperID;

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
              Image.asset(StaticImage.travel),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).travels + ' type', style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))

                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioGender(2);
                          },
                          value: 2,
                          groupValue: selectedRadioType,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Air',
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioGender(1);
                          },
                          value: 1,
                          groupValue: selectedRadioType,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Sea',
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text('Travel Number' , style: AppTextStyle.mediumBlackBold,)
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
                      hintText: 'number',
                    ),
                    controller: travelNumber,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text('Launch Country' , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedFrom,
                this.dropListModelFromCountries,
                    (optionItem) {
                      FocusScope.of(context).unfocus();
                  optionItemSelectedFrom = optionItem;
                  launchCountry = optionItem.title;
                  setState(() {});
                },
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Start Date' , style: AppTextStyle.mediumBlackBold,),
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
                        child: Text('Start Time' , style: AppTextStyle.mediumBlackBold,),
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
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text('Destination Country' , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedTo,
                this.dropListModelToCountries,
                    (optionItem) {
                  optionItemSelectedTo = optionItem;
                  destinationCountry = optionItem.title;
                  setState(() {});
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Arrival Date' , style: AppTextStyle.mediumBlackBold,),
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
                        child: Text('Arrival Time' , style: AppTextStyle.mediumBlackBold,),
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
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text('Shipper' , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedSubContract,
                this.dropListModelSubContract,
                    (optionItem) {
                  optionItemSelectedSubContract = optionItem;
                  shipperID = optionItem.id;
                  setState(() {});
                },
              ),

              RoundedButton(lable: 'Save', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                DateTime arrivalDate = DateTime(endDate.year , endDate.month ,endDate.day ,selectedTimeEnd.hour ,selectedTimeEnd.minute);
                DateTime launchDate = DateTime(startDate.year , startDate.month ,startDate.day ,selectedTimeStart.hour ,selectedTimeStart.minute);

                  TravelRequest re = TravelRequest(status: status ,type: type
                    ,destinationCountry: destinationCountry ,
                    launchCountry: launchCountry ,
                    shipperID: shipperID
                    ,travelNumber: travelNumber.text
                    ,arrivalDate:arrivalDate.toUtc().toString()
                    ,launchDate: launchDate.toUtc().toString(),);
                  widget.onSave(re);

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
    formattedDateStart = ''; // formatter.format(startDate);
    formattedDateEnd = ''; //formatter.format(endDate);

    formattedTimeStart = '';
    formattedTimeEnd='';

    entryTo = <Entry>[];
    entryFrom= <Entry>[];
    entrySub= <Entry>[];

    travelNumber =TextEditingController();
    status=TravelStatusName[TravelStatus.CURRENT]!;

    selectedRadioType = 1;
    type = TravelTypeName[TravelType.SEA]!;

    optionItemSelectedFrom =  Entry('choose', 1, []);
    optionItemSelectedTo =  Entry('choose', 1, []);
    optionItemSelectedSubContract =  Entry('choose', 1, []);

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

 void _setSelectedRadioGender(int val) {
   setState(() {
     selectedRadioType = val;
     if (val == 1) {
       type = TravelTypeName[TravelType.SEA]!;
     } else if (val == 2) {
       type = TravelTypeName[TravelType.AIR]!;
     }
     print(val);
   });
 }

 Future<void> _selectTimeStart(BuildContext context) async {
   final TimeOfDay? picked_s = await showTimePicker(
       context: context,
       initialTime: selectedTimeStart,
       builder: (BuildContext context, Widget? child) {
         return MediaQuery(
           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
           child: child!,
         );
       });

   if (picked_s != null && picked_s != selectedTimeStart) {
     setState(() {
       selectedTimeStart = picked_s;
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
           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
           child: child!,
         );
       });
   if (picked_s != null && picked_s != selectedTimeEnd) {
     setState(() {
       selectedTimeEnd = picked_s;
       formattedTimeEnd = selectedTimeEnd.format(context);
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
       formattedDateEnd = formatter.format(endDate);
     });
   }
 }
}
