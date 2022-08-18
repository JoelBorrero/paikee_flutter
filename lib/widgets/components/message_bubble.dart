import 'package:flutter/material.dart';

import 'package:paikee/backend/models/messages.dart';
import 'package:paikee/widgets/components/text_components.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message}) : super(key: key);
  final MessageElement message;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Widget> children = [
      const SizedBox(width: 30),
      textH4(message.date),
      const SizedBox(width: 5),
      Flexible(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: message.sent ? theme.primaryColorDark : theme.cardColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(message.sent ? 20 : 8),
              topRight: Radius.circular(message.sent ? 8 : 20),
              bottomLeft: const Radius.circular(20),
              bottomRight: const Radius.circular(20),
            ),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade300)],
          ),
          child: Text(
            message.text,
            style: TextStyle(
                color: message.sent
                    ? theme.scaffoldBackgroundColor
                    : theme.primaryColorDark),
          ),
        ),
      )
    ];
    if (!message.sent) {
      children = List.from(children.reversed);
    }
    return Row(
      mainAxisAlignment:
          message.sent ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    );
  }
}
