import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_track/model/shipment_status.dart';
import 'package:pasco_shipping/module_shipment_track/response/tracking_response.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/holder_info_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/shipment_status_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

class TrackingSuccessfullyScreen extends StatefulWidget {
  final TrackModel model;
  TrackingSuccessfullyScreen(this.model);

  @override
  _TrackingSuccessfullyScreenState createState() => _TrackingSuccessfullyScreenState();
}

class _TrackingSuccessfullyScreenState extends State<TrackingSuccessfullyScreen> {

  late List<Track> tracks;
  late List<ShipmentStatus> items;

  final ScrollController _controller = ScrollController();


  @override
  void initState() {
    super.initState();
    tracks = widget.model.tracks!;
    items = [];
    selectStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      goBack: (){
        Navigator.pop(context);
      },
      controller: _controller,
      isHome: false,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: greyBlack,
            collapsedHeight: 460,
            pinned: false,
            floating: true,
            flexibleSpace: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20 ,end: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: white,
                              ),
                              onPressed: () {
                                // _scaffoldKey.currentState!.openDrawer();
                              }),
                          Text(
                    S.of(context).resultTrack,
                            style: white18text,
                          ),
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_forward_ios , color: white,))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      StaticImage.divider,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                      child: Text(
                        S.of(context).shipmentInfo,
                        style: basic14text,
                      ),
                    ),
                    Card(
                      // margin: new EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5.0,
                      color: black,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: white,
                                  size: 20,
                                ),
                                Text(
                                  'Created at: ',
                                  style: White14text,
                                ),
                                Text(
                              widget.model.orderCreationDate
                                  .toString()
                                  .split(' ')
                                  .first,
                              style: White14text,
                            ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  S.of(context).distributorName,
                                  style: White14text,
                                ),
                                Text(
                                  widget.model.distributorName ?? '',
                                  style: basic14text,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(S.of(context).importWarehouseCity,
                                    style: White14text),
                                Text(widget.model.importWarehouseName ?? '',
                                    style: basic14text),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  color: white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  S.of(context).inHolder,
                                  style: White14text,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                if (widget.model.isInOneHolder != null &&
                                    widget.model.isInOneHolder!)
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: green,
                                  )
                                else
                                  Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.category,
                                  color: white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(S.of(context).productType + ' ',
                                    style: White14text),
                                Text(widget.model.productCategoryName ?? '',
                                    style: basic14text),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.business_center_outlined,
                                  color: white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(S.of(context).quantity + ' ',
                                    style: White14text),
                                Text(widget.model.quantity.toString(),
                                    style: basic14text),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  S.of(context).importantNote,
                                  style: TextStyle(
                                      color: AppThemeDataService.AccentColor),
                                ),
                                Spacer(),
                                InkWell(
                                    onTap: () {
                                      showAlertDialog(context);
                                    },
                                    child: Text(
                                      "show holder Info",
                                      style: TextStyle(
                                          color: AppThemeDataService
                                              .PrimaryDarker),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget.model.statusDetails ?? '',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            S.of(context).trackShipment,
                            style: basic14text,
                          ),
                          SizedBox(height: 2,),
                          Text('Last Updated at :' +  widget.model.orderUpdatingDate .toString()
                              .split(' ')
                              .first,
                            style: White14text,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ShipmentStatusCard(model: items[index]);
              },
              childCount: items.length, // 1000 list items
            ),
          ),
        ],
      ),
      isResultScreen: true,
      currentIndex: -1,
      title: S.of(context).resultTrack,
    );
  }

 void showAlertDialog(BuildContext context) {

   Widget okButton = TextButton(
     child: Text(S.of(context).ok),
     onPressed:  () {
       Navigator.pop(context);
     },
   );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Text('Holder Info'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: tracks.length,
                itemBuilder: (context , index){
              return HolderInfoCard(tracks[index]);
            }),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void selectStatus(){
    if(widget.model.shipmentStatus=='accepted'){
      items = [
        ShipmentStatus(1, 'Requested', widget.model.log![0].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Accepted', widget.model.log![1].createdAt.toString(), false, false),
        ShipmentStatus(1, 'Received in the warehouse', '20 min ago', false, true),
        ShipmentStatus(1, 'start shipping', "1", false, true),
        ShipmentStatus(1, ' Arrived at the target city', '20 min ago', false, true),
        ShipmentStatus(1, 'Delivered', '20 min ago', false, true),
      ];
    }else if(widget.model.shipmentStatus=='stored') {
      items = [
        ShipmentStatus(1, 'Requested', widget.model.log![0].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Accepted', widget.model.log![1].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Received in the warehouse', widget.model.log![2].createdAt.toString(), false, false),
        ShipmentStatus(1, 'start shipping', '', false, true),
        ShipmentStatus(1, ' Arrived at the target city', '20 min ago', false, true),
        ShipmentStatus(1, 'Delivered', '20 min ago', false, true),
      ];
    }
    else if(widget.model.shipmentStatus=='started') {
      items = [
      ShipmentStatus(1, 'Requested', widget.model.log![0].createdAt.toString(), true, false),
      ShipmentStatus(1, 'Accepted', widget.model.log![1].createdAt.toString(), true, false),
      ShipmentStatus(1, 'Received in the warehouse', widget.model.log![2].createdAt.toString(), true, false),
      ShipmentStatus(1, 'start shipping', widget.model.log![3].createdAt.toString(), false, false),
      ShipmentStatus(1, ' Arrived at the target city', '20 min ago', false, true),
      ShipmentStatus(1, 'Delivered', '20 min ago', false, true),
    ];
    }
    else if(widget.model.shipmentStatus=='arrived') {
      items = [
        ShipmentStatus(1, 'Requested', widget.model.log![0].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Accepted', widget.model.log![1].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Received in the warehouse', widget.model.log![2].createdAt.toString(), true, false),
        ShipmentStatus(1, 'start shipping', widget.model.log![3].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Arrived at the target city',  widget.model.log![4].createdAt.toString(), false, false),
        ShipmentStatus(1, 'Delivered', '20 min ago', false, true),
      ];
    }
    else if(widget.model.shipmentStatus=='delivered') {
      items = [
        ShipmentStatus(1, 'Requested', widget.model.log![0].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Accepted', widget.model.log![1].createdAt.toString(), true, false),
        ShipmentStatus(1, 'Received in the warehouse', widget.model.log![2].createdAt.toString(), true, false),
        ShipmentStatus(1, 'start shipping', widget.model.log![3].createdAt.toString(), true, false),
        ShipmentStatus(1, ' Arrived at the target city', '20 min ago', true, false),
        ShipmentStatus(1, 'Delivered', '20 min ago', false, false),
      ];
    }
  }
}
