import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';
import 'package:pasco_shipping/module_receiver/state_manager/receiver_state_manager.dart';
import 'package:pasco_shipping/module_receiver/ui/state/receiver_state.dart';
import 'package:pasco_shipping/module_receiver/ui/state/receiver_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';


@injectable
class ReceiverScreen extends StatefulWidget {
 final ReceiverStateManager _stateManager;
  const ReceiverScreen(this._stateManager);
  @override
  _MarkScreenState createState() => _MarkScreenState();
}

class _MarkScreenState extends State<ReceiverScreen> {
  late ReceiverState currentState;
  late List<ReceiverModel> items;
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
        title: S.of(context).receivers
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
    widget._stateManager.getMyReceiver();
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
      return ReceiverSuccessfullyScreen(deleteReceiver: (id){
        widget._stateManager.deleteReceiver(id.toString());
      }, items: items,
        addReceiver: (request){
        widget._stateManager.createReceiver(request);
      },updateReceiver: (re){
          // widget._stateManager.u(re);

        },
      );

    }
    else if(currentState is SuccessfullyModifyMarkState){
      SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
      items = state.marks;
      return ReceiverSuccessfullyScreen(deleteReceiver: (id){
        widget._stateManager.deleteReceiver(id.toString());
      }, items: items, addReceiver: (request){
        widget._stateManager.createReceiver(request);
      }, updateReceiver: (){},);
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
}
