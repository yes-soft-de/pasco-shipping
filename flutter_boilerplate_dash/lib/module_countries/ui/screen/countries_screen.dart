import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_countries/state_manger/coutries_state_manager.dart';
import 'package:pasco_shipping/module_countries/ui/state/countries_state/ccoutries_state.dart';
import 'package:pasco_shipping/module_countries/ui/state/countries_state/countries_successfully.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class CountriesScreen extends StatefulWidget {
  final CountryStateManager _stateManager;

  CountriesScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late CountriesState currentState;
  late List<CountryModel> items;
  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: S.of(context).country
    );
  }



  @override
  void initState() {
    super.initState();
    currentState = LoadingCountriesState();
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
    if(currentState is LoadingCountriesState){
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
    else if (currentState is SuccessfullyFetchCountriesState){
      SuccessfullyFetchCountriesState? state = currentState as SuccessfullyFetchCountriesState?;
      items = state!.countries;
      return CountriesSuccessfully(items: items ,onDelete: (id){
        widget._stateManager.deleteCountry(id.toString());
      },
        onEdit: (request){
          widget._stateManager.updateCountry(request);
        },
      );
    }
    // else if(currentState is SuccessfullyModifyMarkState){
    //   SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
    //   items = state.marks;
    //   // Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
    //   _markNumberController.clear();
    //   return MarkSuccessfullyScreen(deleteMark: (id){
    //     widget._stateManager.deleteMark(id.toString());
    //   }, items: items, addMark: (request){
    //     widget._stateManager.createMark(request);
    //   },markNumberController: _markNumberController,);
    // }
    else if(currentState is ErrorState) {
      ErrorState? state = currentState as ErrorState?;
     bool  isEmpty = state!.isEmptyData;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: state.error,isEmptyData: isEmpty,),
          ],
        ),
      );
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'Error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
}
