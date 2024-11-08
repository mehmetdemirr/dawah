import 'package:flutter/material.dart';

Future<void> customShowAlertDialog({
  required BuildContext context,
  required Widget title,
  required Widget text,
  Widget? no,
  Widget? yes,
  VoidCallback? noFunction,
  VoidCallback? yesFunction,
  bool barrierDismissible = true,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible, // user must tap button,
    builder: (BuildContext context) {
      // Eğer sadece bir buton varsa, onu ortalarız. İki buton varsa yan yana gösterilir.
      List<Widget> actions = [];

      if (no != null && yes != null) {
        actions = [no, yes];
      } else if (no != null) {
        actions = [
          Expanded(child: Center(child: no)),
        ];
      } else if (yes != null) {
        actions = [
          Expanded(child: Center(child: yes)),
        ];
      } else {
        // Hiç buton verilmemişse varsayılan olarak bir "Tamam" butonu ekleriz.
        actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tamam'),
          ),
        ];
      }

      return AlertDialog.adaptive(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ), // Köşe yuvarlama
        title: title,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              text,
            ],
          ),
        ),
        actions: actions,
      );
    },
  );
}
