import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web/local_storage.dart';
import 'package:web/route/getx_route/getx_route.dart';

import 'package:web/route/router.dart';
import 'package:web/route/router_url_name.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
     initialRoute: RouterUrlName.loginPage,
     getPages:AppRoute.routes,
     // routerConfig: AppRoutes.routes,
      // initialRoute: routeCheck(),
      // routes: Routers.routes(context));
    );
    return MaterialApp.router(
        title: 'Flutter Demo',
         debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: LoginPage(),
        //
        // onGenerateRoute:,
      // routerConfig: AppRoutes.routes,
        // initialRoute: routeCheck(),
        // routes: Routers.routes(context));
    );
  }
  routeCheck(){
    var email=LocalStorage.getData(LocalStorage.email);
    if(email!=null){
      print("dashboard");
      print("=====================$email=========");
      return RouterUrlName.dashboard;

    }
    else{
      print("login");
      print("=====================$email=========");
      return RouterUrlName.loginPage;
    }
  }
}
