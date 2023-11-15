import 'package:smart_home/model/user.dart';

class UserPresenter {
  static User user = User();

  static String getStringPermission(User user){
    return user.getStringPermission(user.permissions);
  }
  
  static bool isBlock(int idUser){
    return user.isBlock(user.id);
  }
}