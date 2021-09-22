import 'package:flutter/material.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class TextEdit extends StatelessWidget {
  final String title;
  final double height;
  final Function onChange;
  const TextEdit(this.title, this.height , this.onChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      margin: const EdgeInsets.all(15.0),
      // padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black ,),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Theme(
         data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.blue[200]),
      ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: TextField(
            onChanged: (value){
              onChange(value);
            },
            cursorColor: Colors.blue,
            maxLines: null,
            decoration: InputDecoration(
            hintText: title,
            hintStyle:AppTextStyle.mediumDeepGray,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,

          ),
            style: AppTextStyle.mediumBlack,),
        ),
      ),
    );
  }
}
class TextEditLocation extends StatelessWidget {
  // final String title;
  final double height;
  final TextEditingController controller;
  const TextEditLocation(this.height, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(15.0),
      // padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black ,),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 1),
        child: TextField(
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: controller,

          decoration: InputDecoration(
          hintText: controller.text,
          hintStyle: AppTextStyle.mediumDeepGray,
            filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,

        ), style: AppTextStyle.mediumBlackBold,),
      ),
    );
  }
}