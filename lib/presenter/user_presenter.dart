import 'package:smart_home/model/user.dart';

class UserPresenter {
  static User user = getUserLogin("","");

  static User getUserLogin(String userName, String token){
    return User.getUserLogin(userName, token);
  }

  String getStringPermission(){
    return user.getStringPermission();
  }

  void blockOrUnblockUser(User user) {
    if(user.blocked) {user.unblockUser();}
    else {user.blockUser();}
  }
}