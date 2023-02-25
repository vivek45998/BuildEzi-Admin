import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web/local_storage.dart';
import 'package:web/route/getx_route/getx_route.dart';

import 'package:web/route/router.dart';
import 'package:web/route/router_url_name.dart';

import 'get_route_delegate.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages:AppRoute.routes,
      routerDelegate: AppRouterDelegate(),
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
