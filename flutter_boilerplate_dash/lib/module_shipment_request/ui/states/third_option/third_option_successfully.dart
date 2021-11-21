import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/alert_widget.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ThirdOptionsSuccessfully extends StatefulWidget {
  final List<DistributorModel> distributors;
  final List<Mark> marks;
  final List<ReceiverModel> receiver;
  final ShipmentRequest shipmentRequest;
  final Function goBackStep;
  final Function goToMark;
  final Function goToReceiver;
  final Function goToDistributor;
  final Function onRequest;
  const ThirdOptionsSuccessfully(
      {required this.shipmentRequest,
      required this.goBackStep,
      required this.distributors,
      required this.marks,
      required this.onRequest,
      required this.goToMark,
      required this.receiver,
      required this.goToReceiver,
      required this.goToDistributor});

  @override
  _ThirdOptionsState createState() => _ThirdOptionsState();
}

class _ThirdOptionsState extends State<ThirdOptionsSuccessfully> {
  late DropListModel dropListModelDist;

  late DropListModel dropListModelMarks;
  late DropListModel dropListModelReceiver;

  late String vehicle;
  late String extra;

  late Entry optionItemSelectedDist;
  late Entry optionItemSelectedMarks;
  late Entry optionItemSelectedReceiver;

  late List<Entry> marksEntry;
  late List<Entry> distrbutorEntry;
  late List<Entry> receiverEntry;
  final _formKey = GlobalKey<FormState>();
  TextEditingController vehicleController= TextEditingController();

  @override
  void initState() {
    super.initState();
    marksEntry = <Entry>[];
    distrbutorEntry = <Entry>[];
    receiverEntry = <Entry>[];

    if (widget.shipmentRequest.vehicleIdentificationNumber.isNotEmpty) {
      vehicle = widget.shipmentRequest.vehicleIdentificationNumber;
      vehicleController..text = vehicle;
    } else {
      vehicle = '123...';
    }

    if (widget.shipmentRequest.extraSpecification.isNotEmpty) {
      extra = widget.shipmentRequest.extraSpecification;
    } else {
      extra = 'Text...';
    }
    if (widget.shipmentRequest.markId != 0) {
      optionItemSelectedMarks = Entry(
          widget.shipmentRequest.markName, widget.shipmentRequest.markId, []);
    } else {
      optionItemSelectedMarks = Entry('choose', 0, []);
    }

    if (widget.shipmentRequest.receiverID != 0) {
      optionItemSelectedReceiver = Entry(widget.shipmentRequest.receiverName,
          widget.shipmentRequest.receiverID, []);
    } else {
      optionItemSelectedReceiver = Entry('choose', 0, []);
    }

    if (widget.shipmentRequest.distributorID != 0) {
      optionItemSelectedDist = Entry(widget.shipmentRequest.distributorName,
          widget.shipmentRequest.distributorID, []);
    } else {
      optionItemSelectedDist = Entry('choose', 0, []);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (Mark item in widget.marks) {
      Entry v = Entry(item.markNumber!, item.id ?? 0, []);
      marksEntry.add(v);
    }
    dropListModelMarks = DropListModel(marksEntry);

    for (DistributorModel item in widget.distributors) {
      Entry v = Entry(item.fullName!, item.id ?? 0, []);
      distrbutorEntry.add(v);
    }
    dropListModelDist = DropListModel(distrbutorEntry);

    for (ReceiverModel item in widget.receiver) {
      Entry v = Entry(
          item.fullName!, item.id ?? 0, [Entry(item.phone!, item.id ?? 0, [])]);
      receiverEntry.add(v);
    }
    dropListModelReceiver = DropListModel(receiverEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).receiverInfo,
            style: AppTextStyle.mediumBlackBold,
          ),
          Row(
            children: [
              Expanded(
                child: SelectDropList(
                  this.optionItemSelectedReceiver,
                  this.dropListModelReceiver,
                  (optionItem) {
                    optionItemSelectedReceiver = optionItem;
                    widget.shipmentRequest.receiverName = optionItem.title;
                    widget.shipmentRequest.receiverID = optionItem.id;
                    widget.shipmentRequest.receiverPhoneNumber =
                        optionItem.children[0].title;
                    setState(() {});
                  },
                ),
              ),
              InkWell(
                  onTap: () {
                    widget.goToReceiver();
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: blue,
                    size: 40,
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            S.of(context).mark,
            style: AppTextStyle.mediumBlackBold,
          ),
          Row(
            children: [
              Expanded(
                child: SelectDropList(
                  this.optionItemSelectedMarks,
                  this.dropListModelMarks,
                  (optionItem) {
                    optionItemSelectedMarks = optionItem;
                    widget.shipmentRequest.markName = optionItem.title;
                    widget.shipmentRequest.markId = optionItem.id;
                    setState(() {});
                  },
                ),
              ),
              InkWell(
                  onTap: () {
                    widget.goToMark();
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: blue,
                    size: 40,
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            S.of(context).distributor,
            style: AppTextStyle.mediumBlackBold,
          ),
          Row(
            children: [
              Expanded(
                child: SelectDropList(
                  this.optionItemSelectedDist,
                  this.dropListModelDist,
                  (optionItem) {
                    optionItemSelectedDist = optionItem;
                    widget.shipmentRequest.distributorName = optionItem.title;
                    widget.shipmentRequest.distributorID = optionItem.id;
                    setState(() {});
                  },
                ),
              ),
              InkWell(
                  onTap: () {
                    widget.goToDistributor();
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: blue,
                    size: 40,
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: widget.shipmentRequest.productCategoryName == 'Car'
                ? true
                : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).vehicleNumber,
                  style: AppTextStyle.mediumBlackBold,
                ),
                Container(
                  // height: height,
                  margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Theme(
                    data: ThemeData(
                      textSelectionTheme: TextSelectionThemeData(
                          selectionColor: Colors.blue[200]),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: vehicleController,
                          onChanged: (number) {
                            widget.shipmentRequest.vehicleIdentificationNumber =
                                number;
                          },
                          cursorColor: Colors.blue,
                          maxLength: 17,
                          decoration: InputDecoration(
                        hintText: S.of(context).vehicleNumber,
                            hintStyle: AppTextStyle.mediumDeepGray,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: AppTextStyle.mediumBlack,
                          validator: (text) {
                            if (text == null || text.isEmpty || text.length != 17) {
                              return "Number should contain 17 characters";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).extraSpecification,
            style: AppTextStyle.mediumBlackBold,
          ),
          TextEdit(
              hint: extra,
              title: widget.shipmentRequest.extraSpecification,
              onChange: (extra) {
                widget.shipmentRequest.extraSpecification = extra;
              }),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 25, end: 25),
            child: RoundedButton(
              radius: 15,
              lable: S.of(context).requestShipment,
              icon: '',
              color: Theme.of(context).accentColor,
              go: () {
                if (optionItemSelectedMarks.id == 0) {
                  AlertWidget.showAlert(context,false,S.of(context).selectMark);
                }
                else if(!_formKey.currentState!.validate()){
                  return null;
                }
                else {
                  widget.onRequest(widget.shipmentRequest);
                }
              },
              style: AppTextStyle.mediumWhite,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          widget.goBackStep();
                        },
                        label: Text(S.of(context).back),
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? validatePassword(String value) {
    if (!(value.length != 17) && value.isNotEmpty) {
      return "Number should contain 17 characters";
    }
    return null;
  }
}
