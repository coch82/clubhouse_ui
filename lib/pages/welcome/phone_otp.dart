import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/pages/welcome/invitation_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';


class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  VoidCallback?  SignUpButtonClick;

 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(alignment: Alignment.center,
        padding: const EdgeInsets.only(
          bottom: 20
        ),
        child: Column(
          children: [
            buildTitle(),
            SizedBox(height: 30,),
            buildForm(),
            Spacer(),
            buildBottom()
            
          ],
        ),
        ),
        
        );
  }
  Widget buildTitle(){
    return Text('Enter your phone #',
    style: TextStyle(fontSize: 25
    ),
    );
  }


  Widget buildForm(){
    return Container(
      width: 330,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
    child: Row(children: [
      CountryCodePicker(
        initialSelection: 'TR' ,
        showCountryOnly: false,
        alignLeft: false,
        padding: EdgeInsets.all(8),
        textStyle: TextStyle(fontSize: 15),
      ),
      Expanded(child: Form(key: formKey,child: TextFormField(
        onChanged: (value) {
          
                  formKey.currentState!.validate();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      SignUpButtonClick = null
                        
                      ;
                    });
                  } else {
                    setState(() {
                      SignUpButtonClick = signUp;
                    });
                  }
                  return null;
  },
     controller: phoneNumberController,
                autocorrect: false,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,

  ),))
    )],),
    
    
    );
}
Widget buildBottom(){
  return Column(
    children: [
      Text('By entering your number, you\'re agreeing to out\nTerms or Services and Privacy Policy. Thanks!',
      style: TextStyle(color:Colors.grey),),
      SizedBox(height: 10,),
    RoundButton(
      color: Style.AccentBlue,
      disabledColor: Colors.grey,
      onPressed: SignUpButtonClick ,
      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 7),

      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
           children: [
            Text('Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17),),
        Icon(
          Icons.arrow_right_alt,
          color: Colors.white,)
        ],
        ),
        )
        )
    ],
  );

}


signUp() {
    NavigatorClass.pushPageUntil(context, InvitationPage());
  }
}

