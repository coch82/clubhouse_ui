import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/pages/home/widgets/home_bar.dart';
import 'package:clubhouse_ui/pages/home/widgets/profile_page.dart';
import 'package:clubhouse_ui/pages/lobby/follower_page.dart';
import 'package:clubhouse_ui/pages/lobby/lobby_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeBar( 
          profile: myProfile,
          onProfileTab: () {
            NavigatorClass.pushPage(context, ProfilePage(
              profile: myProfile,
            ));
          
          }),
      ),
      body: PageView(
        children: [
          LobbyPage(
            
          ),
          FollowerPage(),
        ],
      ),
    );
  }
}