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
      print("error getAllUsers() intfirebase.dart: $e");
    }
    return null;
  }

  static Future<Map<String, dynamic>>
      getUserLogin(String id) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebasePresenter.firestore!
              .collection("users")
              .doc(id)
              .get();
    
    return querySnapshot.data()!;
  }
}
