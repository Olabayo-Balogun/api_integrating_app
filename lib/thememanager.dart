// import 'package:flutter/material.dart';
//import 'package:get/get.dart';
// import 'theme.dart';

// class ThemeManager{
//   static void setThemeMode(ThemeMode mode){
//     Get.changeThemeMode(mode);
//   }
// }


// class ThemeManagerWidget extends StatelessWidget {
//   const ThemeManagerWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.brightness_4),
//       onPressed: (){
//         if(isDarkMode){
//           ThemeManager.setThemeMode(ThemeMode.light);
//         }
//         else{
//           ThemeManager.setThemeMode(ThemeMode.dark);
//         }
//       },
//     );
//   }
// }