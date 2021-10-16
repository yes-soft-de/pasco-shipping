import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/state_manger/filter_travel_state_manger.dart';
import 'package:pasco_shipping/module_travel/ui/state/filter_travel_state/filter_state.dart';
import 'package:pasco_shipping/module_travel/ui/state/filter_travel_state/filter_travel_init.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';


@injectable
class TravelFilterScreen extends StatefulWidget {
  final FilterTravelStateManager _stateManager;

  const TravelFilterScreen(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<TravelFilterScreen> {
  late FilterTravelState currentState;
  late List<CountryModel> countries;
  late List<SubcontractModel> subs;
  late String type;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: (){
        },
        child: Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: S.of(context).filterBy
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    type =arguments['type'].toString();
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingFilterState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getCountriesAndSubContract();
  }

  Widget Screen(){
    if(currentState is LoadingFilterState){
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
    else if (currentState is InitFilterState){
      InitFilterState? state = currentState as InitFilterState?;
      countries = state!.countries;
      subs = state.subcontracts;
      return FilterTravelInit(
        countries: countries,
        subContracts: subs,
        type: type,
        onSave: (request){
          Navigator.pop(context , {'filter' : request});
        },);
    }
    // else if (currentState is SuccessfullyAddState){
    //   Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
    //   return AddTravelInit(
    //     subContracts: [],
    //     countries: [],
    //     onSave: (request){
    //       widget._stateManager.createTravel(request);
    //     },);
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



//
// class TravelFilter extends StatefulWidget {
//   const TravelFilter();
//
//   @override
//   _TravelFilterState createState() => _TravelFilterState();
// }
//
// class _TravelFilterState extends State<TravelFilter> {
//   late List<Category> stats;
//   @override
//   Widget build(BuildContext context) {
//
//     return Background(child: Screen(),
//         title: 'Travel Filter', goBack: (){
//
//     }, showFilter: false);
//   }
//
//   Widget Screen(){
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text('State :' , style: AppTextStyle.mediumBlackBold,),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Wrap(
//                 spacing:50,
//                 runSpacing: 10.0,
//                 children: stats.map((item) {
//                   var index = stats.indexOf(item);
//                   return InkWell(
//                       onTap: () {
//                         setState(() {
//                           stats.forEach((element) {
//                             element.isSelected = false;
//                           });
//                         });
//                         stats[index].isSelected = true;
//                         // widget.shipmentRequest.productCategoryID = widget.categories[index].id;
//                         // widget.shipmentRequest.productCategoryName = widget.categories[index].name;
//                       },
//                       child: ChoiceCard(item));
//                 }).toList(),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(children: [
//                 Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
//                 SizedBox(width: 5,),
//                 Text('Launch Country' , style: AppTextStyle.mediumBlackBold,)
//               ],),
//             ),
//             SelectDropList(
//               this.optionItemSelectedFrom,
//               this.dropListModelFromCountries,
//                   (optionItem) {
//                 FocusScope.of(context).unfocus();
//                 optionItemSelectedFrom = optionItem;
//                 launchCountry = optionItem.title;
//                 setState(() {});
//               },
//             ),
//
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Start Date' , style: AppTextStyle.mediumBlackBold,),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         _selectStartDate(context);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               top: 4,left: 16, right: 16, bottom: 4
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10)
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 5
//                                 )
//                               ]
//                           ),
//                           child: Text(formattedDateStart),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Start Time' , style: AppTextStyle.mediumBlackBold,),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         _selectTimeStart(context);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               top: 4,left: 16, right: 16, bottom: 4
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10)
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 5
//                                 )
//                               ]
//                           ),
//                           child: Text(selectedTimeStart.format(context)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 30,),
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(children: [
//                 Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
//                 SizedBox(width: 5,),
//                 Text('Destination Country' , style: AppTextStyle.mediumBlackBold,)
//               ],),
//             ),
//             SelectDropList(
//               this.optionItemSelectedTo,
//               this.dropListModelToCountries,
//                   (optionItem) {
//                 optionItemSelectedTo = optionItem;
//                 destinationCountry = optionItem.title;
//                 setState(() {});
//               },
//             ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Arrival Date' , style: AppTextStyle.mediumBlackBold,),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         _selectEndDate(context);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               top: 4,left: 16, right: 16, bottom: 4
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10)
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 5
//                                 )
//                               ]
//                           ),
//                           child: Text(formattedDateEnd),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Arrival Time' , style: AppTextStyle.mediumBlackBold,),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         _selectTimeEnd(context);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               top: 4,left: 16, right: 16, bottom: 4
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10)
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 5
//                                 )
//                               ]
//                           ),
//                           child: Text(selectedTimeEnd.format(context)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     stats = [
//       Category(id: 1, name: 'current', description: '', isSelected: false),
//       Category(id: 1, name: 'started', description: '', isSelected: false),
//       Category(id: 1, name: 'arrived', description: '', isSelected: false),
//      ];
//   }
// }
