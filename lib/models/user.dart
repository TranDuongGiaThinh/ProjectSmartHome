import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/Utils/Utils.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/firebase.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_home/views/home/home.dart';
import 'package:smart_home/views/login.dart/login_screen.dart';

class User {
 late String id;
  late Uint8List? image;
  late String userName;
  late String fullName;
  late String email;
  late String phoneNumber;
  late List<bool> permissions;
  late bool isHost;
  late bool blocked;

  User() {
    id="";
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
      {
        this.id = '',
      required this.image,
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
    bool result = userName == otherUser.userName;
    result = result && fullName == otherUser.fullName;
    result = result && email == otherUser.email;
    result = result && phoneNumber == otherUser.phoneNumber;
    result = result && isHost == otherUser.isHost;
    result = result && blocked == otherUser.blocked;
    result = result && image == otherUser.image;
    result = result && listEquals(permissions, otherUser.permissions);

    return result;
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

  // Future<bool> changePassword(String newPassword) async {
  //   password = newPassword;
  //   return await FirebaseModel.updateUser(userName, toJson());
  // }

  Future<bool> add() async {
    return await FirebaseModel.addUser(toJson());
  }

  Future<bool> update() async {
    return await FirebaseModel.updateUser(userName, toJson());
  }

  Future<bool> delete() async {
    return await FirebaseModel.updateUser(userName, toJson(deleted: true));
  }
}
Future<void> signUp(BuildContext context, User user, String password) async {
    

   try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email.trim(),
      password: password.trim(),
    );
    user.id = auth.user!.uid;
    print('Tài khoản đã được tạo thành công!');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.user!.uid)
        .set(user.toJson());

    Utils.showSnackBarTrue('Tài khoản đã được tạo thành công!');
  } on FirebaseAuthException catch (e) {
    // Ẩn loading indicator
    Navigator.of(context).pop();

    // Hiển thị thông báo thất bại
    Utils.showSnackBarFalse(e.message);
  }finally {
    // Đóng hộp thoại
    Navigator.pop(context);
  }
}

Future<void> signIn(BuildContext context, String email, String password) async {
  try { 

    // Hiển thị hộp thoại đợi
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Xóa thông tin đăng nhập trước đó (nếu có)
    FirebaseAuth.instance.currentUser?.delete();

    // Thực hiện đăng nhập
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    print(FirebaseAuth.instance.currentUser); 
    // Kiểm tra xem người dùng có đăng nhập thành công không
    if (FirebaseAuth.instance.currentUser != null) {
      print("Chuyển trang");
      // Đăng nhập thành công, chuyển hướng đến màn hình Home
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Đăng nhập không thành công, xuất thông báo
      print("Mật khẩu không hợp lệ");
      Utils.showSnackBarFalse("Mật khẩu không hợp lệ");
    }
  } on FirebaseAuthException {
    // Utils.showSnackBarFalse(e.message)
    Utils.showSnackBarFalse("Mật khẩu không hợp lệ");
  } finally {
    // Đóng hộp thoại
    Navigator.pop(context);
  }
}

void logOut(BuildContext context) async {
   await FirebaseAuth.instance.signOut();

print("Đã đăng xuất"); 

print(FirebaseAuth.instance.currentUser); 
   Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}