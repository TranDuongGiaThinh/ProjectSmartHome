import 'package:flutter/material.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/view/bottom_nav.dart';
import 'package:smart_home/view/setting_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen(
      {super.key, required this.idUser, required this.reloadThemeMode});
  final int idUser;
  final Function reloadThemeMode;

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  String title = LanguagePresenter.language.index;
  int selectedIndex = 0;

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
      switch (selectedIndex) {
        case 0:
          title = LanguagePresenter.language.index;
          break;
        case 1:
          title = LanguagePresenter.language.statistical;
          break;
        case 2:
          title = LanguagePresenter.language.scheduling;
          break;
        case 3:
          title = LanguagePresenter.language.setting;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(title))),
      body: _buildSelectedContent(),
      bottomNavigationBar: BottomNav(
        currentIndex: selectedIndex,
        updateIndex: updateIndex,
      ),
    );
  }

  Widget _buildSelectedContent() {
    switch (selectedIndex) {
      case 0:
        return _buildIndexScreen();
      case 1:
        //thống kê
        return Container();//body
      case 2:
        //lên lịch
        return Container();//body
      case 3:
        return SettingScreen(reloadThemeMode: widget.reloadThemeMode);
    }
    return const Placeholder();
  }

  Widget _buildIndexScreen() {
    return Container();//body
  }
}
