import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/pages/welcome/pick_photo_page.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PickUserNamePage extends StatefulWidget {
  const PickUserNamePage({super.key});

  @override
  State<PickUserNamePage> createState() => _PickUserNamePageState();
}

class _PickUserNamePageState extends State<PickUserNamePage> {
 final uusernameController = TextEditingController();
final uuserNameformKey = GlobalKey<FormState>();
VoidCallback? NextButtonClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 20,
        ),
        child: Column(
          children: [
            buildTitle(),
            SizedBox(
              height: 50,
            ),
            buildForm(),
            Spacer(),
            buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'Pick a username',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm() {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: uuserNameformKey,
        child: TextFormField(
          textAlign: TextAlign.center,
          onChanged: (value) {
            uuserNameformKey.currentState!.validate();
          },
          validator: (value) {
            if (value!.isEmpty) {
              setState(() {
                NextButtonClick = null;
              });
            } else {
              setState(() {
                NextButtonClick = next;
              });
            }
            return null;
          },
          controller: uusernameController,
          autocorrect: false,
          autofocus: false,
          decoration: InputDecoration(
            hintText: '@username',
            hintStyle: TextStyle(
              fontSize: 20,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget buildBottom() {
    return RoundButton(
      color: Style.AccentBlue,
      minimumWidth: 230,
      disabledColor: Style.AccentBlue.withOpacity(0.3),
      onPressed: NextButtonClick,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  next() {
    NavigatorClass.pushPageUntil(context, PickPhotoPage());
  }
}