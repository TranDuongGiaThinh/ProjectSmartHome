import 'package:smart_home/model/user.dart';

class UserPresenter {
  static User userLogin = getUserLogin("", "");
  static List<User> users = getAllUser();

  static User getUserLogin(String userName, String token) {
    return User.getUserLogin(userName, token);
  }

  static List<User> getAllUser() {
    return User.getAllUser();
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
