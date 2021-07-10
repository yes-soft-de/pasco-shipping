import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_home/presistance/profile_prefs_helper.dart';
import 'package:pasco_shipping/module_home/ui/widget/chip_card.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_my_shipment/my_shipment_routes.dart';
import 'package:pasco_shipping/module_profile/profile_routes.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/service/profile_service.dart';
import 'package:pasco_shipping/module_shipment_previous/previous_routes.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_track/tracking_routes.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class HomeScreen extends StatefulWidget {
  final ProfileService _profileService;
  const HomeScreen(this._profileService);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return Background(
      goBack: () {},
      controller: controller,
      isHome: true,
      child: Column(
        children: [
          SearchCard(
            onSearch: (trackNumber) {
              Navigator.pushNamed(
                context,
                TracingRoutes.TRACKING_SCREEN,
                arguments: {'trackNumber': trackNumber},
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ChipCard(
              //   icon: StaticImage.box,
              //   onPressed: () {
              //     Navigator.pushNamed(context, PreviousShipmentsRoutes.PREVIOUS_SHIPMENTS);
              //   },
              //   label: 'Previously\nShipments',
              // ),
              ChipCard(
                icon: StaticImage.box,
                onPressed: () {
                  Navigator.pushNamed(context, MyShipmentRoutes.MY_SHIPMENT);
                },
                label: S.of(context).myShipment,
              ),
              ChipCard(
                icon: StaticImage.newShipments,
                onPressed: () async {
                  await getShipment().then((value) {
                    if (value == null || value == 'null') {
                      Navigator.pushNamed(
                          context, NewShipmentRoutes.NEW_SHIPMENTS);
                      print('value null');
                    } else {
                      _showDialog(context);
                    }
                  });
                },
                label: S.of(context).newShipmentRequest,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: Container(
                  // margin: new EdgeInsets.symmetric(vertical: 100.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(StaticImage.package),
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstIn),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChipCard(
                    icon: StaticImage.profileI,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ProfileRoutes.PROFILE_SCREEN);
                    },
                    label: S.of(context).profile,
                  ),
                  ChipCard(
                    icon: StaticImage.detailsShipments,
                    onPressed: () {
                      Navigator.pushNamed(context, MarkRoutes.mark);
                    },
                    label: S.of(context).mark,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      title: S.of(context).shipment,
      currentIndex: 0,
      isResultScreen: false,
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        title: 'One moment please',
        text:
            'You have a shipment waiting for confirmation, please confirm it first and then order a new shipment',
        backgroundColor: AppThemeDataService.PrimaryColor,
        confirmBtnColor: AppThemeDataService.AccentColor,
        cancelBtnText: 'maybe later',
        confirmBtnText: 'confirm it',
        onConfirmBtnTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, MyShipmentRoutes.MY_SHIPMENT);
        },
        onCancelBtnTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, NewShipmentRoutes.NEW_SHIPMENTS);
        });
  }

  @override
  void initState() {
    super.initState();
    getPro();
  }

  void getPro() async {
    await widget._profileService.getMyProfile().then((value) {
      ProfileRequest request = ProfileRequest(
          userName: value!.userName!,
          city: value.city!,
          country: value.country!,
          image: value.image!,
          location: value.location!,
          phone: value.phone!);
      setProfile(request);
    });
  }
}
