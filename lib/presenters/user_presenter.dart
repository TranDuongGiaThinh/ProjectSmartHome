import 'package:smart_home/models/user.dart';

class UserPresenter {
  static User? userLogin;
  static List<User>? users;

  static Future<void> getUserLogin(String userName) async {
    userLogin = await User.getUserByUserName(userName);
  }

  static Future<User?> getUserByUserName(String userName) async {
    return await User.getUserByUserName(userName);
  }

  static Future<User?> checkAccount(String userName, String password) async {
    return await User.checkAccount(userName, password);
  }

  static Future<bool> checkLogin(String userName, String password) async {
    //check userName, password is true?
    User? user = await checkAccount(userName, password);

    //check user is blocked?
    if(user != null){
      if(!user.blocked){
        //non blocked -> initialize userLogin
        userLogin = user;
        return true;
      }
    }
    return false;
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

  static Future<bool> addUser(User user) async {
    if(user.password == null){return false;}
    
    return await user.add();
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
