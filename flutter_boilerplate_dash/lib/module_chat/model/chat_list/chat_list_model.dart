
import 'package:intl/intl.dart';

class ChatListModel {
  String roomID;
  String username;
  String image;
  String startAt;

  ChatListModel({required this.roomID, required this.username, required this.image, required this.startAt});

 // static List<ChatListModel> getChats(ChatsResponse response){
 //   List<ChatListModel> result = [];
 //   var df = new DateFormat('dd/MM/yyyy');
 //
 //   response.data.forEach((element) {
 //     var date = new DateTime.fromMillisecondsSinceEpoch(element.startAt.timestamp * 1000);
 //
 //
 //     result.add(new ChatListModel(
 //       image: element.image,
 //       roomID: element.roomID,
 //       username: element.username,
 //       startAt: df.format(date),
 //     ));
 //   });
 //
 //   return result;
 // }


}