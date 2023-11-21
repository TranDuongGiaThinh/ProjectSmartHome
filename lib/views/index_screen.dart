import 'package:flutter/material.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/views/bottom_nav.dart';
import 'package:smart_home/views/scheduling_screen.dart';
import 'package:smart_home/views/setting_screen.dart';

import 'statistical/statistical_screen.dart';

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
      case 0:
        return _buildIndexScreen();
      case 1:
        return const StatisticalScreen();
      case 2:
        return const SchedulingScreen();
      case 3:
        return SettingScreen(reloadThemeMode: widget.reloadThemeMode);
    }
    return const Placeholder();
  }

  Widget _buildIndexScreen() {
    return const Text("Chưa làm");
  }
}
