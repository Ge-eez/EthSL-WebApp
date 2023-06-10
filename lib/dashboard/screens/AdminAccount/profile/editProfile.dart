import 'package:blink/Dashboard/Screens/main/components/side_menu.dart';
import 'package:blink/Dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:blink/dashboard/responsive.dart';
import 'package:blink/dashboard/screens/AdminAccount/profile/editProfileForm.dart';





class EditProfile extends StatelessWidget{

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
                    padding: const EdgeInsets.all(20.0),
                    child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 800),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        EditProfileForm(adminId: '',)
                        ]

                ))))))),
          ],
        ),
      ),
    );
  }
}
// class EditProfile extends StatelessWidget{

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: SideMenu(),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // We want this side menu only for large screen
//             if (Responsive.isDesktop(context))
//               Expanded(
//                 // default flex = 1
//                 // and it takes 1/6 part of the screen
//                 child: SideMenu(),
//               ),
//             Expanded(
//                 // It takes 5/6 part of the screen
//                  flex: 5,
//             child: Container(
//               color: bgColor,
//               child: Center(
//                 child: SingleChildScrollView(
// child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 800),
//                     child:Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
                       
//                         EditProfileForm()
//                         ]

//                 ))))))),
//           ],
//         ),
//       ),
//     );
//   }
// }
