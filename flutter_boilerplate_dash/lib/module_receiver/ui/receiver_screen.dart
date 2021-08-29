import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_filter_request.dart';

import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_receiver/state_manager/mark_state_manager.dart';
import 'package:pasco_shipping/module_receiver/ui/state/receiver_state.dart';
import 'package:pasco_shipping/module_receiver/ui/state/receiver_successfully.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';

import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import 'state/reciver_first_time_successfully.dart';

@injectable
class ReceiverScreen extends StatefulWidget {
 final ReceiverStateManager _stateManager;
  const ReceiverScreen(this._stateManager);
  @override
  _MarkScreenState createState() => _MarkScreenState();
}

class _MarkScreenState extends State<ReceiverScreen> {
  late  ReceiverState currentState;
  late List<ReceiverModel> items;
  late List<ClientModel> clients;
  ScrollController controller = ScrollController();
 late bool isFirst;
 late ReceiverFilterRequest request ;
  // final TextEditingController _markNumberController = TextEditingController();



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
        child: Screen(),
        title: S.of(context).receiver
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
      request = ReceiverFilterRequest(0);
    }else{
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;
      int userID = arguments['userID'];
      String userName = arguments['userName'].toString();
      Entry optionItem  =  Entry(userName, userID, []);
      request = ReceiverFilterRequest(userID);
      widget._stateManager.getUserReceiver(request, [], optionItem);

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
    else if (currentState is SuccessfullyFetchReceiverState){
      SuccessfullyFetchReceiverState? state = currentState as SuccessfullyFetchReceiverState?;
      items = state!.receivers;
      clients =state.clients;
      return ReceiverSuccessfullyScreen(items: items,
        addMark: (request){
        widget._stateManager.createMark(request,state.optionItem);
      }, clients: clients,
        optionItem: state.optionItem, onClientSelect: (optionItem){
        request.clientUserID = optionItem.id;
          widget._stateManager.getUserReceiver(request, state.clients , optionItem);
        },
      );

    }
    else if(currentState is SuccessfullyModifyMarkState){
      SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
      items = state.receivers;
      // Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
      // _markNumberController.clear();
      return ReceiverSuccessfullyScreen(items: items,
        addMark: (request){
          widget._stateManager.createMark(request,state.optionItem);
        }, clients: clients,
        optionItem: state.optionItem, onClientSelect: (optionItem){
          request.clientUserID = optionItem.id;
          widget._stateManager.getUserReceiver(request, clients , optionItem);
        },
      );
    }
    else if(currentState is MarkFirstState){
      MarkFirstState? state = currentState as MarkFirstState?;
      return ReceiverFirstTime(clients: state!.clients,onClientSelect: (optionItem){
        request.clientUserID = optionItem.id;
        widget._stateManager.getUserReceiver(request, state.clients , optionItem);
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
