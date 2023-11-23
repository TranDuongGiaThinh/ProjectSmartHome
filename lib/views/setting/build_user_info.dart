import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/presenters/user_presenter.dart';
import 'package:smart_home/views/setting/custom_button.dart';
import 'package:smart_home/views/setting/show_diaglog.dart';

class BuildUserInfo extends StatefulWidget {
  const BuildUserInfo(
      {super.key,
      required this.iconButtonLogOut,
      required this.user,
      required this.reloadUsers,
      required this.reloadUserLogin,
      required this.updateUserOfWidget});

  final bool iconButtonLogOut;
  final User user;
  final Function() reloadUsers;
  final Function() reloadUserLogin;
  final Function(User?) updateUserOfWidget;

  @override
  State<BuildUserInfo> createState() => _BuildUserInfoState();
}

class _BuildUserInfoState extends State<BuildUserInfo> {
  Uint8List? image;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController comfirmPassword = TextEditingController();

  bool isInfoEditting = false;
  bool isPasswordEditting = false;
  late bool ischeckAll = false;
  late List<bool> permissions;
  late User tempUser;
  late List<bool> prePermisions;

  initial() {
    tempUser = User.copy(widget.user);
    permissions = List.from(tempUser.permissions);
    ischeckAll = UserPresenter.isUserFullPermission(tempUser);
  }

  @override
  void initState() {
    super.initState();

    initial();
  }

  @override
  Widget build(BuildContext context) {
    if (!tempUser.isEqual(widget.user)) {
      initial();
    }
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                color: Constants.colorUserBackground,
                borderRadius: BorderRadius.circular(20)),
            child: Visibility(
              visible: isInfoEditting,
              replacement: isPasswordEditting
                  ? buildPasswordEditting()
                  : buildInfoUserReadOnly(widget.iconButtonLogOut, tempUser),
              child: buildInfoUserEditting(tempUser),
            )));
  }

  Widget buildInfoUserReadOnly(bool iconButtonLogOut, User user) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 40),
          buildAvatarUser(user.image),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (iconButtonLogOut) buildIconLogOut(),
              const SizedBox(width: 40, height: 80),
            ],
          )
        ],
      ),
      buildTextUser(user),
      builActionOnUser()
    ]);
  }

  Widget buildIconLogOut() {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(onPressed: logOut, icon: const Icon(Icons.logout)),
    );
  }

  Widget buildAvatarUser(Uint8List? image) {
    if (image != null) {
      return SizedBox(
        width: 100.0,
        height: 100.0,
        child: ClipOval(
          child: Image.memory(
            image,
            fit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 100.0,
        height: 100.0,
        child: ClipOval(
          child: Image.asset(
            Constants.avatarDefault,
            fit: BoxFit.fill,
          ),
        ),
      );
    }
  }

  Widget buildTextUser(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${LanguagePresenter.language.userName}: ${user.userName}",
          style: const TextStyle(color: Colors.black),
        ),
        Text("${LanguagePresenter.language.fullName}: ${user.fullName}",
            style: const TextStyle(color: Colors.black)),
        Text("${LanguagePresenter.language.email}: ${user.email}",
            style: const TextStyle(color: Colors.black)),
        Text("${LanguagePresenter.language.phoneNumber}: ${user.phoneNumber}",
            style: const TextStyle(color: Colors.black)),
        Text(
            "${LanguagePresenter.language.permission}: ${UserPresenter.getStringPermission(user)}",
            style: const TextStyle(color: Colors.black)),
        Text(
            "${LanguagePresenter.language.accountState}: ${user.blocked ? LanguagePresenter.language.blocked : LanguagePresenter.language.active}",
            style: const TextStyle(color: Colors.black)),
      ],
    );
  }

  Widget builActionOnUser() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            CustomButton(
              context: context,
              icon: Icons.create,
              content: LanguagePresenter.language.edit,
              action: () => {
                setState(() {
                  isInfoEditting = true;
                })
              },
            ),
            CustomButton(
                context: context,
                icon: Icons.shield,
                content: LanguagePresenter.language.changePassword,
                action: () => setState(() {
                      isPasswordEditting = true;
                    })),
            if (UserPresenter.userLogin!.userName != widget.user.userName)
              Column(
                children: [
                  CustomButton(
                      context: context,
                      icon: tempUser.blocked ? Icons.lock_open : Icons.lock,
                      content: tempUser.blocked
                          ? LanguagePresenter.language.unBlockUser
                          : LanguagePresenter.language.blockUser,
                      action: blockOrUnblockUser),
                  CustomButton(
                    context: context,
                    icon: Icons.delete,
                    content: LanguagePresenter.language.deleteUser,
                    action: deleteUser,
                  )
                ],
              )
          ],
        ));
  }

  Widget buildInfoUserEditting(User user) {
    fullName.text = user.fullName;
    email.text = user.email;
    phoneNumber.text = user.phoneNumber;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const SizedBox(width: 40),
          GestureDetector(
              onTap: () => updateAvatar, child: buildAvatarUser(user.image)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildButtonExit(),
              const SizedBox(width: 40, height: 80),
            ],
          )
        ]),
        buildTextField("${LanguagePresenter.language.fullName}: ", fullName),
        buildTextField("${LanguagePresenter.language.email}: ", email),
        buildTextField(
            "${LanguagePresenter.language.phoneNumber}: ", phoneNumber),
        if (UserPresenter.userLogin!.userName != user.userName)
          buildPermissionEditting(),
        buildButtonSave()
      ])
    ]);
  }

  Widget buildButtonExit() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(
        width: 40,
        height: 40,
        child: IconButton(
            onPressed: () {
              setState(() {
                isInfoEditting = false;
                isPasswordEditting = false;
              });
            },
            icon: const Icon(Icons.cancel)),
      )
    ]);
  }

  Widget buildPermissionEditting() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "${LanguagePresenter.language.permission}: ${UserPresenter.getStringPermission(tempUser)}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildItemCheckBox(Constants.livingRoom),
                buildItemCheckBox(Constants.kitchen)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildItemCheckBox(Constants.bedRoom),
                buildItemCheckBox(Constants.toilet)
              ],
            ),
            buildItemCheckBox(null)
          ],
        ));
  }

  Widget buildPasswordEditting() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40),
              Text(LanguagePresenter.language.changePassword,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              buildButtonExit(),
            ],
          ),
          buildTextField(LanguagePresenter.language.password, password),
          buildTextField(
              LanguagePresenter.language.confirmPassword, comfirmPassword),
          buildButtonSave()
        ]));
  }

  Widget buildButtonSave() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: CustomButton(
          context: context,
          icon: Icons.save,
          content: LanguagePresenter.language.save,
          action: () => {
                if (isInfoEditting)
                  updateUser()
                else if (isPasswordEditting)
                  updatePassword()
              }),
    );
  }

  Widget buildTextField(String label, TextEditingController txtEditting) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      margin: const EdgeInsets.only(top: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        controller: txtEditting,
      ),
    );
  }

  Widget buildItemCheckBox(int? idRoom) {
    if (idRoom == null) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 15,
          child: Row(children: [
            Checkbox(
                value: ischeckAll, onChanged: (value) => changeValueAllItem()),
            GestureDetector(
                onTap: changeValueAllItem,
                child: Text(LanguagePresenter.language.fullPermission)),
          ]));
    } else {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 15,
          child: Row(children: [
            Checkbox(
                value: permissions[idRoom],
                onChanged: (value) => changeValueItem(idRoom)),
            GestureDetector(
                onTap: () => changeValueItem(idRoom),
                child: Text(LanguagePresenter.language.listRoom[idRoom])),
          ]));
    }
  }

  changeValueItem(int index) {
    setState(() {
      prePermisions = List.from(permissions);
      permissions[index] = !permissions[index];
      if (permissions.every((element) => element == true)) {
        ischeckAll = true;
      } else {
        ischeckAll = false;
      }
    });
  }

  changeValueAllItem() {
    setState(() {
      ischeckAll = !ischeckAll;
      if (ischeckAll) {
        prePermisions = permissions;
        permissions = [true, true, true, true];
      } else {
        permissions = prePermisions;
      }
    });
  }

  void logOut() {
    //clear file account.json
    //goto login screen
    Navigator.pushNamed(context, "/login");
  }

  void updateAvatar() {
    //show screen upload image
  }

  void updatePassword() {
    if (password.text != comfirmPassword.text) {
      showDialogResult(context, LanguagePresenter.language.failure,
          "${LanguagePresenter.language.password} ${LanguagePresenter.language.and} ${LanguagePresenter.language.confirmPassword} ${LanguagePresenter.language.doNotMatch}");
      return;
    }

    UserPresenter.changePassword(widget.user, password.text).then((value) {
      String strResult = value
          ? LanguagePresenter.language.success
          : LanguagePresenter.language.failure;

      setState(() {
        isPasswordEditting = false;
      });

      showDialogResult(context, strResult,
          "${LanguagePresenter.language.changePassword} $strResult");
    });
  }

  void blockOrUnblockUser() {
    tempUser.blocked = !tempUser.blocked;

    UserPresenter.updateUser(tempUser).then((value) {
      if (value) {
        widget.reloadUsers().then((value) {
          setState(() {});
        });
        UserPresenter.getUserByUserName(widget.user.userName).then((value) {
          widget.updateUserOfWidget(value!);
          setState(() {});
        });
      }
    });
  }

  void updateUser() {
    tempUser.image = image;
    tempUser.userName = tempUser.userName;
    tempUser.fullName = fullName.text;
    tempUser.email = email.text;
    tempUser.phoneNumber = phoneNumber.text;
    tempUser.permissions = permissions;

    UserPresenter.updateUser(tempUser).then((value) {
      String strResult = value
          ? LanguagePresenter.language.success
          : LanguagePresenter.language.failure;
      setState(() {
        isInfoEditting = false;
      });

      showDialogResult(context, strResult,
          "${LanguagePresenter.language.updateUser} $strResult");

      if (value) {
        widget.reloadUsers().then((value) {
          setState(() {});
        });
        if (tempUser.userName == UserPresenter.userLogin!.userName) {
          widget.reloadUserLogin();
        }
        UserPresenter.getUserByUserName(widget.user.userName).then((value) {
          widget.updateUserOfWidget(value!);
        });
      }
    });
  }

  void deleteUser() {
    UserPresenter.deleteUser(widget.user).then((value) {
      String strResult = value
          ? LanguagePresenter.language.success
          : LanguagePresenter.language.failure;

      showDialogResult(context, strResult,
          "${LanguagePresenter.language.deleteUser} $strResult");

      if (value) {
        widget.reloadUsers().then((value) {
          setState(() {});
        });

        widget.updateUserOfWidget(null);
      }
    });
  }
}
