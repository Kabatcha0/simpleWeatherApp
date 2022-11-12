import 'package:flutter/material.dart';

Widget defaultListTile(
    {required String text, required String data, required Widget icon}) {
  return ListTile(
    leading: icon,
    title: Text(
      text,
      style: const TextStyle(fontSize: 18),
    ),
    trailing: Text(
      data,
      style: const TextStyle(fontSize: 17),
    ),
  );
}
