import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatBubbleWidget extends StatefulWidget {
  final bool showImage;
  final String message;
  final String sentDate;
  final bool me;

  ChatBubbleWidget({
    required this.message,
    required this.sentDate,
    required this.me,
    required this.showImage,
  });

  @override
  State<StatefulWidget> createState() => ChatBubbleWidgetState();
}

class ChatBubbleWidgetState extends State<ChatBubbleWidget> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return widget.me ? myMessage() : otherMessage();
  }

  Widget myMessage() {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(0.0),
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            border: Border.all(color: Colors.grey),
            color: AppThemeDataService.AccentColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sentDate,
                  // timeago.format(widget.sentDate,
                  //     locale: Localizations.localeOf(context).languageCode,),
                  style: TextStyle(color: Colors.grey),
                ),
                widget.message.contains('http')
                    ? Image.network(widget.message
                        .replaceFirst('uploadimage', 'upload/image'))
                    : Text(
                        '${widget.message}',
                        style: TextStyle(
                            color:
                                /* Theme.of(context).brightness == Brightness.dark
                        ?*/
                                Colors.black
//                        : Colors.black,
                            ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otherMessage() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            border: Border.all(color: Colors.grey),
            color: AppThemeDataService.PrimaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sentDate,
                  // timeago.format(widget.sentDate,
                  //     locale: Localizations.localeOf(context).languageCode),
                  style: TextStyle(color: Colors.grey),
                ),
                widget.message.contains('http')
                    ? Image.network(widget.message
                        .replaceFirst('uploadimage', 'upload/image'))
                    : Text(
                        '${widget.message}',
                        style: TextStyle(
                            color:
                                /* Theme.of(context).brightness == Brightness.dark
                        ?*/
                                Colors.white
//                        : Colors.black,
                            ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
