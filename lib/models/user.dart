import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/firebase.dart';
import 'package:smart_home/presenters/language_presenter.dart';

class User {
  late String? id;
  late Uint8List? image;
  late String userName;
  String? password;
  late String fullName;
  late String email;
  late String phoneNumber;
  late List<bool> permissions;
  late bool isHost;
  late bool blocked;

  User() {
    id = "1";
    image = null;
    userName = "tghthinh";
    fullName = "Trần Dương Gia Thịnh";
    email = "tdgt@gmail.com";
    phoneNumber = "0123456789";
    permissions = [true, true, true, true];
    isHost = true;
    blocked = false;
  }

  User.info(
      {required this.id,
      required this.image,
      required this.userName,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.permissions,
      required this.isHost,
      required this.blocked});

  User.fromJson(String this.id, Map<String, dynamic> json)
      : image = json['image'] != null && json['image'] != "null"
            ? convertStringToUint8List(json['image'])
            : null,
        userName = json['userName'],
        fullName = json['fullName'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        permissions = [
          json['accessLivingRoom'],
          json['accessKitchen'],
          json['accessBedRoom'],
          json['accessToilet'],
        ],
        isHost = json['isHost'],
        blocked = json['blocked'];

  User.copy(User user)
      : id = user.id,
        image = user.image,
        userName = user.userName,
        fullName = user.fullName,
        email = user.email,
        phoneNumber = user.phoneNumber,
        permissions = List.from(user.permissions),
        isHost = user.isHost,
        blocked = user.blocked;

  static Map<String, dynamic> toJson(User user) {
    return {
      'image': user.image?.isNotEmpty ?? false
          ? convertImageToString(user.image!)
          : 'null',
      'userName': user.userName,
      'password': user.password!,
      'fullName': user.fullName,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'accessLivingRoom': user.permissions[Constants.livingRoom],
      'accessKitchen': user.permissions[Constants.kitchen],
      'accessBedRoom': user.permissions[Constants.bedRoom],
      'accessToilet': user.permissions[Constants.toilet],
      'isHost': user.isHost,
      'blocked': user.blocked,
      'deleted': false
    };
  }

  static Future<User?> getUserById(String id) async {
    Map<String, dynamic> map = await FirebaseModel.getUserLogin(id);
    return User.fromJson(id, map);
  }

  static bool checkLogin(String userName, String password) {
    return true; //
  }

  static Future<List<User>> getAllUser() async {
    List<User> users = [];
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? querySnapshotDocs =
        await FirebaseModel.getAllUsers();

      for (var document in querySnapshotDocs!) {
        String userId = document.id;
        Map<String, dynamic> userData = document.data();

        User user = User.fromJson(userId, userData);
        users.add(user);
      }

      return users;

    /*return [
      User(),
      User.info(
          id: "2",
          image: null,
          userName: "userName",
          fullName: "fullName",
          email: "email",
          phoneNumber: "phoneNumber",
          permissions: [true, false, true, false],
          isHost: false,
          blocked: true),
      User.info(
          id: "3",
          image: null,
          userName: "userName2",
          fullName: "fullName2",
          email: "email2",
          phoneNumber: "phoneNumber2",
          permissions: [true, true, true, false],
          isHost: false,
          blocked: false),
      User.info(
          id: "4",
          image: null,
          userName: "userName3",
          fullName: "fullName3",
          email: "email3",
          phoneNumber: "phoneNumber3",
          permissions: [true, false, false, false],
          isHost: false,
          blocked: false),
    ];*/
  }

  static Uint8List convertStringToUint8List(String base64String) {
    List<int> bytes = base64.decode(base64String);
    return Uint8List.fromList(bytes);
  }

  static String convertImageToString(Uint8List uint8List) {
    String s = base64Encode(uint8List);
    return s;
  }

  bool getPermissionLivingRoom() {
    return permissions[Constants.livingRoom];
  }

  bool getPermissionKitchen() {
    return permissions[Constants.kitchen];
  }

  bool getPermissionBedRoom() {
    return permissions[Constants.bedRoom];
  }

  bool getPermissionToilet() {
    return permissions[Constants.toilet];
  }

  bool isFullPermission() {
    for (int room = 0; room < permissions.length; room++) {
      if (!permissions[room]) {
        return false;
      }
    }
    return true;
  }

  String getStringPermission(User user) {
    bool isFirst = true;
    bool isFullPermission = true;
    String strPermission = "";

    for (int room = 0; room < permissions.length; room++) {
      if (permissions[room]) {
        if (!isFirst) {
          strPermission += ", ";
        }
        strPermission += LanguagePresenter.language.listRoom[room];
        isFirst = false;
      } else {
        isFullPermission = false;
      }
    }

    if (isFullPermission) {
      strPermission = LanguagePresenter.language.fullPermission;
    }

    if (isFirst) {
      strPermission = LanguagePresenter.language.notHaveAccess;
    }

    return strPermission;
  }

  bool block() {
    return false;
  }

  bool unblock() {
    return false;
  }

  bool changePassword(String newPassword) {
    return false;
  }

  bool add() {
    return false;
  }

  bool update() {
    return false;
  }

  bool delete() {
    return false;
  }
}
