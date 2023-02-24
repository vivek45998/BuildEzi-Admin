import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:web/admin_page/project/project.dart';
import 'package:web/admin_page/user/user_list.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/values/app_colors.dart';
import 'package:web/values/app_strings.dart';

import 'admin_page/dashboard/dashboard.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  Widget _selectedScreen = const DashboardPage();

  currentScreen(item) {
    switch (item.route) {
      case RouterUrlName.dashboard:
        setState(() {
          _selectedScreen = const DashboardPage();
        });
      //  Navigator.pop(context);
        break;
      case RouterUrlName.projectPage:
        setState(() {
          _selectedScreen = const ProjectPage();
        });
      // Navigator.pop(context);
        break;
      case RouterUrlName.userPage:
        setState(() {
          _selectedScreen = const UserPage();
        });
      //  Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
    },
      child: AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            AppStrings.admin.toUpperCase(),
          ),
        ),
        sideBar: SideBar(
          items: [
            AdminMenuItem(
              title: AppStrings.dashboard.toUpperCase(),
              route: RouterUrlName.dashboard,
              icon: Icons.dashboard,
            ),
            AdminMenuItem(
              title: AppStrings.allUser.toUpperCase(),
              route: RouterUrlName.userPage,
              icon: Icons.person,
            ),
            AdminMenuItem(
              title: AppStrings.projectPage.toUpperCase(),
              route: RouterUrlName.projectPage,
              icon: Icons.file_present_outlined,
            ),
          ],
          selectedRoute: RouterUrlName.samplePage,
          onSelected: (item) {
            currentScreen(item);
          },

        ),
        body: SingleChildScrollView(
          child: _selectedScreen,
        ),
      ),
    );
  }


}
