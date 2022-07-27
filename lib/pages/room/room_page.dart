

import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/models/room.dart';
import 'package:clubhouse_ui/data/models/user.dart';
import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:clubhouse_ui/pages/home/widgets/profile_page.dart';
import 'package:clubhouse_ui/pages/room/widgets/room_profile.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';


class RoomPage extends StatelessWidget {
  
final Room room;





const RoomPage({
    super.key, 
    required this.room, 
    });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              iconSize: 25,
              onPressed: (){
                Navigator.pop(context);
              },
             icon: Icon(Icons.keyboard_arrow_down)),
             Text('All Rooms',
             style: TextStyle(
              color: Colors.black,
              fontSize: 15),
              ),
             Spacer(),
             GestureDetector(
              onTap: (){
                NavigatorClass.pushPage(context,
                 ProfilePage(
                  profile: myProfile)
                  );
              },
               child: RoundImage(
                borderRadius: 20,
                height: 35,
                width: 35,
                url: myProfile.profileImage,
               ),
             )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left:15,
          right: 15,
          top: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight:Radius.circular(30)
          )
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 40,
                top: 10) ,
              child: Column(
                children: [
                  buildTitle(room.title),
                  SizedBox(height: 20,),
                  buildSpeakers(room.users.sublist(0,room.speakerCount)),
                  otherListeners(room.users.sublist( 
                     
                   (1 >=room.users.length) | (2 >= room.users.length) ? room.users.length :4 ,
                   (1 <= room.users.length) | (2 <= room.users.length)  ? room.users.length : 20
                   /*  4 < room.users.length
                     ? room.users.length : 0 ,
                        room.speakerCount */
                     /* 20  > room.users.length 
                     ? room.users.length : 20*/)),
                  
                ],
              )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: buildButtom(context)),
              

          ],
        )
        ,),
    );
    
    
  }


  Widget buildTitle(String title){
   return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Flexible(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20),
          ),
    ),
    Container(
      child: 
      IconButton(
        onPressed: (){},
        icon: Icon(Icons.more_horiz),
        iconSize: 20,),
    )
   ],);
  }





  Widget buildSpeakers(List<User> users){
   return GridView.builder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: 130),
      itemCount: users.length,
    itemBuilder: (gc,index){
   return RoomProfile(
    user: users[index],
    size: 60,
    isModerator: index == 0,
    isMute: index == 3,
    
    
   );
    });
  }


 Widget otherListeners(List<User> users){
   return Column(crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Others in the room',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.grey),),
      ),
       GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 120),
          itemCount: users.length,
        itemBuilder: (gc,index){
       return RoomProfile(
        user: users[index],
        size: 50,
        isMute: true,
        
       );
        }),
     ],
   );
  }
 



 Widget buildButtom(BuildContext context){
  return Container(
    color: Colors.white,
      child: Row(
        children: [
          RoundButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Style.LightGrey,
            child: Text(
              '✌️ Leave quietly',
              style: TextStyle(
                color: Style.AccentRed,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          RoundButton(
            onPressed: () {},
            color: Style.LightGrey,
            isCircle: true,
            child: Icon(
              Icons.add,
              size: 15,
              color: Colors.black,
            ),
          ),
          RoundButton(
            onPressed: () {},
            color: Style.LightGrey,
            isCircle: true,
            child: Icon(
              Icons.thumb_up,
              size: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    
  );
 }
}