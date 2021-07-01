import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_previous/model/product_type.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';

class ChoiceCard extends StatefulWidget {
  final Category type;
  const ChoiceCard(this.type);

  @override
  _ChipCardState createState() => _ChipCardState();
}

class _ChipCardState extends State<ChoiceCard> {

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar:widget.type.isSelected ?  CircleAvatar(
        backgroundColor:Colors.transparent,
        child: Icon(Icons.check , color:white,),
      ): Container(width: 0,height: 0,),
      label: Text(
        widget.type.name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: widget.type.isSelected ? AppThemeDataService.AccentColor :greyBlack,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
    // return Wrap(
    //   spacing: 6.0,
    //   runSpacing: 6.0,
    //   children: <Widget>[
    //     _buildChip('Gamer',true),
    //     _buildChip('Hacker', false),
    //     _buildChip('Developer', false),
    //     _buildChip('Racer',false),
    //     _buildChip('Traveller', false),
    //     _buildChip('Racer',false),
    //     _buildChip('Traveller', false),
    //     _buildChip('Racer',false),
    //     _buildChip('Traveller', false),
    //   ],
    // );
  }

  // Widget _buildChip(String label , bool selected) {
  //   return InkWell(
  //     onTap: (){
  //       setState(() {
  //         print(selected);
  //         selected = !selected;
  //         print(selected);
  //       });
  //     },
  //     child: Chip(
  //       labelPadding: EdgeInsets.all(2.0),
  //       avatar:selected ?  CircleAvatar(
  //         backgroundColor:Colors.transparent,
  //         child: Icon(Icons.check , color:white,),
  //       ): Container(width: 0,height: 0,),
  //       label: Text(
  //         label,
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //       backgroundColor: selected ? AppThemeDataService.AccentColor :greyBlack,
  //       elevation: 6.0,
  //       shadowColor: Colors.grey[60],
  //       padding: EdgeInsets.all(8.0),
  //     ),
  //   );
  // }
}
