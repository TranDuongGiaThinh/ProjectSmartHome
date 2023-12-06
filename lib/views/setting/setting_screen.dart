import 'package:flutter/material.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/presenters/setting_presenter.dart';
import 'package:smart_home/presenters/user_presenter.dart';
import 'package:smart_home/views/setting/accounts_management_screen.dart';
import 'package:smart_home/views/setting/build_user_info.dart';
import 'package:smart_home/views/setting/custom_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.reloadThemeMode});
  final Function reloadThemeMode;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  initState() {
    super.initState();

    UserPresenter.getUserLogin().then((value) => setState(() {}));
  }

  reloadUserLogin(UserModel newUser) {
    UserPresenter.setUserLogin(newUser);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BuildUserInfo(
          iconButtonLogOut: true,
          user: UserPresenter.userLogin,
          reloadUsers: () => {},
          reloadUserLogin: reloadUserLogin,
          updateUserOfWidget: (value) => {},
        ),
        buildListButton()
      ],
    );
  }

  Widget buildListButton() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (UserPresenter.userLogin.isHost)
              CustomButton(
                  context: context,
                  icon: Icons.person,
                  height: 100,
                  content: LanguagePresenter.language.accountsManagement,
                  action: goToAccountManagementScreen),
            CustomButton(
                context: context,
                icon: SettingPresenter.setting.themeModeLight
                    ? Icons.light_mode
                    : Icons.dark_mode,
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
            CustomButton(
                context: context,
                icon: Icons.device_unknown_rounded,
                height: 100,
                content: LanguagePresenter.language.devices,
                action: () {
                  Navigator.pushNamed(context, '/de');
                }),
          ],
        ));
  }

  void goToAccountManagementScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AccountsManagementScreen(reloadUserLogin: reloadUserLogin),
        ));
  }

  void changeThemeMode() {
    SettingPresenter.changeThemeMode().then((value) {
      widget.reloadThemeMode();
      setState(() {});
    });
  }

  void changeLanguage() {
    SettingPresenter.changeLanguage().then((value) {
      widget.reloadThemeMode();
      setState(() {});
    });
  }
}
