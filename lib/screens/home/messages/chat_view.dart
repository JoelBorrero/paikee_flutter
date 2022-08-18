import 'package:flutter/material.dart';

import 'package:paikee/backend/models/chat_list.dart';
import 'package:paikee/backend/models/messages.dart';
import 'package:paikee/widgets/components/message_bubble.dart';
import 'package:paikee/widgets/components/text_components.dart';

const List messages = [
  {
    "date": "Monday 14",
    "messages": [
      {"sent": true, "date": "11:29 pm", "text": "I'll text u tomorrow"},
      {"sent": false, "date": "11:53 pm", "text": "Cool! Let me know :smile:"},
    ]
  },
  {
    "date": "Tuesday 15",
    "messages": [
      {"sent": true, "date": "11:59 am", "text": "Hi!"},
      {"sent": false, "date": "12:56 pm", "text": "Hello"},
      {"sent": true, "date": "11:30 pm", "text": "Do u teach speaking"},
      {
        "sent": true,
        "date": "11:30 pm",
        "text": "I need to improve my fluency for work meetings."
      },
      {"sent": false, "date": "2:41 pm", "text": "Yes, we can have a class"},
      {"sent": true, "date": "3:33 pm", "text": "Ok"},
      {"sent": false, "date": "3:43 pm", "text": "Let me know :smile:"},
      {
        "sent": true,
        "date": "3:57 pm",
        "text": "I will reserve the class in a minute"
      },
      {"sent": true, "date": "3:58 pm", "text": "Thanks"},
    ]
  },
];

class ChatView extends StatefulWidget {
  final Chat chat;
  const ChatView({Key? key, required this.chat}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left)),
                Row(
                  children: [
                    CircleAvatar(
                      foregroundImage: Image.network(widget.chat.avatar).image,
                      radius: 25,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textH3(widget.chat.chatWith),
                        Text(
                          widget.chat.isOnline ? "en línea" : "ausente",
                          style: TextStyle(
                              color: widget.chat.isOnline
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 1,
              color: Colors.grey.shade300,
            ),
            const MessagesListView()
          ],
        ),
      ),
    );
  }
}

class MessagesListView extends StatelessWidget {
  const MessagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: messages.length,
        itemBuilder: (_, i) => SingleDayMessages(
          data: MessageDay.fromJson(messages[i]),
        ),
      ),
    );
  }
}

class SingleDayMessages extends StatelessWidget {
  final MessageDay data;
  const SingleDayMessages({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const SizedBox(
        height: 10,
      ),
      textH3(data.date)
    ];
    data.messages.forEach(
      ((message) {
        children.add(
          MessageBubble(message: message),
        );
      }),
    );
    return Column(
      children: children,
    );
  }
}
