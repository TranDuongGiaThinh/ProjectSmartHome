import 'package:smart_home/models/user.dart';

class UserPresenter {
  static User? userLogin;
  static List<User>? users;

  static Future<void> getUserLogin(String id) async {
    userLogin = await User.getUserById(id);
  }

  static Future<User?> getUserById(String id) async {
    return await User.getUserById(id);
  }

  static bool checkLogin(String userName, String password){
    return User.checkLogin(userName, password);
  }

  static getAllUser() async {
    users = await User.getAllUser();
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
