import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_mark/widget/mark_card.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/alert_widget.dart';

class MarkSuccessfullyScreen extends StatefulWidget {
 final List<Mark> items;
 final List<ClientModel> clients;
 final Function deleteMark;
 final Function addMark;
 final Entry optionItem;
 final TextEditingController markNumberController;
 final Function onClientSelect;
 MarkSuccessfullyScreen({required this.items, required this.deleteMark,required this.addMark, required this.markNumberController,required this.clients, required this.optionItem,required this.onClientSelect});

  @override
  _MarkSuccessfullyScreenState createState() => _MarkSuccessfullyScreenState();
}

class _MarkSuccessfullyScreenState extends State<MarkSuccessfullyScreen> {

  late DropListModel dropListModelClient;
  late Entry optionItemSelectedClient ;
  late List<Entry> client;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(StaticImage.mark)),

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
                  return MarkCard(
                    model: widget.items[index] ,
                    incrementNumber: (index+1).toString(),
                    optionItem: widget.optionItem
                    ,deleteMark: (markid,userID,optionItemSelectedClient){
                    widget.deleteMark(markid ,userID ,optionItemSelectedClient);
                  },);
                }),
            Card(
              color: blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: white)),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(start: 5),
                          child: TextField(
                            controller: widget.markNumberController,
                            decoration: InputDecoration(
                              hintText:  S.of(context).enterMark,
                              hintStyle: white18text,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            style: white16text,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap: (){
                          if(widget.markNumberController.text.isEmpty) {
                            AlertWidget.showAlert(context, false, S.of(context).fillAllField);
                          }
                        else {
                          MarkRequest mark = MarkRequest(widget.markNumberController.text,widget.optionItem.id);
                            widget.addMark(mark);
                          }
                        },
                        child: Icon(Icons.add_circle_outline_sharp ,color: white,size: 30,))
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
    client = <Entry>[];
    optionItemSelectedClient =  widget.optionItem;

    for(ClientModel item in widget.clients){
      Entry v = Entry(item.userName! ,item.id! ,[]);
      client.add(v);
    }
    dropListModelClient = DropListModel(client);
  }
}
