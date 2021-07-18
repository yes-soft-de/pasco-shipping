import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_auth/authorization_routes.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_chat/ui/state/chat_list/chat_list.state.dart';
import 'package:pasco_shipping/module_chat/ui/widget/chat_item_card/chat_item_card.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

import '../../../chat_routes.dart';


@injectable
class ChatsListScreen extends StatefulWidget {
  // final ChatsListStateManager _stateManager;
  final AuthService _authService;

  ChatsListScreen(
    // this._stateManager,
    this._authService,
  );

  @override
  ChatsListScreenState createState() => ChatsListScreenState();
}

class ChatsListScreenState extends State<ChatsListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late ChatsListState currentState;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    currentState = ChatsListStateInit(this);
    controller  =ScrollController();
    // widget._stateManager.stateStream.listen((event) {
    //   currentState = event;
    //   if (mounted) {
    //     setState(() {});
    //   }
    // });

    // widget._stateManager.getChatsLists(this);
  }

  void getChatsLists() {
    // widget._stateManager.getChatsLists(this);
  }

  @override
  Widget build(BuildContext context) {
 return _screenUi();
    // widget._authService.isLoggedIn.then((value) {
    //   if (!value) {
    //     RouteHelper redirectTo = new RouteHelper(
    //         redirectTo: ChatRoutes.chatsListRoute, additionalData: null);
    //     Navigator.of(context).pushNamed(
    //       AuthorizationRoutes.LOGIN_SCREEN,
    //       arguments: redirectTo,
    //     );
    //   }
    // });

    // return WillPopScope(
    //   onWillPop: () async {
    //     var additionalData = ModalRoute.of(context)!.settings.arguments;
    //     if (additionalData != null && additionalData is bool) {
    //       // Navigator.of(context).pushNamedAndRemoveUntil(
    //       //     MainRoutes.MAIN_SCREEN_ROUTE, (route) => false);
    //       return false;
    //     }
    //     return true;
    //   },
    //   child: Scaffold(
    //     key: _scaffoldKey,
    //     appBar: TurkishAppBar.getTurkishAppBar(
    //         context, _scaffoldKey, S.of(context).chats),
    //     drawer: TurkishNavigationDrawer(),
    //     body: currentState.getUI(context),
    //   ),
    // );
  }

  Widget _screenUi() {
    return Background(
      goBack: (){
        Navigator.pop(context);
      },
      // controller: controller,
      // key: _scaffoldKey,
      // appBar: TurkishAppBar.getTurkishAppBar(
      //     context, _scaffoldKey, S.of(context).chats),
      // drawer: TurkishNavigationDrawer(),
      // isHome: true,
      title: "chats",
      // currentIndex: 2,
      // isResultScreen: false,
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                print("here");
                Navigator.of(context).pushNamed(
                  ChatRoutes.chatRoute,
                  arguments: 'higuygbk' /*currentOrder.chatRoomId*/,
                );
              },
              child: Container(
                child: ChatItemCard(
                    userName: 'zolfekar seleten',
                    userImage:
                        'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x', time: '12AM',),
              ),
            );
          }),
    );
  }
}
