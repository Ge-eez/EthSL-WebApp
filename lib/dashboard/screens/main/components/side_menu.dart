import 'package:blink/dashboard/mainDashboard.dart';
import 'package:blink/dashboard/screens/AdminAccount/editprofile.dart';
import 'package:blink/dashboard/screens/AdminAccount/userPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blink/dashboard/screens/AdminAccount/createLesson.dart';
import 'package:blink/dashboard/screens/AdminAccount/createQuiz.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/profile_pic.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );},
          ),
          DrawerListTile(
            title: "Lessons",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {},  
          ),
          DrawerListTile(
            title: "Quizzes",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Create Lesson",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> CreateLesson()),
            );},
          ),
          DrawerListTile(
            title: "Create Quizzes ",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> CreateQuiz()),
            );
            },
          ),
          // DrawerListTile(
          //   title: "Users",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Userpage()),
          //       );},
          // ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> EditProfile()),
              );
            }
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {

            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
