  import 'package:smart_home/model/user.dart';

class UserPresenter {
  static User user = getUserLogin("","");

  static User getUserLogin(String userName, String token){
    return User.getUserLogin(userName, token);
  }

  static String getStringPermission(User user){
    return user.getStringPermission(user);
  }

  static bool getPermissionLivingRoom(){
    return user.getPermissionLivingRoom();
  }

  static bool getPermissionKitchen(){
    return user.getPermissionKitchen();
  }

  static bool getPermissionBedRoom(){
    return user.getPermissionBedRoom();
  }

  static bool getPermissionToilet(){
    return user.getPermissionToilet();
  }

  static bool blockOrUnblockUser(User user) {
    if(user.blocked) { return user.unblock();}
    else {return user.block();}
  }

  static bool changePassword(User user, String password) {return user.changePassword(password);}
  static bool addUser(User user) {return user.add();}
  static bool updateUser(User user) {return user.update();}
  static bool deleteUser(User user) {return user.delete();}
}