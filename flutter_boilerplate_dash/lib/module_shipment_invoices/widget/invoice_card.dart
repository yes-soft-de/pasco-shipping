import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/image_full_screen.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

import 'billing_card.dart';

class InvoiceCard extends StatelessWidget {
  final InvoiceModel model;
  final Function addAttached;
  final Function payBill;
  const InvoiceCard({Key? key,required this.model,required this.addAttached,required this.payBill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExpansionTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('#' + model.id.toString() , style: AppTextStyle.largeBlackBold,),
              Row(
                children: [
                  Text(
                    'Shipment ID'+': ',
                    style: AppTextStyle.mediumBlack,
                  ),
                  Expanded(child:Text(
                    model.shipmentID.toString() ,
                    style: AppTextStyle.mediumBlueBold,
                  ),
                  )],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    S.of(context).client,
                    style: AppTextStyle.mediumBlack,
                  ),
                  Expanded(child:Text(
                    model.clientUserName.toString() ,
                    style: AppTextStyle.mediumBlueBold,
                  ),
                  )],
              ),

            ],),
            leading: InkWell(
                onTap: ()async{
                  final pdfFile = await PdfParagraphApi.generateShipmentInvoiceReport(model);
                  PdfParagraphApi.openFile(pdfFile);
                },
                child: Icon(Icons.print_rounded,color: blue,size: 30,)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'PaidBy'+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          model.paidByClient ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Payment status'+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                          model.paymentStatus ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Paid On Behalf By'+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                          model.paidOnBehalfBy ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Text(
                          'Payment Date'+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                          model.paymentDate!.year ==0000?'': model.paymentDate.toString().split(' ').first,
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Text(
                          S.of(context).cost+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            model.totalCost ?? '0',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Final Amount: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            model.finalAmount ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Discount'+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            model.discount.toString(),
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).importantNote+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            model.notes ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  FullImageScreen(model.invoiceImage, false)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                          child: Image.network(
                           model.invoiceImage??'',
                            fit: BoxFit.fill,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  FullImageScreen(model.receiptImage, false)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                          child: Image.network(
                            model.receiptImage??'',
                            fit: BoxFit.fill,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      )
                    ],),


                    Text(S.of(context).details+': ' , style: AppTextStyle.mediumBlueBold,),
                    ListView.builder(itemBuilder:(context,index){
                      return BillingCard(model: model.billingDetails[index],);
                    },itemCount: model.billingDetails.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                    ),


                    Row(
                      children: [
                        Text(
                          S.of(context).createdBy,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Text(
                          model.createdByUser ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).createdAt,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Text(
                          model.createdAt.toString().split(' ').first,
                          style: AppTextStyle.mediumBlueBold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).updatedBy,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Text(
                          model.updatedByUser ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).updatedAt,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Text(
                          model.updatedAt.toString().split(' ').first,
                          style: AppTextStyle.mediumBlueBold,
                        ),
                      ],
                    ),
                    RoundedButton(lable: 'Attach documents', icon: '',
                        color: blue, style: AppTextStyle.mediumWhiteBold,
                        go: (){
                          addAttached(model);
                        }, radius: 12),
                    model.paymentStatus =='notpaid'? RoundedButton(lable: 'Pay the bill', icon: '',
                        color: Colors.green, style: AppTextStyle.mediumWhiteBold,
                        go: (){
                          payBill(model);
                        }, radius: 12) :RoundedButton(lable: 'Print receipt', icon: '',
                        color: Colors.grey, style: AppTextStyle.mediumWhiteBold,
                        go: (){
                          _showSerAlert(context);
                        }, radius: 12),
                  ],
                ),
              )
              ],
            ),
          ),
        ),
    );
  }
  _showSerAlert(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Text('Receipt'),
            content: Text('${model.finalAmount.toString()} has been received from ${model.clientUserName} at ${model.paymentDate.toString().split(' ').first}'),
            actions: [
              Row(
                children: [
                  FlatButton(onPressed: (){}, child: Row(children: [
                    Icon(Icons.print, color: blue,size: 30,),
                  ],)),
                  Text('Print receipt')
                ],
              )

            ],
          );
        });
  }
}
