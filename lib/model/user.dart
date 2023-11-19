import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:smart_home/model/constants.dart';
import 'package:smart_home/presenter/language_presenter.dart';

import 'package:http/http.dart' as http;

class User {
  late int? id;
  late Uint8List? image;
  late String userName;
  String? password;
  late String fullName;
  late String email;
  late String phoneNumber;
  late List<bool> permissions;
  late bool ishost;
  late bool blocked;

  User() {
    id = 1;
    image = null;
    userName = "tghthinh";
    fullName = "Trần Dương Gia Thịnh";
    email = "tdgt@gmail.com";
    phoneNumber = "0123456789";
    permissions = [true, true, true, true];
    ishost = true;
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
      required this.ishost,
      required this.blocked});

  factory User.fromJson(Map<String, dynamic> json) {
    return User.info(
      id: json['id'],
      image: json['image'] != null
          ? Uint8List.fromList(List<int>.from(json['image']))
          : null,
      userName: json['userName'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      permissions: [
        json['accessLivingroom'],
        json['accessKitchen'],
        json['accessBedroom'],
        json['accessToilet'],
      ],
      ishost: json['ishost'],
      blocked: json['blocked'],
    );
  }

  User.copy(User user)
      : id = user.id,
        image = user.image,
        userName = user.userName,
        fullName = user.fullName,
        email = user.email,
        phoneNumber = user.phoneNumber,
        permissions = List.from(user.permissions),
        ishost = user.ishost,
        blocked = user.blocked;

  static Map<String, dynamic> toJson(User user) {
    return {
      'image': user.image?.isNotEmpty ?? false ? user.image!.toList() : 'null',
      'userName': user.userName,
      'password': user.password!,
      'fullName': user.fullName,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'accessLivingroom': user.permissions[Constants.livingRoom],
      'accessKitchen': user.permissions[Constants.kitchen],
      'accessBedroom': user.permissions[Constants.bedRoom],
      'accessToilet': user.permissions[Constants.toilet],
      'ishost': user.ishost,
      'blocked': user.blocked,
      'deleted': false
    };
  }

  static Future<User?> getUserLogin(String userName) async {
    return User();
  }

  static User getUserById(int id) {
    return User(); //
  }

  static bool checkLogin(String userName, String password) {
    return true; //
  }

  static List<User> getAllUser() {
    return [
      User(),
      User.info(
          id: 2,
          image: null,
          userName: "userName",
          fullName: "fullName",
          email: "email",
          phoneNumber: "phoneNumber",
          permissions: [true, false, true, false],
          ishost: false,
          blocked: true),
      User.info(
          id: 3,
          image: null,
          userName: "userName2",
          fullName: "fullName2",
          email: "email2",
          phoneNumber: "phoneNumber2",
          permissions: [true, true, true, false],
          ishost: false,
          blocked: false),
      User.info(
          id: 4,
          image: null,
          userName: "userName3",
          fullName: "fullName3",
          email: "email3",
          phoneNumber: "phoneNumber3",
          permissions: [true, false, false, false],
          ishost: false,
          blocked: false),
    ];
  }

  static Uint8List convertImagePathToBytes(String imagePath) {
    File imageFile = File(imagePath);

    List<int> imageBytesList = imageFile.readAsBytesSync();

    Uint8List uint8List = Uint8List.fromList(imageBytesList);

    return uint8List;
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
