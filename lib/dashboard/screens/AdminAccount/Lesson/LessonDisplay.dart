import 'package:blink/Dashboard/Screens/main/components/side_menu.dart';
import 'package:blink/Dashboard/constants.dart';

import 'package:flutter/material.dart';
import 'package:blink/dashboard/responsive.dart';
import 'package:blink/Dashboard/Screens/AdminAccount/Lesson/createLesson.dart';
import 'package:blink/Dashboard/Screens/AdminAccount/Lesson/lessonForm.dart';
import 'package:blink/Dashboard/Screens/main/components/side_menu.dart';
import 'package:blink/Dashboard/constants.dart';
import 'package:blink/dashboard/screens/AdminAccount/Lesson/LessonPage.dart';
import 'package:flutter/material.dart';
import 'package:blink/dashboard/responsive.dart';
import 'package:blink/dashboard/screens/AdminAccount/Lesson/LessonPage.dart';

class LessonDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
                // It takes 5/6 part of the screen
                 flex: 5,
            child: Container(
              color: bgColor,
              child: Center(
                child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ConstrainedBox(constraints: BoxConstraints(),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                        onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> CreateLesson()),
              
              ); },  child:const Text('Add new Lesson',)),
                    
                        LessonPage()
                        ]

                ))))))),
          ],
        ),
      ),
    );
  }
}

