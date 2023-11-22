import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_home/presenters/firebase_presenter.dart';

class FirebaseModel {
  static Future<FirebaseFirestore?> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await Firebase.initializeApp();
      return FirebaseFirestore.instance;
    } catch (e) {
      // ignore: avoid_print
      print('Error in Firebase.initializeApp(): $e');
      return null;
    }
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getAllUsers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebasePresenter.firestore!
              .collection("users")
              .where("deleted", isEqualTo: false)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs;
      }
    } catch (e) {
      // ignore: avoid_print
      print("error getAllUsers() in firebase.dart: $e");
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getUserByUserName(
      String userName) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebasePresenter.firestore!
              .collection("users")
              .where("userName", isEqualTo: userName)
              .limit(1)
              .get();

      return querySnapshot.docs.first.data();
    } catch (e) {
      // ignore: avoid_print
      print("error getUserByUserName() in fireBase.dart: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> checkAccount(
      String userName, String password) async {
    try {
      QuerySnapshot querySnapshot = await FirebasePresenter.firestore!
          .collection("users")
          .where("userName", isEqualTo: userName)
          .where("password", isEqualTo: password)
          .where("deleted", isEqualTo: false)
          .limit(1)
          .get();

      return querySnapshot.docs.first.data() as Map<String, dynamic>;
    } catch (e) {
      // ignore: avoid_print
      print("error checkLogin() in fireBase.dart: $e");
      return null;
    }
  }

  static Future<bool> addUser(Map<String, dynamic> json) async {
    try {
      DocumentReference? doc =
          await FirebasePresenter.firestore!.collection('users').add(json);

      // ignore: avoid_print
      print("add User success, id new user = ${doc.id}");
      return true;
    } catch (e) {
      // ignore: avoid_print
      print('error addUser() in firebase.dart: $e');
      return false;
    }
  }
}
