import 'package:flutter/material.dart';
import 'package:smart_home/model/user.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/user_presenter.dart';
import 'package:smart_home/view/custom_button.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key, required this.iconButtonLogOut, required this.user});
  final bool iconButtonLogOut;
  final User user;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  bool isEditting = false;

  updateState() {
    setState(() {
      isEditting = !isEditting;
    });
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
              visible: !isEditting,
              replacement: buildInfoUserEditting(widget.user),
              child: buildInfoUserReadOnly(widget.iconButtonLogOut, widget.user),
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
      builActionOnUser(user)
    ]);
  }

  Widget buildInfoUserEditting(User user) {
    fullName.text = user.fullName;
    email.text = user.email;
    phoneNumber.text = user.phoneNumber;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      GestureDetector(
          onTap: () => changeAvatar(user), child: buildAvatarUser(user.url)),
      buildTextField("${LanguagePresenter.language.fullName}: ", fullName),
      buildTextField("${LanguagePresenter.language.email}: ", email),
      buildTextField("${LanguagePresenter.language.phoneNumber}: ", phoneNumber),
      Padding(
        padding: const EdgeInsets.only(left: 5,right: 5, bottom: 5),
        child: CustomButton(
            context: context,
            icon: Icons.save,
            content: LanguagePresenter.language.save,
            action: () => updateUser(user)),
      )
    ]);
  }

  Widget buildTextField(String label, TextEditingController txtEditting) {
    return Container(
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

  Widget buildIconLogOut() {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(onPressed: logOut, icon: const Icon(Icons.logout)),
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

  Widget builActionOnUser(User user) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            CustomButton(
              context: context,
              icon: Icons.create,
              content: LanguagePresenter.language.edit,
              action: updateState,
            ),
            CustomButton(
                context: context,
                icon: Icons.shield,
                content: LanguagePresenter.language.changePassword,
                action: () => changePassword(user)),
            if (UserPresenter.user.id != user.id)
              Column(
                children: [
                  CustomButton(
                    context: context,
                    icon: UserPresenter.user.blocked
                        ? Icons.lock_open
                        : Icons.lock,
                    content: UserPresenter.user.blocked
                        ? LanguagePresenter.language.unBlockUser
                        : LanguagePresenter.language.blockUser,
                    action: () {
                      blockOrUnblockUser(user);
                    },
                  ),
                  CustomButton(
                      context: context,
                      icon: Icons.delete,
                      content: LanguagePresenter.language.deleteUser,
                      action: () {
                        deleteUser(user);
                      }),
                ],
              )
          ],
        ));
  }
  
  void logOut() {}
  void changePassword(User user) {}
  void changeAvatar(User user) {}

  void blockOrUnblockUser(User user) {
    UserPresenter.blockOrUnblockUser(user);
  }

  void updateUser(User user) {
    //
    updateState();
  }

  void deleteUser(User user) {
    UserPresenter.deleteUser(user);
  }
}