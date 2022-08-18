import 'dart:convert';

MessageDay messageFromJson(String str) => MessageDay.fromJson(json.decode(str));

String messageToJson(MessageDay data) => json.encode(data.toJson());

class MessageDay {
  final String date;
  final List<MessageElement> messages;
  MessageDay({
    required this.date,
    required this.messages,
  });

  factory MessageDay.fromJson(Map<String, dynamic> json) => MessageDay(
        date: json["date"],
        messages: List<MessageElement>.from(
            json["messages"].map((x) => MessageElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class MessageElement {
  final bool sent;
  final String date;
  final String text;
  MessageElement({
    required this.sent,
    required this.date,
    required this.text,
  });

  factory MessageElement.fromJson(Map<String, dynamic> json) => MessageElement(
        sent: json["sent"],
        date: json["date"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "sent": sent,
        "date": date,
        "text": text,
      };
}
