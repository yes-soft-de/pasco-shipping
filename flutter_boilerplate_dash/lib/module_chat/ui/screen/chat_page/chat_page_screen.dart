import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_chat/bloc/chat_page/chat_page.bloc.dart';
import 'package:pasco_shipping/module_chat/model/chat/chat_model.dart';
import 'package:pasco_shipping/module_chat/ui/widget/chat_bubble/chat_bbuble.dart';
import 'package:pasco_shipping/module_chat/ui/widget/chat_witer/chat_writer.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_upload/service/image_upload/image_upload_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class ChatScreen extends StatefulWidget {
  // final ChatPageBloc _chatPageBloc;
  // final ImageUploadService _uploadService;

  ChatScreen(
      // this._chatPageBloc,
      // this._uploadService,
      );

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatModel> _chatMessagesList = [
    ChatModel(sentDate: '12PM', sender: 'Sami', msg: 'hello'),
  ];
  int currentState = ChatPageBloc.STATUS_CODE_INIT;

  List<ChatBubbleWidget> chatsMessagesWidgets = [
    ChatBubbleWidget(
      showImage: true,
      me: true,
      message:
          'Hello, I would like to inquire about a shipment that I ordered 3 days ago',
      sentDate: '12:00',
    ),
    ChatBubbleWidget(
      showImage: true,
      me: false,
      message: 'What is the shipment number?',
      sentDate: '13:01 ',
    ),
    ChatBubbleWidget(
      showImage: true,
      me: true,
      message: '123546',
      sentDate: '14:02',
    ),
  ];

  late String chatRoomId;

  bool initiated = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    // widget._chatPageBloc.chatBlocStream.listen((event) {
    //   currentState = event.first;
    //   if (event.first == ChatPageBloc.STATUS_CODE_GOT_DATA) {
    //     _chatMessagesList = event.last;
    //     if (chatsMessagesWidgets.length == _chatMessagesList.length) {
    //     } else {
    //       buildMessagesList(_chatMessagesList).then((value) {
    //         if (this.mounted) {
    //           setState(() {
    //           _scrollController.animateTo(
    //               _scrollController.position.maxScrollExtent,
    //               duration: const Duration(milliseconds: 300),
    //               curve: Curves.easeOut
    //           );
    //         });
    //         }
    //   //     });
    //   //   }
    //   // }
    // });
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('in chat page ');
    // if (currentState == ChatPageBloc.STATUS_CODE_INIT) {
    //   chatRoomId = ModalRoute.of(context)!.settings.arguments.toString();
    //   widget._chatPageBloc.getMessages(chatRoomId);
    // }
    // Timer(Duration(milliseconds: 150), () => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));

    return Background(
      goBack: (){
        Navigator.pop(context);
      },
        // controller: _scrollController,
        // isHome: true,
        // isResultScreen: false,
        // currentIndex: 2,
        title: 'Chat Room',
        child: Column(
          children: [
            Card(
              color: greyWhite,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("What do you want to inquire about?"),
              ),
            ),
            ListView(
              controller: _scrollController,
              reverse: false,
              shrinkWrap: true,
              children: chatsMessagesWidgets,
            ),
            // Expanded(
            //   child: ChatWriterWidget(
            //     onMessageSend: (msg) {
            //     },
            //
            //   ),
            // ),
          ],
        ));
  }

  Future<void> buildMessagesList(List<ChatModel> chatList) async {
    List<ChatBubbleWidget> newMessagesList = [];
    // FirebaseAuth auth = await FirebaseAuth.instance;
    // User? user = auth.currentUser;
    // chatList.forEach((element) {
    //   newMessagesList.add(ChatBubbleWidget(
    //     message: element.msg,
    //     me: element.sender == user!.uid ? true : false,
    //     sentDate: (element.sentDate),
    //     showImage: false,
    //   ));
    // });
    chatsMessagesWidgets = newMessagesList;

    return;
  }
}
