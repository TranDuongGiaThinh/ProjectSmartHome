import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/view/bottom_nav.dart';
import 'package:smart_home/view/scheduling_screen.dart';
import 'package:smart_home/view/setting_screen.dart';
import 'package:smart_home/view/statistical_screen.dart';
import 'package:smart_home/views/schedulingDetail_screen.dart';
import 'package:smart_home/views/scheduling_Screen.dart';
import 'package:smart_home/views/setting_screen.dart';
=======

import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/views/bottom_nav.dart';
import 'package:smart_home/views/home/home.dart';
import 'package:smart_home/views/scheduling_screen.dart';
import 'package:smart_home/views/setting/setting_screen.dart';
>>>>>>> 705dca1e275685689b529075ced4662b0f7906d6
import 'package:smart_home/views/statistical_screen.dart';

import '../presenters/language_presenter.dart';
import 'bottom_nav.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key, required this.reloadThemeMode});
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
      appBar: AppBar(
          toolbarHeight: (selectedIndex == 0) ? 0 : null,
          automaticallyImplyLeading: false,
          title: Center(child: Text(title))),
      body: _buildSelectedContent(),
      bottomNavigationBar: BottomNav(
        currentIndex: selectedIndex,
        updateIndex: updateIndex,
      ),
    );
  }

  Widget _buildSelectedContent() {
    switch (selectedIndex) {
      case 1:
        return const StatisticalScreen();
      case 2:
        return const scheduling_screen();
      case 3:
        return SettingScreen(reloadThemeMode: widget.reloadThemeMode);
      default:
        return const HomeScreen();
    }
  }
}