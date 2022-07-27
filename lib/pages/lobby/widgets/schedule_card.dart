import 'package:clubhouse_ui/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:clubhouse_ui/utils/style.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8),
      decoration: BoxDecoration(
        color: Style.AccentBrown,
        borderRadius: BorderRadius.circular(20)
      ),
        
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          for (var i =0,len = 3; i < len; i++ )
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: buildScheduleItem('0${7 + i}:00 PM',headlines.randomItem()),
          ),

    ]),
      )
      
      
    ;
  }




  Widget buildScheduleItem(String time,String text){
    return Row(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          child: Text(time,
          style: TextStyle(
            color: Style.DarkBrown
             ),
             ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('COMMUNİTY CLUB',
                  style: TextStyle(
                    color: Style.AccentGrey,
                    fontSize: 10
                  ),),
                  SizedBox(width: 3,),
                  Icon(Icons.home,
                  color: Style.AccentGreen,
                  size: 15)
                ],),
              Text(text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black),
              ),

            ],
        
          ),
        )
        ],
    );
  }
}