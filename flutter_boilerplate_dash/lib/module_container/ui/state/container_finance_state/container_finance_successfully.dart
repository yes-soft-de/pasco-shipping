import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/module_container/widget/container_finance_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class ContainerFinanceSuccessfullyScreen extends StatefulWidget {
  final Data containerFinances;
  final Function addFinance;
  final int containerID;
  ContainerFinanceSuccessfullyScreen({required this.addFinance ,required this.containerFinances,required this.containerID });

  @override
  _MarkSuccessfullyScreenState createState() => _MarkSuccessfullyScreenState();
}

class _MarkSuccessfullyScreenState extends State<ContainerFinanceSuccessfullyScreen> {

  TextEditingController cost = TextEditingController();
  TextEditingController description = TextEditingController();
  late int selectedRadioType;
  late String type;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).totalCost ,style: AppTextStyle.mediumBlackBold,),
                      Text(widget.containerFinances.currentTotalCost ??'' ,style: AppTextStyle.mediumRedBold,),
                    ],
                  ),
                ),
              ),
            ),
            widget.containerFinances.data!.isEmpty ?
            Text(S.of(context).nothingAdded , style: AppTextStyle.mediumRedBold,)
                :ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.containerFinances.data!.length,
                itemBuilder: (context, index) {
                  return ContainerFinanceCard(
                    model: widget.containerFinances.data![index]
                  );
                }),
            Card(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).cost,
                          ),
                          controller: cost,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).details,
                          ),
                          controller: description,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppThemeDataService.AccentColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))

                          ),
                          onPressed: () {
                          },
                          child: Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  _setSelectedRadioGender(1);
                                },
                                value: 1,
                                groupValue: selectedRadioType,
                                activeColor: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                S.of(context).uploaded,
                                style: AppTextStyle.mediumWhite,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppThemeDataService.AccentColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))

                          ),
                          onPressed: () {
                          },
                          child: Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  _setSelectedRadioGender(2);
                                },
                                value: 2,
                                groupValue: selectedRadioType,
                                activeColor: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                S.of(context).cleared,
                                style: AppTextStyle.mediumWhite,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: 175,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppThemeDataService.AccentColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))

                        ),
                        onPressed: () {
                        },
                        child: Row(
                          children: [
                            Radio(
                              onChanged: (value) {
                                _setSelectedRadioGender(3);
                              },
                              value: 3,
                              groupValue: selectedRadioType,
                              activeColor: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              S.of(context).arrived,
                              style: AppTextStyle.mediumWhite,
                            ),
                          ],
                        ),
                      ),
                    ),

                    RoundedButton(lable: S.of(context).add, icon: '', color: blue, style: AppTextStyle.mediumWhiteBold, go: (){
                      if(cost.text.isEmpty) {
                        Fluttertoast.showToast(msg: S.of(context).fillAllField);
                      }
                      else {
                        ContainerAddFinanceRequest mark = ContainerAddFinanceRequest(travelStatus:type ,currency:' ',containerID: widget.containerID,stageCost: int.parse(cost.text) , stageDescription: description.text);
                        widget.addFinance(mark);
                      }
                    }, radius: 12)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedRadioType = 1;
    type =AcceptedShipmentStatusName[AcceptedShipmentStatus.UPLOADED]!;
  }

  void _setSelectedRadioGender(int val) {
    setState(() {
      selectedRadioType = val;
      if (val == 1) {
        type = AcceptedShipmentStatusName[AcceptedShipmentStatus.UPLOADED]!;
      } else if (val == 2) {
        type = AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!;
      }
      else if (val == 3) {
        type = AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!;
      }
      print(val);
    });
  }
}
