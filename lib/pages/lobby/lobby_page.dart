import 'package:clubhouse_ui/data/data.dart';
import 'package:clubhouse_ui/data/models/room.dart';
import 'package:clubhouse_ui/global_widgets/round_button.dart';
import 'package:clubhouse_ui/pages/lobby/widgets/lobby_bottom_sheet.dart';
import 'package:clubhouse_ui/pages/lobby/widgets/room_card.dart';
import 'package:clubhouse_ui/pages/lobby/widgets/schedule_card.dart';
import 'package:clubhouse_ui/pages/room/room_page.dart';
import 'package:clubhouse_ui/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);


void _onRefresh() async{
  await Future.delayed(Duration(milliseconds: 1000));
  _refreshController.refreshCompleted();
}


void _onLoading() async{
  await Future.delayed(Duration(milliseconds: 1000));
  _refreshController.loadComplete();
}




  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
       SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        
        child: ListView.builder(
          padding: const EdgeInsets.only(
              bottom: 80,
              left: 10,
              right: 10,),
          
          itemBuilder: (lc,index){
          if (index == 0){
            return buildScheduledCard();
          }
          return buildRoomCard(rooms[index -1]);
        },
        itemCount: rooms.length + 1,
        ),
        ),
        buildGradientContainer(),
        buildStartButton()
      ],
    );
    
  }

  Widget buildScheduledCard(){
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8
      ),
      child: 
      ScheduleCard(),
      

      
    );
  }

  Widget buildRoomCard(Room room){
    return GestureDetector(
      onTap: (){
        enterRoom(room);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: RoomCard(
          room: room,),
      ),
    );
  }


  Widget buildGradientContainer(){
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin:Alignment.topCenter,
          end:Alignment.bottomCenter,
          colors: [ Style.LightBrown.withOpacity(0.2),
          Style.LightBrown])
      )
    );
  }



  Widget buildStartButton(){
    return RoundButton(
      text: '+ Start a room',
      color: Style.AccentGreen,
      fontSize: 17,
      onPressed: (){
        showButtomSheet();
      },
      minimumWidth: 75,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      );
  }


  showButtomSheet(){
    showModalBottomSheet(context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
       topLeft: Radius.circular(15),
       topRight: Radius.circular(15)
    )),
     builder: (context){
      return Wrap(
        children: [
          LobbyBottomSheet(
        onButtonTap: (){
          Navigator.pop(context);
          
          
          enterRoom(Room(
            title:'${myProfile.name}\'s room',
            users: [myProfile],
            speakerCount: 1
          ));
          
          },
      )]);
    });
    
  }


  enterRoom(Room room) {
   showModalBottomSheet(
    isScrollControlled: true,
    context: context, builder: (lc){
    return RoomPage(
      room: room
    );
   });
  }
}