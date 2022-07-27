import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/pages/home/home_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';


class PickPhotoPage extends StatelessWidget {
  const PickPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [buildActionButton(context)],
     
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30,bottom: 20),
        child: Column(
          children: [
           buildTitle(),
           SizedBox(height: 20,),
           buildContent(),
           Spacer(),
           buildBottom(),


        ],),
      )
      );
    
  }

Widget buildActionButton(BuildContext context){
return Container(alignment: Alignment.center,
padding: const EdgeInsets.symmetric(horizontal: 20),
child:GestureDetector(
  onTap: () { NavigatorClass.pushPageReplacement(context, HomePage());
    
  },
  child: Text('Skip',style: TextStyle(
            color: Style.DarkBrown,
            fontWeight: FontWeight.bold,),
) ,

));
}

Widget buildContent(){
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(80)
      ),
      child: Icon(
        Icons.add_photo_alternate_outlined,
        color: Style.AccentBlue,
        size: 100,),
  );



}



  Widget buildTitle(){
    return Text('Great! Now add a photo?',
    style: TextStyle(fontSize: 25
    ),
    );
  }



  Widget buildBottom(){
    return RoundButton(color:Style.AccentBlue,
     disabledColor: Colors.grey,
     minimumWidth: 230,
      onPressed: (){},
       child: Container(
           child: Row(mainAxisSize: MainAxisSize.min,
                       children: [
                         Text('Next',style: TextStyle(color: Colors.white,fontSize: 20)),
                          Icon(Icons.arrow_right_alt,color: Colors.white,)
        ],
      ),
    ));

  }


  
}