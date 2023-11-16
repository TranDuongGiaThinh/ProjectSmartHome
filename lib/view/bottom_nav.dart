import 'package:flutter/material.dart';
import 'package:smart_home/presenter/language_presenter.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key, required this.currentIndex, required this.updateIndex}) : super(key: key);
  final int currentIndex;
  final Function(int) updateIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.blueAccent,
       
      items: [
        BottomNavigationBarItem(
          label: LanguagePresenter.language.index,
          icon: const Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: LanguagePresenter.language.statistical,

          icon: const Icon(Icons.stacked_bar_chart_rounded)

        ),
        BottomNavigationBarItem(
          label: LanguagePresenter.language.scheduling,
          icon: const Icon(Icons.schedule)
        ),
        BottomNavigationBarItem(
          label: LanguagePresenter.language.setting,
          icon: const Icon(Icons.settings)
        ),
      ],
      currentIndex: currentIndex,
      onTap: (int indexOfItem){
        updateIndex(indexOfItem);
      }
    );
  }
}