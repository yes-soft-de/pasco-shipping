
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/module_travel/state_manger/details_travel_state_manager.dart';
import 'package:pasco_shipping/module_travel/travel_routes.dart';
import 'package:pasco_shipping/module_travel/ui/state/details_state/details_state.dart';
import 'package:pasco_shipping/module_travel/ui/state/details_state/travel_details_successfully.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

@injectable
class TravelDetailsScreen extends StatefulWidget {
  final TravelDetailsStateManager _stateManager;

  TravelDetailsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<TravelDetailsScreen> {
  late TravelDetailsState currentState;
  late TravelDetailsModel items;


  DateTime now = DateTime.now();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  late String formattedDateStart;
  late String formattedDateEnd;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title:S.of(context).details
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    formattedDateStart = ''; // formatter.format(startDate);
    formattedDateEnd = ''; // formatter.format(startDate);
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String id =arguments['id'].toString();
    widget._stateManager.getTravelDetails(id);

  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingDetailsState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  Widget Screen(){
    if(currentState is LoadingDetailsState){
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
    else if (currentState is SuccessfullyDetailsState){
      SuccessfullyDetailsState? state = currentState as SuccessfullyDetailsState?;
      items = state!.response;
      return TravelDetailsSuccessfully(model: items,
        onChangeStatus: (request){
          if( request.status == TravelStatusName[TravelStatus.STARTED]) {
            _selectStartDate(context,(){
              Navigator.pop(context);
              DateTime launchDate = DateTime(startDate.year , startDate.month ,startDate.day);
              request.launchDate = launchDate.toUtc().toString();
              widget._stateManager.updateTravelStatus(request);
            },true);
          }
          if( request.status == TravelStatusName[TravelStatus.RELEASED]) {
            _selectStartDate(context,(){
              Navigator.pop(context);
              DateTime arrivalDate = DateTime(startDate.year , startDate.month ,startDate.day);
              request.arrivalDate = arrivalDate.toUtc().toString();
              widget._stateManager.updateTravelStatus(request);
            },false);
        }

      },onShowFinance: (id){
       Navigator.pushNamed(context, TravelRoutes.FINANCE ,arguments: {'id' :id});
      },
      );
    }
    // else if(currentState is SuccessfullyModifyMarkState){
    //   SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
    //   items = state.marks;
    //   Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
    //   _markNumberController.clear();
    //   return MarkSuccessfullyScreen(deleteMark: (id){
    //     widget._stateManager.deleteMark(id.toString());
    //   }, items: items, addMark: (request){
    //     widget._stateManager.createMark(request);
    //   },markNumberController: _markNumberController,);
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
 void _selectStartDate(BuildContext context ,Function changeStatus,bool isStarted)  {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                    title: Text(S.of(context).careful),
                    content: SingleChildScrollView(
                      child: Container(
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Text('Select the start date of the trip'),
                            InkWell(
                              onTap: () async{
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
                                      color: Colors.grey[200],
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
                            RoundedButton(radius: 12,style: AppTextStyle.mediumWhite,color:blue ,icon: '',lable:isStarted? S.of(context).started :S.of(context).released,
                              go:(){
                                changeStatus();
                              } ,)
                          ],
                        ),
                      ),
                    ));
              });
        });
  }
}