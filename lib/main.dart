import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web/route/router.dart';
import 'package:web/route/router_name.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
         debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouterName.loginPage,
        routes: Routers.routes(context));
  }
}
