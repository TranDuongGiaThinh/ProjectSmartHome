import 'package:flutter/material.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/setting_presenter.dart';
import 'package:smart_home/presenter/user_presenter.dart';
import 'package:smart_home/view/accounts_management_screen.dart';
import 'package:smart_home/view/custom_button.dart';
import 'package:smart_home/view/user_info.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.reloadThemeMode});
  final Function reloadThemeMode;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  bool isEditting = false;

  @override
  void initState() {
    super.initState();
  }

  updateState() {
    setState(() {
      isEditting = !isEditting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserInfo(iconButtonLogOut: true, user: UserPresenter.user),
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
            if (UserPresenter.user.ishost)
              CustomButton(
                  context: context,
                  icon: Icons.person,
                  height: 100,
                  content: LanguagePresenter.language.accountsManagement,
                  action: accountManagement),
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
          ],
        ));
  }

  void accountManagement() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AccountsManagementScreen(),
        ));
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
}
