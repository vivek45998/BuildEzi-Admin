import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web/admin_page/dashboard/dashboard.dart';
import 'package:web/admin_page/project/project.dart';
import 'package:web/admin_page/user/user_detail_page.dart';
import 'package:web/admin_page/user/user_list.dart';
import 'package:web/local_storage.dart';
import 'package:web/login_page.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/sample_page.dart';

class AppRoute {
  static final List<GetPage> routes = [
    GetPage(
      name: RouterUrlName.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
        name: RouterUrlName.samplePage,
        page: () => const SamplePage(),
        middlewares: [RouteMiddleWare()]),
    GetPage(
        name: RouterUrlName.dashboard,
        page: () => const DashboardPage(),
        middlewares: [RouteMiddleWare()]),
    GetPage(
        name: RouterUrlName.projectPage,
        page: () => const ProjectPage(),
        middlewares: [RouteMiddleWare()]),
    GetPage(
        name: RouterUrlName.userPage,
        page: () => const UserPage(),
        middlewares: [RouteMiddleWare()]),
    GetPage(
        name: RouterUrlName.userDetail,
        page: () => UserDetail(),
        middlewares: [RouteMiddleWare()])
  ];
}

class RouteMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var userEmail = LocalStorage.getData(LocalStorage.email);
    return userEmail != null
         ? null//const RouteSettings(name:RouterUrlName.samplePage)
        : const RouteSettings(name: RouterUrlName.loginPage);
  }
}
