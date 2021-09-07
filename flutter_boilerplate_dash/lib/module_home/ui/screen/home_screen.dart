import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_home/state_manager/state_manager_home.dart';
import 'package:pasco_shipping/module_home/ui/state/home_state.dart';
import 'package:pasco_shipping/module_home/ui/state/home_successfully.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/accepted_shipment_routes.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/app_menu.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';
import 'package:pasco_shipping/utils/widget/split_view.dart';

@injectable
class HomeScreen extends StatefulWidget {
  final HomeStateManager _stateManager;
  const HomeScreen(this._stateManager);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeState currentState;
  @override
  Widget build(BuildContext context) {
    return
      Background(
        showFilter: false,
        goBack: () {},
        title: S.of(context).dashboard,
        child: Screen()
      );
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingHomeState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getStatistic();
  }
  Widget Screen(){
    if(currentState is LoadingHomeState){
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
    else if (currentState is FetchedHomeSuccessfullyState){
      FetchedHomeSuccessfullyState? state = currentState as FetchedHomeSuccessfullyState?;
      return HomeSuccessfully(model: state!.model, onSearch: (trackNumber){
        AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(trackNumber:trackNumber ,isExternalWarehouse: false);
        Navigator.pushNamed(
            context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re,'withFilter':false});
      },);
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'connection error',isEmptyData: false,),
          ],
        ),
      );
    }
  }

  // void getPro() async {
  //   await widget._profileService.getMyProfile().then((value) {
  //     ProfileRequest request = ProfileRequest(
  //         userName: value!.userName!,
  //         city: value.city!,
  //         country: value.country!,
  //         image: value.image!,
  //         location: value.location!,
  //         phone: value.phone!);
  //     setProfile(request);
  //   });
  // }
}


@injectable
class MyFirstApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('hihihihhiiiii');
    // 3. watch selectedPageBuilderProvider
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return  SplitView(
      menu: AppMenu(),
      content: selectedPageBuilder(context),
    );
  }
}