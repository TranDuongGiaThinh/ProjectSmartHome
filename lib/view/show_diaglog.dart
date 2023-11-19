import 'package:flutter/material.dart';
import 'package:smart_home/presenter/language_presenter.dart';

void showDialogResult(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(LanguagePresenter.language.ok),
          ),
        ],
      );
    },
  );
}