import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';

class StatusCard extends StatelessWidget {
  final String statusName;
  final bool selected;
  StatusCard(this.statusName, this.selected);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          color: selected ? AppThemeDataService.AccentColor :Colors.grey,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(statusName , style: AppTextStyle.mediumWhite),
          ),
        ),
        Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
      ],
    );
  }
}
