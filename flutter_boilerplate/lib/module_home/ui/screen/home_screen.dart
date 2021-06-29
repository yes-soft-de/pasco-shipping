import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_home/ui/widget/chip_card.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_profile/profile_routes.dart';
import 'package:pasco_shipping/module_shipment_previous/previous_routes.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/search_card.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class HomeScreen extends StatelessWidget {
  const HomeScreen();
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return Background(
      controller: controller,
      isHome: true,
        child: Column(
          children: [
            SearchCard(),
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
                    Navigator.pushNamed(context, PreviousShipmentsRoutes.TRACKING_SHIPMENTS);
                  },
                  label: S.of(context).myShipment,
                ),
                ChipCard(
                  icon: StaticImage.newShipments,
                  onPressed: () {
                    Navigator.pushNamed(context, NewShipmentRoutes.NEW_SHIPMENTS);
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
                        Navigator.pushNamed(context, ProfileRoutes.PROFILE_SCREEN);
                      },
                      label: S.of(context).profile,
                    ),
                    ChipCard(
                      icon: StaticImage.detailsShipments,
                      onPressed: ()
                      {
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
}
