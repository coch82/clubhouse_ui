import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/models/user.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key, required this.profile, required this.onProfileTab});
  final User profile;
  final VoidCallback onProfileTab;

  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container( 
          child: IconButton(
            onPressed: (() => {}), 
            icon: Icon(Icons.search),
            iconSize: 25,
            ),
        ),
        Spacer(),
        Container(
          child: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.mail),
            iconSize: 25,
            ),
        ),
        Container(
          child: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.calendar_today),
            iconSize: 25,
            ),
        ),
        Container(
          child: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications_active_outlined),
            iconSize: 25,
            ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: onProfileTab,
          child: RoundImage(url: 'https://www.bagimsizsinema.com/wp-content/uploads/2020/09/Borat.jpg',
            width: 40,
            height: 40,
            borderRadius: 60,),
        ),

      ],
    );
  }



  
}