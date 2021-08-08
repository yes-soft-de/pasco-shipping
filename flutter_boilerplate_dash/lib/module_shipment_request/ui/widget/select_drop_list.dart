import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class SelectDropList extends StatefulWidget {

final Entry itemSelected;
   DropListModel dropListModel;
  final Function(Entry optionItem) onOptionSelected;

  SelectDropList( this.itemSelected,this.dropListModel,this.onOptionSelected, );

  @override
  _SelectDropListState createState() => _SelectDropListState(itemSelected ,dropListModel);
}

class _SelectDropListState extends State<SelectDropList> with SingleTickerProviderStateMixin {

late Entry optionItemSelected;
 DropListModel dropListModel;

late AnimationController expandController;
late Animation<double> animation;

bool isShow = false;

_SelectDropListState(this.optionItemSelected ,this.dropListModel);

@override
void initState() {
  super.initState();

  expandController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350)
  );
  animation = CurvedAnimation(
    parent: expandController,
    curve: Curves.fastOutSlowIn,
  );
  _runExpandCheck();
}

void _runExpandCheck() {
  if(isShow) {
    expandController.forward();
  } else {
    expandController.reverse();
  }
}

@override
void dispose() {
  expandController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 15),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.white,
                        offset: Offset(0, 2))
                  ],
                ),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.card_travel, color: AppThemeDataService.AccentColor,),
                    SizedBox(width: 10,),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            this.isShow = !this.isShow;
                            _runExpandCheck();
                            setState(() {
                            });
                          },
                          child:optionItemSelected.title=='choose' ?Text('choose' ,style: TextStyle(color: Colors.blueGrey),): Text(optionItemSelected.title, style: TextStyle(
                              color: AppThemeDataService.AccentColor,
                              fontSize: 16),),
                        )
                    ),
                    Align(
                      alignment: Alignment(1, 0),
                      child: Icon(
                        isShow ? Icons.arrow_drop_down : Icons.arrow_right,
                        color: AppThemeDataService.AccentColor,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizeTransition(
                axisAlignment: 2.0,
                sizeFactor: animation,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: _buildDropListOptions(dropListModel.listOptionItems,context),
                ),
              )
            ])
    ),
//          Divider(color: Colors.grey.shade300, height: 1,)
  );
}

Column _buildDropListOptions(List<Entry> items, BuildContext context) {
  return Column(
    children: items.map((item) => _buildTiles(item)).toList(),
  );
}

// Widget _buildSubMenu(OptionItem item, BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
//     child: GestureDetector(
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: Container(
//               padding: const EdgeInsets.only(top: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(item.title,
//                       style: TextStyle(
//                           color: AppThemeDataService.AccentColor,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14),
//                       maxLines: 3,
//                       textAlign: TextAlign.start,
//                       overflow: TextOverflow.ellipsis),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 10),
//                     child: Divider(color: greyWhite,),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       onTap: () {
//         this.optionItemSelected = item;
//         isShow = false;
//         expandController.reverse();
//         widget.onOptionSelected(item);
//       },
//     ),
//   );
// }

Widget _buildTiles(Entry root) {
  if (root.children.isEmpty) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          this.optionItemSelected = root;
          isShow = false;
          expandController.reverse();
          widget.onOptionSelected(root);
        },
        child: ListTile(
          title: Text(root.title , style: black14text,),
        ),
      ),
    );
  }
  return ExpansionTile(
    key: PageStorageKey<Entry>(root),
    trailing: Icon(
      Icons.keyboard_arrow_down,
      color: AppThemeDataService.AccentColor,
    ),
    title: Text(root.title ,   style: TextStyle(
        color: AppThemeDataService.AccentColor,
        fontWeight: FontWeight.w400,
        fontSize: 14)),
    children: root.children.map<Widget>(_buildTiles).toList(),
  );
}
}