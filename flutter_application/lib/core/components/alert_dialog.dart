import 'package:flutter/material.dart';

class CustomAlertDialog {
  static Future showAlertDialog(
      {required BuildContext context,
      required String tittle,
      required String comment}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tittle),
          content: Text(comment),
        );
      },
    );
  }
}
