import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/pages/welcome/phone_otp.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(
          right: 50,
          left: 50,
          bottom: 20
        ),
        child: Column( 
          children: [
          buildTitle(),
          SizedBox(
            height: 40,
            ),
          Expanded(child: buildContent()),
          buildBottom(context),
        ],)
      )
    );
  }


  Widget buildTitle(){
    return Text('🖕Welcome!',
    style: TextStyle(fontSize: 25
    ),
    );
  }
  Widget buildContent(){
    return SingleChildScrollView(
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('We\'re working hard to get Clubhouse ready for launch! While we wrap up the finishing touches, we\'re adding people gradually to make sure nothing breaks. :)',
          style: TextStyle(fontSize: 15,height: 1.8),
        ),
        SizedBox(
            height: 40,
          ),
          Text('If you don\'t yet have an invite, you can reserve your username now and we\'ll get you on very soon. We are so grateful you\'re here and can\'t wait to have you join! 🙏',
          style: TextStyle(fontSize: 15,height:1.8),
          ),
          SizedBox(height: 40,
          ),
          Text(
              '🏠 Paul, Rohan & the Clubhouse team',
              style: TextStyle(
                fontSize: 15,
              ),
            )
        ],
      ),
    );
  }

Widget buildBottom(BuildContext context){
  return Column(crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      RoundButton(
        color: Style.AccentBlue,
        disabledColor: Colors.grey ,
        onPressed: () { 
            NavigatorClass.pushPage(context, PhoneNumberPage());
          
          
        }, child: Container(
          child: Row(mainAxisSize: MainAxisSize.min,
            children: [Text
            ('Got your username',
            style: TextStyle(fontSize: 15,
              color: Colors.white),
              ),
             Icon(Icons.arrow_right_alt,
            color: Colors.white,) 
            ],),),),
      SizedBox(height: 20,),
      Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Have an invite text?',
          style: TextStyle(color: Style.AccentBlue,
          ),
          ),
          Text('Sign in',style: TextStyle(color: Style.AccentBlue,
          fontWeight: FontWeight.bold),
          ),
           Icon(Icons.arrow_right_alt,
          color:Style.AccentBlue,)

        ],
      )
      
    ],
  );



}




}