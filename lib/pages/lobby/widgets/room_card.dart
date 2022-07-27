import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/models/room.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.room});
final Room room;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical:8,
      ),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align( alignment: Alignment.centerLeft,
            child: Text(room.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold),),
          ),
            SizedBox(height: 5),
            Row(mainAxisSize: MainAxisSize.max,
              children: [
                buildProfileImages(),
                SizedBox(width: 10,),
                Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  buildUserList(),
                  SizedBox(height: 3),
                  buildRoomInfo(),


                ],)
              ],
            )
        ],
      ),
    );
  }


Widget buildProfileImages(){
  return Stack(
    children: [
      RoundImage(
        width: 30,
        height: 30,
        borderRadius: 40,
        margin: EdgeInsets.only(top: 12,left: 20
        ),
        url: room.users[1].profileImage,),

      RoundImage(
        width: 30,
        height: 30,
        borderRadius: 40,
        url: room.users[0].profileImage,
      )

    ],
  ); 
}



Widget buildUserList() {
 var len = room.users.length > 4 ? 4 : room.users.length;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    for ( var i = 0; i < len; i++)
    Container(
      child: Row(
        children: [
          Text(room.users[i].name,
          style: TextStyle(fontWeight: FontWeight.w500,
          ),
          ),
          SizedBox(width: 5),
          Icon(Icons.chat,color: Colors.grey,
          size: 12,)
        ],

    ),

    )
  ],);
}

Widget buildRoomInfo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text('${room.users.length}',
      style: TextStyle(
        color:Colors.grey,)),
        Icon(Icons.supervisor_account,
        color: Colors.grey,size: 14,),
        Text(
          '  /  ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Text(
          '${room.speakerCount}',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Icon(
          Icons.chat_bubble_rounded,
          color: Colors.grey,
          size: 14,
        ),

    ],
  );
}




}