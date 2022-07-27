import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {

String? url ;
final String path;
double? width;
double? height;
EdgeInsets? margin;
double? borderRadius;

  RoundImage({super.key,
  this.borderRadius,
  this.height,
  this.margin,
  this.path = '',
  this.url,
  this.width});


@override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        image: DecorationImage(
          image: path.isEmpty ?  NetworkImage(url!)  :  AssetImage(path) as ImageProvider ,
          fit: BoxFit.cover,
        ),
      ),
    );
  }









  }