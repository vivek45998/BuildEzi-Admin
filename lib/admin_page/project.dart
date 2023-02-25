import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web/values/app_assets.dart';

import '../values/app_colors.dart';
import '../values/app_strings.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);
  static const String id = "projectPage";

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  double height=0.0;
  double width=0.0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return  Text("lsjl");
    return const Scaffold(
      body: Center(
        child: Text("project"),
      ),
    );
  }

}


