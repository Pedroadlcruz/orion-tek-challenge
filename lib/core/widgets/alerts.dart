import 'package:flutter/material.dart';

class Alerts {
  Alerts._();

  ///Build a [Custom Alert Dialog] base on the current Platform [IOS] and [Android]
  static Future<Future> alertDialog({
    required BuildContext context,
    required String content,
    bool? isSuccess = true,
    required void Function()? onOk,
  }) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: isSuccess!
                ? const Icon(
                    Icons.check_circle_outline,
                    color: Colors.greenAccent,
                    size: 60,
                  )
                : const Icon(
                    Icons.cancel_outlined,
                    color: Colors.redAccent,
                    size: 60,
                  ),
            content: Text(content),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: onOk,
                  child: const Text("Volver"),
                ),
              ),
            ],
          );
        });
  }
}