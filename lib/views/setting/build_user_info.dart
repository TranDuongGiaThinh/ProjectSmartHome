import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/presenters/user_presenter.dart';
import 'package:smart_home/views/forgot_password/forgot_password.dart';
import 'package:smart_home/views/login.dart/login_screen.dart';
import 'package:smart_home/views/setting/custom_button.dart';
import 'package:smart_home/views/setting/show_dialog.dart';
import 'package:smart_home/views/setting/upload_image.dart';

class BuildUserInfo extends StatefulWidget {
  const BuildUserInfo(
      {super.key,
      required this.iconButtonLogOut,
      required this.user,
      required this.reloadUsers,
      required this.reloadUserLogin,
      required this.updateUserOfWidget});

  final bool iconButtonLogOut;
  final UserModel user;
  final Function() reloadUsers;
  final Function(UserModel) reloadUserLogin;
  final Function(String) updateUserOfWidget;

  @override
  State<BuildUserInfo> createState() => _BuildUserInfoState();
}

class _BuildUserInfoState extends State<BuildUserInfo> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController comfirmPassword = TextEditingController();

  bool isInfoEditting = false;
  bool isChanges = false;
  late bool ischeckAll = false;
  late List<bool> permissions;
  late UserModel tempUser;
  late List<bool> prePermisions;

  initial() {
    tempUser = UserModel.copy(widget.user);
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
    if (!isChanges || widget.user.userName != tempUser.userName) {
      isChanges = false;
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
              replacement:
                  buildInfoUserReadOnly(widget.iconButtonLogOut, tempUser),
              child: buildInfoUserEditting(tempUser),
            )));
  }

  Widget buildInfoUserReadOnly(bool iconButtonLogOut, UserModel user) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 40),
          buildAvatarUser(user.image),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (iconButtonLogOut) buildIconLogOut(context),
              const SizedBox(width: 40, height: 80),
            ],
          )
        ],
      ),
      buildTextUser(user),
      builActionOnUser()
    ]);
  }

  Widget buildIconLogOut(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        onPressed: () {
          logOut(context);
        },
        icon: const Icon(Icons.logout),
      ),
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

  Widget buildTextUser(UserModel user) {
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
                  isChanges = true;
                })
              },
            ),
            if (widget.user.userName == UserPresenter.userLogin.userName)
              CustomButton(
                  context: context,
                  icon: Icons.shield,
                  content: LanguagePresenter.language.changePassword,
                  action: () {
                    gotoPasswordChange();
                  }),
            if (UserPresenter.userLogin.userName != widget.user.userName)
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

  Widget buildInfoUserEditting(UserModel user) {
    fullName.text = user.fullName;
    email.text = user.email;
    phoneNumber.text = user.phoneNumber;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const SizedBox(width: 40),
          GestureDetector(
              onTap: changeAvatar, child: buildAvatarUser(user.image)),
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
        if (UserPresenter.userLogin.userName != user.userName)
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

  gotoPasswordChange() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ForGotPassword()));
  }

  Widget buildButtonSave() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: CustomButton(
          context: context,
          icon: Icons.save,
          content: LanguagePresenter.language.save,
          action: () {
            updateUser();
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
                value: ischeckAll,
                onChanged: (value) {
                  changeValueAllItem();
                }),
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
                onChanged: (value) {
                  changeValueItem(idRoom);
                }),
            GestureDetector(
                onTap: () {
                  changeValueItem(idRoom);
                },
                child: Text(LanguagePresenter.language.listRoom[idRoom])),
          ]));
    }
  }

  changeValueItem(int index) {
    prePermisions = List.from(permissions);
    permissions[index] = !permissions[index];
    if (permissions.every((element) => element == true)) {
      ischeckAll = true;
    } else {
      ischeckAll = false;
    }
    setState(() {});
  }

  changeValueAllItem() {
    ischeckAll = !ischeckAll;
    if (ischeckAll) {
      prePermisions = permissions;
      permissions = [true, true, true, true];
    } else {
      permissions = prePermisions;
    }
    setState(() {});
  }

  logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

// ignore: avoid_print
    print("Đã đăng xuất");

// ignore: avoid_print
    print(FirebaseAuth.instance.currentUser);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void blockOrUnblockUser() {
    tempUser.blocked = !tempUser.blocked;

    UserPresenter.updateUser(tempUser).then((value) {
      if (value) {
        widget.reloadUsers();
        widget.updateUserOfWidget(widget.user.userName);
      }
    });
  }

  changeAvatar() async {
    Uint8List? image = await uploadImage();
    if (image != null) {
      tempUser.image = image;

      setState(() {
        isChanges = true;
      });
    }
  }

  updateUser() {
    tempUser.fullName = fullName.text;
    tempUser.email = email.text;
    tempUser.phoneNumber = phoneNumber.text;
    tempUser.permissions = permissions;

    if (fullName.text.isEmpty) {
      showDialogResult(context, LanguagePresenter.language.failure,
          "${LanguagePresenter.language.fullName} ${LanguagePresenter.language.notBeEmpty}");
      return;
    }
    if (email.text.isEmpty) {
      showDialogResult(context, LanguagePresenter.language.failure,
          "${LanguagePresenter.language.email} ${LanguagePresenter.language.notBeEmpty}");
      return;
    }
    if (phoneNumber.text.isEmpty) {
      showDialogResult(context, LanguagePresenter.language.failure,
          "${LanguagePresenter.language.phoneNumber} ${LanguagePresenter.language.notBeEmpty}");
      return;
    }

    if (tempUser.isEqual(widget.user)) {
      showDialogResult(context, LanguagePresenter.language.failure,
          "${LanguagePresenter.language.updateUser} ${LanguagePresenter.language.failure}\n${LanguagePresenter.language.noChanges}");

      setState(() {
        isInfoEditting = false;
        isChanges = true;
      });

      return;
    }

    UserPresenter.updateUser(tempUser).then((value) {
      String strResult = value
          ? LanguagePresenter.language.success
          : LanguagePresenter.language.failure;

      showDialogResult(context, strResult,
          "${LanguagePresenter.language.updateUser} $strResult");

      setState(() {
        isInfoEditting = false;
        isChanges = true;
      });

      if (value) {
        widget.reloadUsers()!.then((value) {
          widget.updateUserOfWidget(widget.user.userName);

          if (tempUser.userName == UserPresenter.userLogin.userName) {
            UserPresenter.getUserLogin().then((value) {
              widget.reloadUserLogin(UserPresenter.userLogin);
            });
          }
        });
      }
    });
  }

  void deleteUser() {
    if (tempUser.userName == UserPresenter.userLogin.userName) {
      showDialogResult(context, LanguagePresenter.language.failure,
          "${LanguagePresenter.language.deleteUser} ${LanguagePresenter.language.failure}");
    } else {
      UserPresenter.deleteUser(widget.user).then((value) {
        String strResult = value
            ? LanguagePresenter.language.success
            : LanguagePresenter.language.failure;

        showDialogResult(context, strResult,
            "${LanguagePresenter.language.deleteUser} $strResult");

        if (value) {
          widget.reloadUsers().then((value) {
            setState(() {
              isChanges = true;
            });
          });

          widget.updateUserOfWidget("null");
        }
      });
    }
  }
}
