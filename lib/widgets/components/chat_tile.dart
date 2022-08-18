import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:paikee/backend/models/chat_list.dart';
import 'package:paikee/screens/home/messages/chat_view.dart';
import 'package:paikee/widgets/components/text_components.dart';

class ChatTile extends StatefulWidget {
  final Chat chat;
  const ChatTile({Key? key, required this.chat}) : super(key: key);

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          leading: Badge(
            badgeColor: theme.primaryColor,
            elevation: 0,
            showBadge: widget.chat.isOnline,
            position: BadgePosition.bottomEnd(bottom: 0, end: 0),
            borderSide:
                BorderSide(color: theme.scaffoldBackgroundColor, width: 1.5),
            child: CircleAvatar(
                foregroundImage: Image.network(widget.chat.avatar).image),
          ),
          title: textMedium(widget.chat.chatWith, fontWeight: FontWeight.w600),
          subtitle: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                if (widget.chat.answered)
                  TextSpan(
                    text: "You: ",
                    style: TextStyle(
                        color: theme.primaryColorDark,
                        fontWeight: FontWeight.bold),
                  ),
                TextSpan(
                  text: widget.chat.latestMessage,
                  style: TextStyle(
                      color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          trailing: Column(
            mainAxisAlignment: widget.chat.unread > 0
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (widget.chat.unread > 0)
                Container(
                  alignment: Alignment.center,
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: theme.primaryColorDark,
                      borderRadius: BorderRadiusDirectional.circular(8)),
                  child: Text(
                    widget.chat.unread.toString(),
                    style: TextStyle(color: theme.scaffoldBackgroundColor),
                  ),
                ),
              textH4(widget.chat.when),
            ],
          ),
          dense: true,
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => ChatView(chat: widget.chat)))
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 1,
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}
