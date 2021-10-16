import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_mark/model/markModel.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_mark/state_manager/mark_state_manager.dart';
import 'package:pasco_shipping/module_mark/ui/state/mark_first_time_successfully.dart';
import 'package:pasco_shipping/module_mark/ui/state/mark_state.dart';
import 'package:pasco_shipping/module_mark/widget/mark_card.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
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
  late List<ClientModel> clients;
  ScrollController controller = ScrollController();
 late bool isFirst;
  final TextEditingController _markNumberController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    print("Screen rebuild");
    return Background(
      showFilter: false,
      goBack: (){
        // Navigator.pop(context , items);
      },
      // controller: controller,
      // isHome: false,
        child: Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: S.of(context).marks
      // ,currentIndex: -1,
      // isResultScreen: false,
    );
  }

  @override
  void initState() {
    super.initState();
    clients = [];
    isFirst = true;
    currentState = LoadingMarkState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

   void init()  {
    if(ModalRoute.of(context)!.settings.arguments == null){
      widget._stateManager.getClients();
    }else{
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;
      int userID = arguments['userID'];
      String userName = arguments['userName'].toString();
      Entry optionItem  =  Entry(userName, userID, []);;
      widget._stateManager.getUserMarks(userID.toString(), [], optionItem);

    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(isFirst){
      init();
      isFirst =false;
    }
  }

  Widget Screen(){
    if(currentState is LoadingMarkState){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            LoadingIndicator(AppThemeDataService.AccentColor),
          ],
        ),
      );
    }
    else if (currentState is SuccessfullyFetchMarkState){
      SuccessfullyFetchMarkState? state = currentState as SuccessfullyFetchMarkState?;
      items = state!.marks;
      clients =state.clients;
      return MarkSuccessfullyScreen(deleteMark:  (markID ,userID,optin){
        widget._stateManager.deleteMark(markID.toString(),userID.toString(),optin);
      }, items: items,
        addMark: (request){
        widget._stateManager.createMark(request,state.optionItem);
      },markNumberController: _markNumberController, clients: clients,
        optionItem: state.optionItem, onClientSelect: (optionItem){
          widget._stateManager.getUserMarks(optionItem.id.toString(), state.clients , optionItem);
        },
      );

    }
    else if(currentState is SuccessfullyModifyMarkState){
      SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
      items = state.marks;
      // Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
      _markNumberController.clear();
      return MarkSuccessfullyScreen(deleteMark: (markID ,userID,optin){
        widget._stateManager.deleteMark(markID.toString(),userID.toString(),optin);
      }, items: items, addMark: (request){
        widget._stateManager.createMark(request,state.optionItem);
      },markNumberController: _markNumberController,
          clients: clients, optionItem: state.optionItem,
        onClientSelect: (optionItem){
          widget._stateManager.getUserMarks(optionItem.id.toString(), clients , optionItem);

        }
      );
    }
    else if(currentState is MarkFirstState){
      MarkFirstState? state = currentState as MarkFirstState?;
      return MarkFirstTime(clients: state!.clients,onClientSelect: (optionItem){
        widget._stateManager.getUserMarks(optionItem.id.toString(), state.clients , optionItem);
      },);
    }
    else {
      return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            ErrorScreen(retry: (){},error: 'error',isEmptyData: false,),
          ],
        ),
      );
    }
  }

  void _showDialog(BuildContext context , String msg) {
    // flutter defined function
    CoolAlert.show(
      width: 150,
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
