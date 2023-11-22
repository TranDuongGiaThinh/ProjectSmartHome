import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/firebase.dart';
import 'package:smart_home/presenters/language_presenter.dart';

class User {
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
    image = null;
    userName = "";
    fullName = "";
    email = "";
    phoneNumber = "";
    permissions = [false, false, false, false];
    isHost = false;
    blocked = false;
  }

  User.info(
      {required this.image,
      required this.userName,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.permissions,
      required this.isHost,
      required this.blocked});

  User.fromJson(Map<String, dynamic> json)
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
      : image = user.image,
        userName = user.userName,
        fullName = user.fullName,
        email = user.email,
        phoneNumber = user.phoneNumber,
        permissions = List.from(user.permissions),
        isHost = user.isHost,
        blocked = user.blocked;

  Map<String, dynamic> toJson({bool? deleted}) {
    return {
      'image':
          image?.isNotEmpty ?? false ? convertImageToString(image!) : "null",
      'userName': userName,
      'password': password,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'accessLivingRoom': permissions[Constants.livingRoom],
      'accessKitchen': permissions[Constants.kitchen],
      'accessBedRoom': permissions[Constants.bedRoom],
      'accessToilet': permissions[Constants.toilet],
      'isHost': isHost,
      'blocked': blocked,
      'deleted': deleted ?? false
    };
  }

  bool isEqual(User otherUser) {
    return userName == otherUser.userName &&
        fullName == otherUser.fullName &&
        email == otherUser.email &&
        phoneNumber == otherUser.phoneNumber &&
        isHost == otherUser.isHost &&
        blocked == otherUser.blocked &&
        image == otherUser.image &&
        permissions == otherUser.permissions;
  }

  static Future<User?> getUserByUserName(String userName) async {
    Map<String, dynamic>? map = await FirebaseModel.getUserByUserName(userName);
    if (map != null) {
      return User.fromJson(map);
    }
    return null;
  }

  static Future<User?> checkAccount(String userName, String password) async {
    Map<String, dynamic>? json =
        await FirebaseModel.checkAccount(userName, password);
    if (json != null) {
      return User.fromJson(json);
    }
    return null;
  }

  static Future<List<User>> getAllUser() async {
    List<User> users = [];
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? querySnapshotDocs =
        await FirebaseModel.getAllUsers();

    for (var document in querySnapshotDocs!) {
      Map<String, dynamic> userData = document.data();

      User user = User.fromJson(userData);
      users.add(user);
    }

    return users;
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

  Future<bool> block() async {
    blocked = false;
    return await FirebaseModel.updateUser(userName, toJson());
  }

  Future<bool> unblock() async {
    blocked = false;
    return await FirebaseModel.updateUser(userName, toJson());
  }

  bool changePassword(String newPassword) {
    return false;
  }

  Future<bool> add() async {
    return await FirebaseModel.addUser(toJson());
  }

  Future<bool> update() async {
    return await FirebaseModel.updateUser(userName, toJson());
  }

  Future<bool> delete() async{
    return await FirebaseModel.updateUser(userName, toJson(deleted: true));
  }
}
