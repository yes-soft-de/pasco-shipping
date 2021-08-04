import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class FilterAcceptedShipmentInit extends StatefulWidget {
  final Function onSave;
  final AcceptedShipmentFilterRequest filterRequest;
  const FilterAcceptedShipmentInit({ required this.onSave ,required this.filterRequest});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<FilterAcceptedShipmentInit> {
  // late AcceptedShipmentFilterRequest acceptedShipmentFilterRequest;

 late List<Category> stats;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text('Status :' , style: AppTextStyle.mediumBlackBold,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing:30,
                runSpacing: 10.0,
                children: stats.map((item) {
                  var index = stats.indexOf(item);
                  return InkWell(
                      onTap: () {
                        setState(() {
                          stats.forEach((element) {
                            element.isSelected = false;
                          });
                        });
                        stats[index].isSelected = true;
                        widget.filterRequest.status = stats[index].description;
                        // widget.shipmentRequest.productCategoryID = widget.categories[index].id;
                        // widget.shipmentRequest.productCategoryName = widget.categories[index].name;
                      },
                      child: ChoiceCard(item));
                }).toList(),
              ),
            ),

              RoundedButton(lable: 'Save', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                widget.onSave(widget.filterRequest);

              }, radius: 15)
          ],),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    stats = [
      Category(id: 1, name: 'Accepted', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!, isSelected: false),
      Category(id: 1, name: 'Received in warehouse', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]!, isSelected: false),
      Category(id: 1, name: 'Measured', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!, isSelected: false),
      Category(id: 1, name: 'Stored in holder', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.STORED]!, isSelected: false),
      Category(id: 1, name: 'On board', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.UPLOADED]!, isSelected: false),
      Category(id: 1, name: 'Started Travel', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.STARTED]!, isSelected: false),
      Category(id: 1, name: 'Released Travel', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED]!, isSelected: false),
      Category(id: 1, name: 'Cleared holder', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!, isSelected: false),
      Category(id: 1, name: 'Arrived to warehouse', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!, isSelected: false),
      Category(id: 1, name: 'Delivered to Client', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.DELIVERED]!, isSelected: false),
      Category(id: 1, name: 'All',description: '', isSelected: false),
    ];
  }
}
