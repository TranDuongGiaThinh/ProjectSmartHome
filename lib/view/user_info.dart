import 'package:flutter/material.dart';
import 'package:smart_home/model/constants.dart';
import 'package:smart_home/model/user.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/user_presenter.dart';
import 'package:smart_home/view/custom_button.dart';

class UserInfo extends StatefulWidget {
  const UserInfo(
      {super.key, required this.iconButtonLogOut, required this.user});
  final bool iconButtonLogOut;
  final User user;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController comfirmPassword = TextEditingController();

  bool isInfoEditting = false;
  bool isPasswordEditting = false;
  late bool ischeckAll = false;
  late User tempUser;
  late List<bool> prePermisions;

  initial() {
    tempUser = widget.user;
    ischeckAll = UserPresenter.isUserFullPermission(tempUser);
  }

  @override
  void initState() {
    super.initState();

    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
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
          buildAvatarUser(user.url),
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

  Widget buildAvatarUser(String url) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: ClipOval(
        child: Image.asset(
          url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildTextUser(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${LanguagePresenter.language.userName}: ${user.userName}"),
        Text("${LanguagePresenter.language.fullName}: ${user.fullName}"),
        Text("${LanguagePresenter.language.email}: ${user.email}"),
        Text("${LanguagePresenter.language.phoneNumber}: ${user.phoneNumber}"),
        Text(
            "${LanguagePresenter.language.permission}: ${UserPresenter.getStringPermission(user)}"),
        Text(
            "${LanguagePresenter.language.accountState}: ${user.blocked ? LanguagePresenter.language.blocked : LanguagePresenter.language.active}"),
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
            if (UserPresenter.user.id != widget.user.id)
              Column(
                children: [
                  CustomButton(
                      context: context,
                      icon: widget.user.blocked ? Icons.lock_open : Icons.lock,
                      content: widget.user.blocked
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
      GestureDetector(
          onTap: () => updateAvatar, child: buildAvatarUser(user.url)),
      buildTextField("${LanguagePresenter.language.fullName}: ", fullName),
      buildTextField("${LanguagePresenter.language.email}: ", email),
      buildTextField(
          "${LanguagePresenter.language.phoneNumber}: ", phoneNumber),
      if (UserPresenter.user.id != user.id) buildPermissionEditting(),
      buildButtonSave()
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
          Text(LanguagePresenter.language.changePassword,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                value: ischeckAll,
                onChanged: (value) => changeValueAllItem()),
            GestureDetector(
                onTap: changeValueAllItem,
                child: Text(LanguagePresenter.language.fullPermission)),
          ]));
    } else {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 15,
          child: Row(children: [
            Checkbox(
                value: tempUser.permissions[idRoom],
                onChanged: (value) => changeValueItem(idRoom)),
            GestureDetector(
                onTap: () => changeValueItem(idRoom),
                child: Text(LanguagePresenter.language.listRoom[idRoom])),
          ]));
    }
  }

  changeValueItem(int index) {
    setState(() {
      prePermisions = List.from(tempUser.permissions);
      tempUser.permissions[index] = !tempUser.permissions[index];
      if (true == UserPresenter.isUserFullPermission(tempUser)) {
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
        prePermisions = tempUser.permissions;
        tempUser.permissions = [true, true, true, true];
      } else {
        tempUser.permissions = prePermisions;
      }
    });
  }

  void logOut() {
    //clear file account
    //goto login screen
  }
  void updatePassword() {
    UserPresenter.changePassword(widget.user, password.text);

    setState(() {
      isPasswordEditting = false;
    });
  }

  void updateAvatar() {
    //show screen upload image
  }

  void blockOrUnblockUser() {
    UserPresenter.blockOrUnblockUser(widget.user);
  }

  void updateUser() {
    tempUser.update();
    setState(() {
      isInfoEditting = false;
    });
  }

  void deleteUser() {
    UserPresenter.deleteUser(widget.user);

    setState(() {});
  }
}
