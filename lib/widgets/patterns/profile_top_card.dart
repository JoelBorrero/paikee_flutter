import 'package:flutter/material.dart';
import 'package:paikee/backend/models/user.dart';

import 'package:paikee/widgets/components/rounded_top_card.dart';
import 'package:paikee/widgets/components/text_components.dart';

class ProfileTopCard extends StatefulWidget {
  final User user;
  const ProfileTopCard({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileTopCard> createState() => _ProfileTopCardState();
}

class _ProfileTopCardState extends State<ProfileTopCard> {
  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        roundedTopCard(
          color: theme.primaryColorDark,
          marginTop: 30,
          child: Container(
            width: screenSize.width,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Column(
              children: [
                textH2(user.name, dark: false),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textMedium(
                        "${user.role} • ${user.age} • ${user.countryName} ",
                        dark: false),
                    Image.network(user.countryFlag, width: 20)
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: screenSize.width * .9,
                  height: .5,
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                textSmall(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    dark: false),
                const SizedBox(height: 10),
                textH3("Habla", dark: false),
                const SizedBox(height: 6),
                textSmall(user.languajes.join(" - "), dark: false)
              ],
            ),
          ),
        ),
        CircleAvatar(
          radius: 40,
          foregroundImage: Image.network(user.avatar).image,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit,
                    size: 15, color: theme.scaffoldBackgroundColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
