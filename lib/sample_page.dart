import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:web/admin_page/project.dart';
import 'package:web/admin_page/user_page.dart';
import 'package:web/route/router_name.dart';
import 'package:web/values/app_colors.dart';
import 'package:web/values/app_strings.dart';

import 'admin_page/dashboard.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  Widget _selectedScreen = const DashboardPage();

  currentScreen(item) {
    switch (item.route) {
      case RouterName.dashboard:
        setState(() {
          _selectedScreen = const DashboardPage();
        });
        break;
      case RouterName.projectPage:
        setState(() {
          _selectedScreen = const ProjectPage();
        });
        break;
      case RouterName.userPage:
        setState(() {
          _selectedScreen = const UserPage();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: AppColor.appBarColor,
        title: Text(
          AppStrings.admin.toUpperCase(),
        ),
      ),
      sideBar: SideBar(
        activeBackgroundColor: Colors.redAccent,
        activeIconColor: Colors.redAccent,
        activeTextStyle: TextStyle(color: Colors.redAccent),
        items: [
          AdminMenuItem(
            title: AppStrings.dashboard.toUpperCase(),
            route: RouterName.dashboard,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: AppStrings.allUser.toUpperCase(),
            route: RouterName.userPage,
            icon: Icons.people,
          ),
          AdminMenuItem(
            title: AppStrings.projectPage.toUpperCase(),
            route: RouterName.projectPage,
            icon: Icons.file_present_outlined,
          ),
          AdminMenuItem(
            title: AppStrings.logout.toUpperCase(),
            route: RouterName.projectPage,
            icon: Icons.logout,
          ),
        ],
        selectedRoute: RouterName.samplePage,
        onSelected: (item) {
          currentScreen(item);
        },
        // header: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'header',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        // footer: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'footer',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: _selectedScreen,
    );
  }
}
