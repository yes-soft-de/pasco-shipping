import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';
import 'package:pasco_shipping/module_receiver/widget/receiver_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ReceiverSuccessfullyScreen extends StatefulWidget {
 final List<ReceiverModel> items;
 final Function deleteReceiver;

 final Function updateReceiver;

 final Function addReceiver;

 ReceiverSuccessfullyScreen({required this.items, required this.deleteReceiver,required this.addReceiver,required this.updateReceiver});

  @override
  _ReceiverSuccessfullyScreenState createState() => _ReceiverSuccessfullyScreenState();
}

class _ReceiverSuccessfullyScreenState extends State<ReceiverSuccessfullyScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("SuccessfullyScreen rebuild");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         widget.items.isEmpty? Text(S.of(context).noReceiver ,style: TextStyle(color: Colors.red),):
         ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return

                  ReceiverCard(model: widget.items[index] ,
                  onDelete:(id){
                  widget.deleteReceiver(id);
                }, isEdtiable: false, onEdit:(re){
                   widget.updateReceiver(re);
                  } ,);
              }),
          Card(
            color: Colors.black,
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
                          color: Colors.grey,
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
                          hintText: S.of(context).fullName,
                        ),
                        controller: name,
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
                          color: Colors.grey,
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
                          hintText: S.of(context).phone,
                        ),
                        controller: phone,
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
                          color: Colors.grey,
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
                          hintText: S.of(context).address,
                        ),
                        controller: address,
                      ),
                    ),
                  ),
                  RoundedButton(lable: S.of(context).add, icon: '', color: AppThemeDataService.AccentColor, style: white18text, go: (){
                    if(phone.text.isEmpty || name.text.isEmpty) {
                      Fluttertoast.showToast(msg: S.of(context).fillAllField);
                    }
                    else {
                      ReceiverRequest mark = ReceiverRequest(fullName: name.text ,phone: phone.text ,address: address.text);
                      widget.addReceiver(mark);
                    }
                  }, radius: 12)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
