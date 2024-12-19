import 'package:flutter/material.dart';

class ListviewHorsintal extends StatelessWidget {
   ListviewHorsintal({super.key, required this.image, required this.titel});
final String image;
final String titel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all( 10),
      height:120 ,
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
        image: AssetImage(image,), 
        fit: BoxFit.fill,
        ),
        
      ),
      child: Center(child: Text(titel,style: TextStyle(color: Colors.white),)),
      
    );
  }
}