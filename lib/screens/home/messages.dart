import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:paikee/backend/api.dart';
import 'package:paikee/backend/models/chat_list.dart';
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
              }),
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
    ThemeData theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int i) {
          Chat chat = chats[i];
          return Column(
            children: [
              ListTile(
                leading: Badge(
                  badgeColor: theme.primaryColor,
                  elevation: 0,
                  showBadge: chat.isOnline,
                  position: BadgePosition.bottomEnd(bottom: 0, end: 0),
                  borderSide: BorderSide(
                      color: theme.scaffoldBackgroundColor, width: 1.5),
                  child: CircleAvatar(
                      foregroundImage: Image.network(chat.avatar).image),
                ),
                title: Text(chat.chatWith),
                subtitle: chat.answered
                    ? RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "You: ",
                                style: TextStyle(
                                    color: theme.primaryColorDark,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: chat.latestMessage,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      )
                    : Text(
                        chat.latestMessage,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600),
                      ),
                trailing: Column(
                  mainAxisAlignment: chat.unread > 0
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    if (chat.unread > 0)
                      Container(
                        alignment: Alignment.center,
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            color: theme.primaryColorDark,
                            borderRadius: BorderRadiusDirectional.circular(8)),
                        child: Text(
                          chat.unread.toString(),
                          style:
                              TextStyle(color: theme.scaffoldBackgroundColor),
                        ),
                      ),
                    Text(
                      chat.when,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                dense: true,
              ),
              Container(
                width: screenWidth * 0.9,
                height: 1,
                color: Colors.grey.shade300,
              )
            ],
          );
        });
  }
}
