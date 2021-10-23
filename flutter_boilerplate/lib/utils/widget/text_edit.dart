import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class TextEdit extends StatelessWidget {
  final String hint;
  final String title;
  final Function onChange;
  TextEdit({required this.hint ,required this.title,required this.onChange});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller..text=title;
    return Container(
      // height: height,
      margin: const EdgeInsets.all(15.0),
      // padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
         border: Border.all(color: AppThemeDataService.AccentColor ,),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Theme(
        data: ThemeData(
          textSelectionTheme: TextSelectionThemeData(selectionColor: AppThemeDataService.AccentColor),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: TextField(
            onChanged: (value){
              onChange(value);
            },
            cursorColor: Colors.black,
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              // labelText: title,
              hintStyle:basic14text,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,

            ),
            style: basic14text,),
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
        border: Border.all(color: greyBlack ,),
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
          hintStyle: white18text,
            filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,

        ), style: white16text,),
      ),
    );
  }
}