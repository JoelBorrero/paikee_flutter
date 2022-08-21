import 'package:flutter/material.dart';

class BottomTextBar extends StatefulWidget {
  final TextEditingController controller;
  final Function onSend;
  const BottomTextBar(
      {Key? key, required this.controller, required this.onSend})
      : super(key: key);

  @override
  State<BottomTextBar> createState() => _BottomTextBarState();
}

class _BottomTextBarState extends State<BottomTextBar> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: theme.primaryColorDark,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                print("emoji");
              },
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 35,
                color: theme.scaffoldBackgroundColor,
              )),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF434C63),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.only(bottom: 6, left: 10, top: 6),
            height: 50,
            child: SizedBox(
              width: width * 0.7,
              child: TextField(
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.scaffoldBackgroundColor),
                expands: true,
                minLines: null,
                maxLines: null,
                cursorColor: theme.scaffoldBackgroundColor,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  suffixIcon: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        widget.onSend(widget.controller.text);
                      });
                    },
                    child: Icon(
                      Icons.send_outlined,
                      color: theme.scaffoldBackgroundColor,
                      size: 20,
                    ),
                  ),
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
