import 'dart:typed_data';

import 'package:smart_home/models/user.dart';

class UserPresenter {
  static User? userLogin = User();///
  static List<User> users = getAllUser();

  static Future<User?> getUserLogin(String userName) async {
    return await User.getUserLogin(userName);
  }

  static User getUserById(int id) {
    return User.getUserById(id);
  }

  static bool checkLogin(String userName, String password){
    return User.checkLogin(userName, password);
  }

  static List<User> getAllUser() {
    return User.getAllUser();
  }

  static String getStringPermission(User user) {
    return user.getStringPermission(user);
  }

  static bool getPermissionLivingRoom() {
    return userLogin!.getPermissionLivingRoom();
  }

  static bool getPermissionKitchen() {
    return userLogin!.getPermissionKitchen();
  }

  static bool getPermissionBedRoom() {
    return userLogin!.getPermissionBedRoom();
  }

  static bool getPermissionToilet() {
    return userLogin!.getPermissionToilet();
  }

  static bool isUserFullPermission(User user) {
    return user.isFullPermission();
  }

  static Uint8List convertImagePathToBytes(String imagePath){
    return User.convertImagePathToBytes(imagePath);
  }

  static bool blockOrUnblockUser(User user) {
    if (user.blocked) {
      return user.unblock();
    } else {
      return user.block();
    }
  }

  static bool addUser(User user) {
    return user.add();
  }

  static bool updateUser(User user) {
    return user.update();
  }

  static bool deleteUser(User user) {
    return user.delete();
  }

  static bool changePassword(User user, String password) {
    return user.changePassword(password);
  }
}
