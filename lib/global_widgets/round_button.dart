import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  Color? disabledColor;
  final EdgeInsets padding;
  final VoidCallback? onPressed;
   Widget? child;
  final bool isCircle;
  final double minimumWidth;
  final double minimumHeight;

   RoundButton({super.key,
  this.text= '',
  this.fontSize = 20,
  required this.color,
  this.disabledColor,
  this.padding = const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
  required this.onPressed ,
  this.child,
  this.isCircle = false,
  this.minimumWidth = 0,
  this.minimumHeight = 0
  });
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(Size(minimumWidth, minimumHeight)),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states){
        if (states.contains(MaterialState.disabled)){return disabledColor!; }
        return color ;}),
     shape: MaterialStateProperty.all<OutlinedBorder>(
     isCircle ? CircleBorder()
     :RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(30))
    ),
    padding : MaterialStateProperty.all<EdgeInsets>(padding),
    elevation: MaterialStateProperty.all<double>(0.5)
    
    
    ),
    

      onPressed: onPressed,
      child: text.isNotEmpty ? Text(text,style: TextStyle(fontSize: fontSize,color: Colors.white),
      ):child,
      );
      
  
  }
}