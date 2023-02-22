import 'package:flutter/material.dart';
import 'package:web/admin_page/dashboard/dashboard.dart';
import 'package:web/admin_page/project/project.dart';
import 'package:web/admin_page/user/user_list.dart';
import 'package:web/login_page.dart';
import 'package:web/route/router_name.dart';
import 'package:web/sample_page.dart';

class Routers {
  static routes(BuildContext context) {
    return {
      RouterName.loginPage: (context) => LoginPage(),
      RouterName.dashboard: (context) => const DashboardPage(),
      RouterName.samplePage: (context) => const SamplePage(),
      RouterName.projectPage: (context) => const ProjectPage(),
      RouterName.userPage: (context) => const UserPage()
    };
  }
}
