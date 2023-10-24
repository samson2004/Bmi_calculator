import 'package:flutter/material.dart';
import 'dart:math';
import 'constants.dart';



class calculator{
  calculator({required this.kweight,required this.kheight});

  final int? kheight;
  final int? kweight;

  late double kbmi=0.0;
  String calculatebmi(){
    kbmi=((weight/(height*height))*10000);
    return kbmi.toStringAsFixed(2);
  }
  String result(){
    if(kbmi<=18.5){
      return "Underweight";
    }
    else if(kbmi >18.5 && kbmi<25.5){
      return "Normal";
    }
    else{
      return "Overweight";
    }
  }

  String getinterpertation(){
    if(kbmi<=18.5){
      return "You have a lower BMI score.you can eat bit more";
    }
    else if(kbmi >18.5 && kbmi<25.5){
      return "You have Normal body weight . Good job!";
    }
    else{
      return "You have higher BMI score. you can go on a diet";
    }
  }

}