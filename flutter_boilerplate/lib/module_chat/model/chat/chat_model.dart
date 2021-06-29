class ChatModel {
 late  String sender;
 late String sentDate;
 late String msg;

  ChatModel({required this.sentDate, required this.sender, required this.msg});

  ChatModel.fromJson(Map<String, dynamic> jsonData) {
    sender = jsonData['sender'];
    msg = jsonData['msg'];
    sentDate = jsonData['sentDate'].toString();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'sender': sender,
      'msg': msg,
      'sentDate': sentDate
    };

    return jsonData;
  }
}
