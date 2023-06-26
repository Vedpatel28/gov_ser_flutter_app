import 'package:flutter/material.dart';
import 'package:gov_ser_flutter_app/utils/routes_utils.dart';
import 'package:gov_ser_flutter_app/views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        AllRoutes.homepage: (context) => home_page(),
      },
    );
  }
}
