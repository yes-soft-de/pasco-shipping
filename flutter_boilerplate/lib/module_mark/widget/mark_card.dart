import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/module_mark/model/markModel.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class MarkCard extends StatelessWidget {
  final Mark model;
  final String IncrementNumber;
  final Function deleteMark;
  // final String name;
  const MarkCard({required this.model, required this.IncrementNumber, required this.deleteMark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: black,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: Text(IncrementNumber, style: white16text,)),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.markNumber!,style: White14text,),
              ],
            ),
            InkWell(
                onTap: (){
                  if(model.used!) {
                    Fluttertoast.showToast(msg: 'Cannot delete this item');
                  }
                else {
                    deleteMark(model.id);
                  }
                },
                child: Icon(Icons.delete , color: Colors.red,size: 18,))
          ],
        ) ,
      ),
    );
  }
}
