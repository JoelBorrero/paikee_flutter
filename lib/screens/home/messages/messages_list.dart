import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:paikee/backend/api.dart';
import 'package:paikee/backend/models/chat_list.dart';
import 'package:paikee/widgets/components/chat_tile.dart';
import 'package:paikee/widgets/components/text_components.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textH1("Mensajes\n"),
        Flexible(
          child: FutureBuilder(
            future: getChats(),
            builder:
                (BuildContext _, AsyncSnapshot<ChatListResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return _ChatList(chats: snapshot.data!.data);
            },
          ),
        ),
      ],
    );
  }
}

class _ChatList extends StatelessWidget {
  final List<Chat> chats;
  const _ChatList({required this.chats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int i) {
          return ChatTile(chat: chats[i]);
        });
  }
}
