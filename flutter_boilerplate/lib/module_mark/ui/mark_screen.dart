import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_mark/model/markModel.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_mark/state_manager/mark_state_manager.dart';
import 'package:pasco_shipping/module_mark/ui/state/mark_state.dart';
import 'package:pasco_shipping/module_mark/widget/mark_card.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import 'state/mark_successfully.dart';

@injectable
class MarkScreen extends StatefulWidget {
 final MarkStateManager _stateManager;
  const MarkScreen(this._stateManager);
  @override
  _MarkScreenState createState() => _MarkScreenState();
}

class _MarkScreenState extends State<MarkScreen> {
  late MarkState currentState;
  late List<Mark> items;
  ScrollController controller = ScrollController();
  final TextEditingController _markNumberController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    print("Screen rebuild");
    return Background(
      goBack: (){
        Navigator.pop(context);
      },
      controller: controller,
      isHome: false,
        child: Screen(),
        title: S.of(context).mark
      ,currentIndex: -1,
      isResultScreen: false,
    );
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingMarkState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getMyMarks();
  }

  Widget Screen(){
    if(currentState is LoadingMarkState){
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          LoadingIndicator(AppThemeDataService.AccentColor),
        ],
      );
    }
    else if (currentState is SuccessfullyFetchMarkState){
      SuccessfullyFetchMarkState? state = currentState as SuccessfullyFetchMarkState?;
      items = state!.marks;
      return MarkSuccessfullyScreen(deleteMark: (id){
        widget._stateManager.deleteMark(id.toString());
      }, items: items,
        addMark: (request){
        widget._stateManager.createMark(request);
      },markNumberController: _markNumberController,
      );

    }
    else if(currentState is SuccessfullyModifyMarkState){
      SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
      items = state.marks;
      // Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
      _markNumberController.clear();
      return MarkSuccessfullyScreen(deleteMark: (id){
        widget._stateManager.deleteMark(id.toString());
      }, items: items, addMark: (request){
        widget._stateManager.createMark(request);
      },markNumberController: _markNumberController,);
    }
    else {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          ErrorScreen(retry: (){},error: 'error',),
        ],
      );
    }
  }

  void _showDialog(BuildContext context , String msg) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      // title: S.of(context).success,
      backgroundColor:AppThemeDataService.PrimaryColor,
      confirmBtnColor:AppThemeDataService.AccentColor,
      onConfirmBtnTap: (){
      },
      text: msg,
    );
  }
}
