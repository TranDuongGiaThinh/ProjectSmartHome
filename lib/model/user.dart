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

  User.info(int ? id, String ? url, String userName, String fullName, String email,
      String phoneNumber, List<bool> permissions, bool ishost, bool blocked) {
    id = id ?? 0;
    url = url ?? "data/images/avt_default.png";
    userName = "";
    fullName = "";
    email = "";
    phoneNumber = "";
    permissions = [true, true, true, true];
    ishost = false;
    blocked = true;
  }

  static User getUserLogin(String userName, String password){
    return User();
  }

  bool getPermissionLivingRoom(){
    return permissions[Constants.livingRoom];
  }

  bool getPermissionKitchen(){
    return permissions[Constants.kitchen];
  }

  bool getPermissionBedRoom(){
    return permissions[Constants.bedRoom];
  }

  bool getPermissionToilet(){
    return permissions[Constants.toilet];
  }

  String getStringPermission(User user) {
    bool isFirst = true;
    bool isFullPermission = true;
    String strPermission = "";

    for (int i = 0; i < permissions.length; i++) {
      if (permissions[Constants.livingRoom]) {
        if (!isFirst) {
          strPermission += ",\n";
        }
        strPermission += LanguagePresenter.language.livingRoom;
        isFirst = false;
      } else {
        isFullPermission = false;
      }
    }

    if (isFullPermission) {
      strPermission = LanguagePresenter.language.fullPermission;
    }

    return strPermission;
  }

  bool blockUser() {return false;}
  bool unblockUser() {return false;}

  static bool addUser(User user) {return false;}
  static bool editUser(User user) {return false;}
  static bool deleteUser(User user) {return false;}
}
