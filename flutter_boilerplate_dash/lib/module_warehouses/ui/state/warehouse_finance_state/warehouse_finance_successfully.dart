import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_add_finance_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warehouse_finance_response.dart';
import 'package:pasco_shipping/module_warehouses/widget/warehouse_finance_card.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class WarehouseFinanceSuccessfullyScreen extends StatefulWidget {
  final List<WarehouseFinanceModel>? warehouseFinances;
  final Function addFinance;
  final int warehouseID;
  WarehouseFinanceSuccessfullyScreen({required this.addFinance ,required this.warehouseFinances,required this.warehouseID });

  @override
  _MarkSuccessfullyScreenState createState() => _MarkSuccessfullyScreenState();
}

class _MarkSuccessfullyScreenState extends State<WarehouseFinanceSuccessfullyScreen> {
  TextEditingController cost = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.warehouseFinances!.isEmpty ?
            Text('No thing Added yet' , style: AppTextStyle.mediumRedBold,)
                :ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.warehouseFinances!.length,
                itemBuilder: (context, index) {
                  return WarehouseFinanceCard(
                    model: widget.warehouseFinances![index]
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
                            hintText: 'cost',
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
                            hintText: 'details',
                          ),
                          controller: description,
                        ),
                      ),
                    ),
                    RoundedButton(lable: 'Add', icon: '', color: blue, style: AppTextStyle.mediumWhiteBold, go: (){
                      if(cost.text.isEmpty) {
                        Fluttertoast.showToast(msg: S.of(context).fillAllField);
                      }
                      else {
                        WarehouseAddFinanceRequest mark = WarehouseAddFinanceRequest(currency:' ',warehouseID: widget.warehouseID,stageCost: int.parse(cost.text) , stageDescription: description.text);
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
}
