import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/filter_accepted_shipment_state/filter_accepted_shipment_init.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/filter_accepted_shipment_state/filter_state.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AcceptedShipmentFilterScreen extends StatefulWidget {
  final FilterAcceptedShipmentStateManager _stateManager;

  AcceptedShipmentFilterScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AcceptedShipmentFilterScreen> {
  late AcceptedShipmentFilterRequest filterRequest;
  late FilterAcceptedShipmentState currentState;
  late List<CountryModel> countries;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {

        },
        child: Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child:  Screen()),
          ),
        ),

        // FilterAcceptedShipmentInit(
        //   filterRequest: filterRequest,
        //   onSave: (request){
        //     Navigator.pop(context, {'filterRequest' : request});
        // }, countries: [],),
        title: S.of(context).filterBy
    );
  }




  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    filterRequest =arguments['filterRequest'];
    // widget._stateManager.getAcceptedShipment(filterRequest);
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
    widget._stateManager.getCountries();
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
      return FilterAcceptedShipmentInit(
        countries: countries,
        clients: state.clients,
        onSave: (request){
          Navigator.pop(context , {'filterRequest' : request});
        }, filterRequest: filterRequest,);
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