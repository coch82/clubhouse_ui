import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/models/room.dart';
import 'package:clubhouse_ui/pages/home/widgets/profile_page.dart';
import 'package:clubhouse_ui/pages/lobby/widgets/follower_list.dart';
import 'package:clubhouse_ui/pages/room/room_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class FollowerPage extends StatelessWidget {
  const FollowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( padding: const EdgeInsets.only(left:12,right:12,top: 7),
      child: Column(
        children: [
           buildAvailableChat(), 
           buildChatUserList(),       
      ]),
    );
  }




  Widget buildAvailableChat(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('AVAİLABLE  TO CHAT',style: TextStyle(
          color: Style.DarkBrown,
          fontWeight: FontWeight.bold,
          fontSize: 12
          ),),
          Expanded(
            
            child: Container(
              height: 1,
              color: Style.DarkBrown),
          )
      ],
    );
  }

Widget buildChatUserList() {
  return ListView.builder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    itemBuilder: ((context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FollowerList(
       user: users[index],
       onProfileTap: (){
        NavigatorClass.pushPage(context,
         ProfilePage(
          profile:users[index],
          )
        );
       },
       onRoomButton: (){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, builder: (context) {
        return  RoomPage(
          room: Room(
           title: '${myProfile.name}\'s room',
           users: [myProfile,users[index]],
           speakerCount: 2,
        )) ;
        
        } );
       }),
    );
  }
  ),
  itemCount: users.length, );
}




}