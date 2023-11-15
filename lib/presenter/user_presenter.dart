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
    if(user.blocked) { return user.unblockUser();}
    else {return user.blockUser();}
  }

  static bool addUser(User user) {return User.addUser(user);}
  static bool editUser(User user) {return User.addUser(user);}
  static bool deleteUser(User user) {return User.deleteUser(user);}
}