// import 'package:flutter/material.dart';

// class Utils{
//   static final messengerKey = GlobalKey<ScaffoldMessengerState>();
//   static showSnackBarFalse(String? text)
//   {
//     if(text==null) return;
//       final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.red,);
//       messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar); 
    
//   }
//     static showSnackBarTrue(String? text)
//   {
//     if(text==null) return;
//       final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.blue,);
//       messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar); 
    
//   }
// }
import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBarFalse(String? text) {
    if (text == null) return;

    final scaffoldMessenger = messengerKey.currentState;
    if (scaffoldMessenger != null) {
      final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
      scaffoldMessenger
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  static showSnackBarTrue(String? text) {
    if (text == null) return;

    final scaffoldMessenger = messengerKey.currentState;
    if (scaffoldMessenger != null) {
      final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.blue);
      scaffoldMessenger
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
