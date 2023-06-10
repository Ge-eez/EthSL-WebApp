import 'package:blink/dashboard/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String?  title;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    // this.svgSrc,
    this.title,
// this.icon,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Admin Users",
    numOfFiles: 1328,
    // Icon(Icons.people_outlined,),
 
    color: primaryColor,
    percentage: 35,
  ),

  CloudStorageInfo(
    title: "Lessons",
    numOfFiles: 1328,
    // svgSrc: "assets/icons/one_drive.svg",
   
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 5328,
    // svgSrc: "assets/icons/drop_box.svg",
   
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
