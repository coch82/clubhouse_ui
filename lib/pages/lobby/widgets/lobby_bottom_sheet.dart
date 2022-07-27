import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/global_widgets/round_image.dart';
import 'package:clubhouse_ui/utils/navigator.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LobbyBottomSheet extends StatefulWidget {
  const LobbyBottomSheet({super.key, required this.onButtonTap});
final VoidCallback onButtonTap;
  @override
  State<LobbyBottomSheet> createState() => _LobbyBottomSheetState();
}

class _LobbyBottomSheetState extends State<LobbyBottomSheet> {
  var selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        right: 10,
        left: 10,
        bottom: 10 
      ),
      child: Column(
        children: [
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30)
            ),
          ),
          Container(padding: EdgeInsets.symmetric(vertical: 7),
          alignment: Alignment.centerRight,
            child: Text('+ Add a Topic',
            style: TextStyle(
              color: Style.AccentGreen,
              fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i =0, len = 3; i < len ; i++ )
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => setState(() {
                      selectedButtonIndex = i;
                    }),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5
                  ),
                  decoration: BoxDecoration(
                    color: i == selectedButtonIndex 
                    ? Style.SelectedItemGrey
                    : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: i == selectedButtonIndex
                      ? Style.SelectedItemBorderGrey
                      : Colors.transparent                  )
                    ),
                  child: Column(
                    children: [
                      Container(
                        padding: 
                        const EdgeInsets.only(bottom: 3),
                        child: RoundImage(
                          borderRadius: 15,
                          width: 60,
                          height: 60,
                          path: lobbyBottomSheets[i]['image'],),
                      ),
                      Text(
                        lobbyBottomSheets[i]['text'],
                        style: TextStyle(
                        fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 50,
            endIndent: 10,
            indent: 10),
            
            Text(lobbyBottomSheets[selectedButtonIndex]['selectedMessage'],
            style:TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold) ,),
              SizedBox(height: 15,),
              RoundButton(color: Style.AccentGreen,
               onPressed: widget.onButtonTap,
               fontSize: 18,
               text: ' 🎉 Let\'s go',
               padding: const EdgeInsets.symmetric(horizontal: 10,vertical:6),)

        ],


      ),
    );
    
  }
}