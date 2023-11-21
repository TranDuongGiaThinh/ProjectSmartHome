import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_home/models/firebase.dart';

class FirebasePresenter {
  static FirebaseFirestore? firestore;

  static initialize() async {
    firestore = await FirebaseModel.initialize();
  }
}