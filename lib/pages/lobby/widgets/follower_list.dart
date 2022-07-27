import 'package:clubhouse_ui/data/models/user.dart';
import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';


class FollowerList extends StatelessWidget {
  const FollowerList({super.key, required this.user, required this.onProfileTap, required this.onRoomButton});
  final User user;
  final VoidCallback onProfileTap;
  final VoidCallback onRoomButton;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onProfileTap
            ,
          child: RoundImage(
            height: 40,
            width: 40,
            url: user.profileImage,
            borderRadius: 20,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(user.name,style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${user.lastAccessTime}',
                style: TextStyle(
                  fontSize: 12,
                  color: Style.DarkBrown
              ),
              )
          ],
               ),
        ),
        Container(height: 18,
          child: RoundButton(
          color: Style.LightGreen,
          onPressed: onRoomButton,
          fontSize: 12,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text('+ Room',style:
              TextStyle(color: Style.AccentGreen),),
              Icon(
                Icons.lock,
                color: Style.AccentGreen,
                size: 12,)],),),)
      ],
    );
  }
}