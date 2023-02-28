import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/admin_page/project.dart';
import 'package:web/admin_page/user/user_detail_page.dart';
import 'package:web/login_page.dart';
import 'package:web/route/getx_route/getx_route.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/sample_page.dart';

import 'admin_page/user/user_detail_responsive/layout_builder.dart';

// @JS()
// library onBeforeUnload;
//
// import 'package:js/js.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // defaultTransition: Transition.fade,
      //getPages: AppPages.routes,

      routeInformationParser: VxInformationParser(),
      // routingCallback: (routing) {
      //   print("heekkdkv;d$routing");
      //   if (routing?.current == '/layoutPage') {
      //     print("${routing?.current}");
      //   }
      // },
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginPage()),
        RouterUrlName.layoutPage: (_, param) =>
            MaterialPage(
              child: LayoutPage(
                user: param,
              ),
            ),
        RouterUrlName.samplePage: (_, __) =>
        const MaterialPage(
          child: SamplePage(),
        ),
        RouterUrlName.projectPage: (_, __) =>
        const MaterialPage(child: ProjectPage()),
        RouterUrlName.userDetail: (_, __) =>
            MaterialPage(
              child: UserDetail(),
            ),
      }),
    );
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      getPages: AppRoute.routes,
      // routerDelegate: AppRouterDelegate(),
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
}

// @JS('onbeforeunload')
// external set _onBeforeUnload(String Function(dynamic) callback);
//
// void onBeforeUnload(String Function() callback) {
//   _onBeforeUnload = allowInterop((_) => callback());
// }