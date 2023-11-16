import 'package:smart_home/model/constants.dart';
import 'package:smart_home/presenter/language_presenter.dart';

class User {
  late int ? id;
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

  static User getUserLogin(String userName, String password){
    return User();
  }

  User.info({id, url, required this. userName, required this. fullName, required this.  email,
      required this.  phoneNumber, required this. permissions, required this.  ishost, required this.  blocked}) {
    this.id = id ?? 0;
    this.url = url ?? "data/images/avt_default.png";
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

  bool isFullPermission(){
    for (int room = 0; room < permissions.length; room++) {
      if (!permissions[room]){return false;}
    }
    return true;
  }

  String getStringPermission(User user) {
    bool isFirst = true;
    bool isFullPermission = true;
    String strPermission = "";

    for (int room = 0; room < permissions.length; room++) {
      if (permissions[room]) {
        if (!isFirst) {
          strPermission += ", ";
        }
        strPermission += LanguagePresenter.language.listRoom[room];
        isFirst = false;
      } else {
        isFullPermission = false;
      }
    }

    if (isFullPermission) {
      strPermission = LanguagePresenter.language.fullPermission;
    }

    if(isFirst){
      strPermission = LanguagePresenter.language.notHaveAccess;
    }

    return strPermission;
  }

  bool block() {return false;}
  bool unblock() {return false;}

  bool changePassword(String newPassword) {return false;}
  bool add() {return false;}
  bool update() {return false;}
  bool delete() {return false;}
}
