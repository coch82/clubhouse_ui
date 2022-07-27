import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:clubhouse_ui/pages/welcome/fullname_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 30,
        ),
            child: Column( 
              children: [
               buildTitle(),
               SizedBox(height: 10,),
               buildContent(),
               Spacer(),
               buildBottom(context)
              ],
            ),
      ),
    );
  }


Widget buildTitle(){
    return Text('🎉 Welcome to Clubhouse.\n     You\'re Coch82\'s friend!',
    style: TextStyle(fontSize: 20,
    ),
    );
  }

Widget buildContent (){
    return SingleChildScrollView(
      child:Column(
        children: [RoundImage(
          url: 'https://cdnuploads.aa.com.tr/uploads/Contents/2019/07/02/thumbs_b_c_678bb6569b0c6e6a34da869e1fe3e1b9.jpg',
          width: 100,
          height: 100,
          borderRadius: 40,
        ),
        SizedBox(height:10),
        Text('Solgana',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),)

      ]) ,
    );

  }

Widget buildBottom(BuildContext context){
  return Column(
    children: [
      Text('Let\'s set up your profile?',style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500)
      ),
      RoundButton(color: Style.AccentBlue , disabledColor: Colors.grey, onPressed: (){}, child: Container(),text: '🐋 Import from Whale',fontSize: 15,minimumWidth: 230,),
      SizedBox(height: 5,),
      GestureDetector(
        onTap: (){
          NavigatorClass.pushPage(context, FullNamePage());
        },
        child: Text('Enter my info manually',style: TextStyle(
              color: Style.AccentBlue,),
      )
      )
    ],
  );




}






}