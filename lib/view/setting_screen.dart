import 'package:flutter/material.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/setting_presenter.dart';
import 'package:smart_home/presenter/user_presenter.dart';
import 'package:smart_home/view/accounts_management_screen.dart';
import 'package:smart_home/view/custom_button.dart';
import 'package:smart_home/model/user.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.reloadThemeMode});
  final Function reloadThemeMode;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [buildInfoUser(true, UserPresenter.user), buildListButton()],
      
    );
  }

  Widget buildInfoUser(bool iconButtonLogOut, User user) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: GestureDetector(
            onTap: editUser,
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40),
                         buildAvatarUser(user.url),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if(iconButtonLogOut) buildIconLogOut(),
                            const SizedBox(width: 40, height: 80),
                          ],
                        )
                      ],
                    ),
                    buildTextUser(user),
                    builActionOnUser(user)
                  ]),
            )));
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
        Text("${LanguagePresenter.language.permission}: ${UserPresenter.getStringPermission(user)}"),
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
              action: editUser,
            ),
            CustomButton(
                context: context,
                icon: Icons.shield,
                content: LanguagePresenter.language.changePassword,
                action: changePassword),
            if (UserPresenter.user.ishost && UserPresenter.user.id != user.id)
              Column(
                children: [
                  CustomButton(
                    context: context,
                    icon: UserPresenter.user.blocked ? Icons.lock_open : Icons.lock,
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

  Widget buildListButton() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (UserPresenter.user.ishost)
              CustomButton(
                  context: context,
                  icon: Icons.person,
                  height: 100,
                  content: LanguagePresenter.language.accountsManagement,
                  action: accountManagement),
            CustomButton(
                context: context,
                icon:
                    SettingPresenter.setting.themeModeLight ? Icons.light_mode : Icons.dark_mode,
                height: 100,
                content: SettingPresenter.setting.themeModeLight
                    ? LanguagePresenter.language.themeModeLight
                    : LanguagePresenter.language.themeModeDark,
                action: changeThemeMode),
            CustomButton(
                context: context,
                icon: Icons.flag,
                height: 100,
                content: SettingPresenter.setting.language == "vi"
                    ? LanguagePresenter.language.typeLanguageVi
                    : LanguagePresenter.language.typeLanguageEn,
                action: changeLanguage),
          ],
        ));
  }

  void logOut() {}
  void editUser() {}
  void changePassword() {}
  void accountManagement() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AccountsManagementScreen(
                  buildInfoUser: buildInfoUser,
                )));
  }

  void changeThemeMode() {
    SettingPresenter.changeThemeMode();
    widget.reloadThemeMode();
    setState(() {});
  }

  void changeLanguage() {
    LanguagePresenter.changeLanguage();
    setState(() {});
  }

  void blockOrUnblockUser(User user) {
    UserPresenter.blockOrUnblockUser(user);
  }
  void deleteUser(User user) {
    UserPresenter.deleteUser(user);
  }
}
