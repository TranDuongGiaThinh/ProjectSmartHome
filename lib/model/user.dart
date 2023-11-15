import 'package:smart_home/model/constants.dart';
import 'package:smart_home/presenter/language_presenter.dart';

class User {
  late int id;
  late String url;
  late String userName;
  late String fullName;
  late String email;
  late String phoneNumber;
  late List<bool> permissions;
  late bool ishost;
  late bool blocked;

  User() {
    id = 1;
    url = "data/images/avt_default.png";
    userName = "tghthinh";
    fullName = "Trần Dương Gia Thịnh";
    email = "tdgt@gmail.com";
    phoneNumber = "0123456789";
    permissions = [true, true, true, true];
    ishost = true;
    blocked = false;
  }

  String getStringPermission(List<bool> permissions) {
    bool isFirst = true;
    bool isFullPermission = true;
    String strPermission = "";

    for(int i = 0; i < permissions.length; i++){
      if (permissions[Constants.livingRoom]) {
        if(!isFirst) {strPermission += ",\n";}
        strPermission += LanguagePresenter.language.livingRoom;
        isFirst = false;
      }
      else{
        isFullPermission = false;
      }
    }
    
    if(isFullPermission) {strPermission = LanguagePresenter.language.fullPermission;}

    return strPermission;
  }

  bool isBlock(int idUser){
    User user = User();

    return user.blocked;
  }
}
