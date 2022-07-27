import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/pages/welcome/username_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class FullNamePage extends StatefulWidget {
  const FullNamePage({super.key});

  @override
  State<FullNamePage> createState() => _FullNamePageState();
}

class _FullNamePageState extends State<FullNamePage> {
final nameController = TextEditingController();
final surnameController = TextEditingController();
final nameformKey = GlobalKey<FormState>();
final surnameformKey = GlobalKey<FormState>();
VoidCallback?  NextButtonClick;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 20
      ),
      child: Column(children: [
        buildTitle(),
        SizedBox(height: 10,),
        Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: buildForm(),
            ),
        Spacer(),
        buildBottom()
      ],

      ),),
    );
    
  }
Widget buildTitle(){
    return Text('What\'s your name?',
    style: TextStyle(fontSize: 25
    ),
    );
  }


  Widget buildForm(){
  return Row(
   children: [
    Expanded(
      child: Container(
         decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,),
        child: Form(key: nameformKey,
          child: TextFormField(
            onChanged: (value){nameformKey.currentState!.validate();
            },
            validator: (value){
              if (value!.isEmpty){setState
            (() {
              NextButtonClick = null;
            }
            );}
            else { setState(() {
              NextButtonClick =  next;
            });
            }
               return null;
            },
            controller: nameController,
                    autocorrect: false,
                    autofocus: false,
                    decoration: InputDecoration( contentPadding: EdgeInsets.only(left: 5),
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
               
          ))
    
      ),
      ),
    ),SizedBox(width: 10,),
     Expanded(
      child: Container(
         decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,),
        child: Form(key: surnameformKey,
          child: TextFormField(
            onChanged: (value){surnameformKey.currentState!.validate();
            },
            validator: (value){
              if (value!.isEmpty){setState
            (() {
              NextButtonClick = null;
            }
            );}
            else { setState(() {
              NextButtonClick =  next;
            });
            }
               return null;
            },
            controller: surnameController,
                    autocorrect: false,
                    autofocus: false,
                    decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 5),
                      hintText: 'Surname',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
               
          ))
    
      ),
      ),
    )
  ],
  );
}

Widget buildBottom(){
return RoundButton(
  minimumWidth:230 ,
  color: Style.AccentBlue,
   disabledColor: Colors.grey,
    onPressed: NextButtonClick,
     child: Container( 
      child: Row( mainAxisSize: MainAxisSize.min,
        children: [
              Text('Next',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
]),

));





}


 next() {
    NavigatorClass.pushPage(context, PickUserNamePage());
  }

}