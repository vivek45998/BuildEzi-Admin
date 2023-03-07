import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:velocity_x/velocity_x.dart';
import 'package:web/admin_page/project/project_detail_page/project_detail_layout/layout_builder.dart';
import 'package:web/admin_page/user/user_detail_page.dart';
import 'package:web/local_storage.dart';
import 'package:web/localstorage_sessionstorage/localstorage.dart';
import 'package:web/localstorage_sessionstorage/sessionstorage.dart';
import 'package:web/login_page.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/sample_page.dart';
import 'package:web/web/vx_obs.dart';

import 'admin_page/project/project.dart';
import 'admin_page/user/user_detail_responsive/layout_builder.dart';

// @JS()
// library onBeforeUnload;
//
// import 'package:js/js.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  print("====${SessionStorage.getValue(LocalStorage.loginBearerToken)}");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var dat = LocalStorage.getData(LocalStorage.loginBearerToken);

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

      routerDelegate: VxNavigator(
        notFoundPage: (uri, params) => MaterialPage(
          key: ValueKey('Not-found-page'),
          child: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: Text('Page ${uri.path} not found'),
              ),
            ),
          ),
        ),
        observers: [MyObs()],
        routes: {
          "/": (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? const MaterialPage(
                      child: SamplePage(),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.layoutPage: (_, param) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? MaterialPage(
                      child: LayoutPage(
                        user: param,
                      ),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.samplePage: (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? const MaterialPage(
                      child: SamplePage(),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.projectPage: (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? const MaterialPage(child: ProjectPage())
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.userDetail: (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? MaterialPage(
                      child: UserDetail(),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.projectLayoutPage: (_, params) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? MaterialPage(
                      child: ProjectLayoutBuilder(
                        projectList: params,
                      ),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
        },
      ),
    );
    // return GetMaterialApp.router(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //  // initialRoute: RouterUrlName.loginPage,
    //   getPages: AppRoute.routes,
    //   routerDelegate: AppRouterDelegate(),
    //   // routerConfig: AppRoutes.routes,
    //   // initialRoute: routeCheck(),
    //   // routes: Routers.routes(context));
    // );
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
