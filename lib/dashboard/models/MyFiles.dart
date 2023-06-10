import 'package:blink/dashboard/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String?  title;
  final int? numOfFiles, percentage;
  final Color? color;
  final Icon? icon;

  CloudStorageInfo({
    
    this.title,
    this.icon,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Admin Users",
    numOfFiles: 1328,
    icon: Icon(Icons.people_outlined,),
 
    color: primaryColor,
    percentage: 35,
  ),

  CloudStorageInfo(
    title: "Lessons",
    numOfFiles: 1328,
   
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 5328,
    icon:Icon( Icons.quiz,),
   
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
