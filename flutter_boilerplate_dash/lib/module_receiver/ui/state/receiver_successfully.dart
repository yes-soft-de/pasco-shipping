import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_mark/widget/mark_card.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_receiver/widget/receiver_card.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class ReceiverSuccessfullyScreen extends StatefulWidget {
 final List<ReceiverModel> items;
 final List<ClientModel> clients;

 final Function addMark;
 final Entry optionItem;
 final Function onClientSelect;
 ReceiverSuccessfullyScreen({required this.items,required this.addMark,required this.clients, required this.optionItem,required this.onClientSelect});

  @override
  _MarkSuccessfullyScreenState createState() => _MarkSuccessfullyScreenState();
}

class _MarkSuccessfullyScreenState extends State<ReceiverSuccessfullyScreen> {

  late DropListModel dropListModelClient;
  late Entry optionItemSelectedClient ;
  late List<Entry> client;

late  TextEditingController fullName;
 late TextEditingController phone;
 late TextEditingController address;
 late TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(StaticImage.receiver)),

            Text(
              S.of(context).clients,
              style: AppTextStyle.mediumBlackBold,
            ),
            SelectDropList(
              this.optionItemSelectedClient,
              this.dropListModelClient,
                  (optionItem) {
                optionItemSelectedClient = optionItem;
                widget.onClientSelect(optionItem);
                // widget.shipmentRequest.exportWarehouseID =optionItem.id;
                // widget.shipmentRequest.exportWarehouseName =optionItem.title;
                // print("nameWear"  +  optionItem.title);
                // setState(() {});
              },
            ),
          widget.items.isEmpty ?
          Text(S.of(context).nothingAdded , style: AppTextStyle.mediumRedBold,)
          :ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return ReceiverCard(
                    model: widget.items[index] ,
                    optionItem: widget.optionItem
                   );
                }),
            Card(
              color: blue,
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
                          controller: fullName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).name,

                          ),
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
                          controller: email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:S.of(context).email,

                          ),
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
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).phone,

                          ),
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
                          controller: address,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).address,

                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            RoundedButton(lable: S.of(context).save, icon: '', color: blue, style: AppTextStyle.largeWhiteBold, go: (){
              if(phone.text.isEmpty ||fullName.text.isEmpty) {
                Fluttertoast.showToast(msg: S.of(context).fillAllField);
              }
              else {
                ReceiverRequest mark = ReceiverRequest(email: email.text,phone: phone.text ,
                    fullName: fullName.text,
                    address: address.text,clientUserID:widget.optionItem.id);
                widget.addMark(mark);
              }
            }, radius: 12)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fullName = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    email = TextEditingController();


    client = <Entry>[];
    optionItemSelectedClient =  widget.optionItem;

    for(ClientModel item in widget.clients){
      Entry v = Entry(item.userName! ,item.id! ,[]);
      client.add(v);
    }
    dropListModelClient = DropListModel(client);
  }
}
