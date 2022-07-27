import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:clubhouse_ui/data/models/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.profile});
  final User profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: null, 
        icon: Icon(Icons.settings))
      ],),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            buildProfile(),
            SizedBox(height: 20,),
            buildInverter(),
          
        ],),
      ),
      
      );
    
    
  }


  Widget buildProfile() {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      RoundImage(
      width: 70,
      height: 70,
      borderRadius: 20,
      url:profile.profileImage),

     SizedBox(height: 10,),

     Text(profile.name,
     style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
     ),),
     SizedBox(height: 3),
     Text(profile.username,style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
     )),
     SizedBox(height: 5),
     Row(
      children: [
        RichText(text: TextSpan(
          children: <TextSpan>[
             TextSpan(text: profile.followers.toString(),
             style: TextStyle(
             fontSize: 15,
             fontWeight: FontWeight.bold,)
             ),
             TextSpan(text: ' '),
             
             TextSpan(text: 'followers')
          ],
          style: TextStyle(
            color: Colors.black)
        ),
        ),
        SizedBox(width: 30),
        RichText(text: TextSpan(
          children: [
            TextSpan(text: profile.following.toString(),
            style: TextStyle(fontSize: 15,
            fontWeight: FontWeight.bold),
             ),
             TextSpan(text: ' '),
             TextSpan(text:'following'),
          ],style: TextStyle(color: Colors.black)
        ))
     ],
     ),
     Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Whereof one cannot speak, thereof one must be silent.📖',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        )

    ],);
  }



  Widget buildInverter(){
    return Row(children: [
      RoundImage(url:'https://cdnuploads.aa.com.tr/uploads/Contents/2019/07/02/thumbs_b_c_678bb6569b0c6e6a34da869e1fe3e1b9.jpg',
      borderRadius:15 ,
      width: 30,
      height: 30),
      SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Joined Jun 22, 2022',style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 2),
        Text('nominated by  Solgana',style: TextStyle(fontWeight: FontWeight.bold),)
      ],)

    ],

    
    );
  }
}

