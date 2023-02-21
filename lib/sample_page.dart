import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:web/admin_page/project.dart';
import 'package:web/admin_page/user_page.dart';

import 'admin_page/dashboard.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  static const String id = "sample_page";

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  static const String id = "sample_page";
  Widget _selectedScreen = const DashboardPage();

  currentScreen(item) {
    switch (item.route) {
      case DashboardPage.id:
        setState(() {
          _selectedScreen = const DashboardPage();
        });
        break;
      case ProjectPage.id:
        setState(() {
          _selectedScreen = const ProjectPage();
        });
        break;
      case UserPage.id:
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
        title: const Text('Admin'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashboardPage.id,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'ALL USERS',
            route: UserPage.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'ALL PROJECTS',
            route: ProjectPage.id,
            icon: Icons.file_present_outlined,
          ),

        ],
        selectedRoute: SamplePage.id,
        onSelected: (item) {
          currentScreen(item);
          //   if (item.route != null) {
          //     Navigator.of(context).pushNamed(item.route!);
          //   }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _selectedScreen,
      ),
    );
  }
}
