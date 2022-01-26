import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String titleAlert;
  final String contentAlert;
  final Function()? onPressedValue;
  const CustomAlert({
    Key? key,
    required this.titleAlert,
    required this.contentAlert,
    required this.onPressedValue,
  }) : super(key: key);
  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(titleAlert),
          content: Text(contentAlert),
          actions: <Widget>[
            TextButton(
                child: const Text('Cerrar'),
                onPressed: () => Navigator.of(context).pop()),
            TextButton(child: const Text('Guardar'), onPressed: onPressedValue),
          ],
        );
      },
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleAlert),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: Text(contentAlert),
          actions: <Widget>[
            TextButton(
                child: const Text('Cerrar'),
                onPressed: () => Navigator.of(context).pop()),
            TextButton(child: const Text('Guardar'), onPressed: onPressedValue),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            child: const SizedBox(
              width: double.infinity,
              height: 45.0,
              child: Center(
                child: Text(
                  'Guardar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            onPressed: () => Platform.isAndroid
                ? displayDialogAndroid(context)
                : displayDialogIOS(context)));
  }
}
