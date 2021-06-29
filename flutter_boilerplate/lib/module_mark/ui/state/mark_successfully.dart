import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_mark/widget/mark_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class MarkSuccessfullyScreen extends StatelessWidget {
 final List<Mark> items;
 final Function deleteMark;
 final Function addMark;
 final TextEditingController markNumberController;
 MarkSuccessfullyScreen({required this.items, required this.deleteMark,required this.addMark, required this.markNumberController});

  @override
  Widget build(BuildContext context) {
    print("SuccessfullyScreen rebuild");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Row(
              children: [
                Text(
                  S.of(context).myPrevious,
                  style: white30text,
                ),
                Spacer(),
                Image.asset(StaticImage.book)
              ],
            ),
            subtitle: Text(
              S.of(context).mark,
              style: white30text,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.info,
                color: white,
                size: 15,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                S.of(context).deletePreviousMark,
                style: basic14text,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: greyWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 10),
            child: Text(
              S.of(context).previousMark,
              style: greyWhite14text,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return MarkCard(model: items[index] ,
                  incrementNumber: (index+1).toString()
                  ,deleteMark: (id){
                  deleteMark(id);
                },);
              }),
          Card(
            color: black,
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
                          controller: markNumberController,
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
                        if(markNumberController.text.isEmpty) {
                          Fluttertoast.showToast(msg: S.of(context).fillAllField);
                        }
                      else {
                        MarkRequest mark = MarkRequest(markNumberController.text);
                          addMark(mark);
                        }
                      },
                      child: Icon(Icons.add_circle_outline_sharp ,color: AppThemeDataService.AccentColor,size: 30,))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
