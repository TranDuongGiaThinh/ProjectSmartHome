import 'package:smart_home/models/user.dart';

class UserPresenter {
  static User userLogin = User();
  static List<User>? users;

  static Future<void> getUserLogin(String userName) async {
    userLogin = (await User.getUserByUserName(userName))!;
  }

  static setUserLogin(User newUser) {
    userLogin = newUser;
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

  static logOut() async {
    //deleted token in file user.json
  }

  static bool isEqualUsers(List<User> lst){
    for(int i = 0; i< users!.length && i< lst.length; i ++){
      if(!users![i].isEqual(lst[i])){
        return false;
      }
    }
    return true;
  }

  static Future<List<User>?> getAllUser() async {
    users = await User.getAllUser();
    return users;
  }

  static String getStringPermission(User user) {
    return user.getStringPermission(user);
  }

  static bool getPermissionLivingRoom() {
    return userLogin.getPermissionLivingRoom();
  }

  static bool getPermissionKitchen() {
    return userLogin.getPermissionKitchen();
  }

  static bool getPermissionBedRoom() {
    return userLogin.getPermissionBedRoom();
  }

  static bool getPermissionToilet() {
    return userLogin.getPermissionToilet();
  }

  static bool isUserFullPermission(User user) {
    return user.isFullPermission();
  }

  static bool isEqual(User user1, User user2) {
    return user1.isEqual(user2);
  }

  static Future<bool> addUser(User user) async {
    return await user.add();
  }

  static Future<bool> updateUser(User user) async {
    return await user.update();
  }

  static Future<bool> deleteUser(User user) async {
    return await user.delete();
  }

  static Future<bool> changePassword(User user, String newPassword) async {
    return await user.changePassword(newPassword);
  }
}
