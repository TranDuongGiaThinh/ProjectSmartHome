import 'package:flutter/material.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/setting_presenter.dart';
import 'package:smart_home/presenter/user_presenter.dart';
import 'package:smart_home/view/accounts_management_screen.dart';
import 'package:smart_home/view/custom_button.dart';
import 'package:smart_home/view/build_user_info.dart';

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
        BuildUserInfo(iconButtonLogOut: true, user: UserPresenter.userLogin!),
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
            if (UserPresenter.userLogin!.isHost)
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
