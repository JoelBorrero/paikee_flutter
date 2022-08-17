// To parse this JSON data, do
//
//     final chatListResponse = chatListResponseFromJson(jsonString);

import 'dart:convert';

String chatListResponseToJson(ChatListResponse data) =>
    json.encode(data.toJson());

class ChatListResponse {
  ChatListResponse({
    required this.data,
  });

  List<Chat> data;

  factory ChatListResponse.fromJson(List<dynamic> json) => ChatListResponse(
        data: List<Chat>.from(json.map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Chat {
  Chat({
    required this.id,
    required this.chatWith,
    required this.avatar,
    required this.latestMessage,
    required this.when,
    required this.unread,
    required this.answered,
    required this.isOnline,
  });

  int id;
  String chatWith;
  String avatar;
  String latestMessage;
  String when;
  int unread;
  bool answered;
  bool isOnline;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        chatWith: json["with"],
        avatar: json["avatar"],
        latestMessage: json["latest_message"],
        when: json["when"],
        unread: json["unread"],
        answered: json["answered"],
        isOnline: json["is_online"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "with": chatWith,
        "avatar": avatar,
        "latest_message": latestMessage,
        "when": when,
        "unread": unread,
        "answered": answered,
        "is_online": isOnline,
      };
}
