import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_harbor/state_manger/harbors_state_manager.dart';
import 'package:pasco_shipping/module_harbor/ui/state/harbors_state/harbors_state.dart';
import 'package:pasco_shipping/module_harbor/ui/state/harbors_state/harbors_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class HarborsScreen extends StatefulWidget {
  final HarborStateManager _stateManager;

  HarborsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<HarborsScreen> {
  late HarborsState currentState;
  late List<HarborModel> items;
  HarborFilterRequest request = HarborFilterRequest();

  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: S.of(context).harbors
    );
  }



  @override
  void initState() {
    super.initState();
    currentState = LoadingState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getHarbor(request);
  }

  Widget Screen(){
    if(currentState is LoadingState){
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
    else if (currentState is SuccessfullyFetchState){
      SuccessfullyFetchState? state = currentState as SuccessfullyFetchState?;
      items = state!.distributors;
      return HarborsSuccessfully(items: items ,onDelete: (id){
        widget._stateManager.deleteHarbor(id.toString() ,request);
      },
        onEdit: (model){
          // widget._stateManager.updateSupplier(request);
        },
      );
    }
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
