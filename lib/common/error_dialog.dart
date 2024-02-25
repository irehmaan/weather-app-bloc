import 'package:flutter/material.dart';
import '../model/custom_error.dart';

void errorDialog(BuildContext context, CustomError error) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(error.code),
        content: Text('${error.message}\n${error.exception}'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"))
        ],
      );
    },
  );
}
