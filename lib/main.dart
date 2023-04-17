import 'package:flutter/material.dart';

import 'page_list_users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '123190033',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageListUsers(),
    );
  }
}