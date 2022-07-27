import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/models/user.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:clubhouse_ui/pages/home/widgets/profile_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';

class RoomProfile extends StatelessWidget {
  
final User user;
final double size;
final bool isMute ;
final bool isModerator;



const RoomProfile({
  super.key, 
  required this.user, 
  required this.size, 
  this.isMute = false, 
   this.isModerator = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children:[ 
            GestureDetector(
              onTap: () {
                NavigatorClass.pushPage(context, ProfilePage(profile: user));
              },
              child: RoundImage(
               borderRadius: 40,
               url: user.profileImage,
               width: size,
               height: size,
                      ),
            ),
          buildNew(user.isNewUser),
          buildMute(isMute),
      ]
      ),
      SizedBox(height: 7,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildModerator(isModerator),
          Text(
            
            user.name.split(' ')[0],style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      )
      ],
    );
  }



   Widget buildMute(bool isMute){
return Positioned(
    right: 0,
    bottom: 0,
     child: isMute ? Container( 
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5),
          offset: Offset(0, 1))
        ]
      ),
      child: Icon(Icons.mic_off,
      size: 18,),
     ) : Container()
   );

  }


  Widget buildModerator(bool isModerator){
  return isModerator ? Container(
    margin: const EdgeInsets.only(right: 3),
    decoration: BoxDecoration(
      color: Style.AccentGreen,
      borderRadius: BorderRadius.circular(30)
    ),
    child: Icon(Icons.star,
    color: Colors.white,
    size: 12,),
  ) : Container();
  }


  Widget buildNew(bool isNewUser){
   return  Positioned(
    left: 0,
    bottom: 0,
     child: isNewUser ? Container( 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5),
          offset: Offset(0, 1))
        ]
      ),
      child: Text('🎉'),
     ) : Container()
   );
  }
}