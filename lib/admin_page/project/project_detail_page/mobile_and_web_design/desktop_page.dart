// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:web/admin_page/user/widget/project_detail_widget/builder_detail_page.dart';
import 'package:web/model/project_list_model.dart';

import '../../../../values/app_assets.dart';
import '../project_detail_wideget_web/builder_detail.dart';
import '../project_detail_wideget_web/profile_image_and_project_detail.dart';
import '../project_detail_wideget_web/web_project_detail.dart';

class ProjectDesktopPage extends StatefulWidget {
  ProjectDesktopPage({Key? key, this.projectDetail}) : super(key: key);
  ProjectList? projectDetail;

  @override
  State<ProjectDesktopPage> createState() => _ProjectDesktopPageState();
}

class _ProjectDesktopPageState extends State<ProjectDesktopPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.cyanAccent.withOpacity(0.4),
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.backGroundImage),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * 0.2,
                    bottom: height * 0.3,
                    left: width * 0.1,
                    right: width * 0.1),
                child: Container(
                  width: width,
                  height: height*0.75,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.5, 0.5),
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ]),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Text(
                            "+++width=$width++ height=$height",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Container(
                            height: height * 0.26,
                            width: width,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppAssets.backGroundImage),
                                  fit: BoxFit.cover),
                            ),
                            // child: Image.asset(AppAssets.backGroundImage),
                          ),

                        ],
                      ),
                      Positioned(
                        top: height * 0.0050,
                        bottom: height * 0.0020,
                        right: height * 0.0010,
                        left: height * 0.0010,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileImageAndProjectDetail(
                                projectDetail: widget.projectDetail),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Container(
                                height: height * 0.55,
                                width: width * 0.50,
                                //  color: Colors.blue,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0.5, 0.5),
                                      blurRadius: 1,
                                      color: Colors.grey,
                                    ),
                                    BoxShadow(
                                      offset: Offset(-0.5, -0.5),
                                      blurRadius: 1,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                child:ProjectClientWorkerWidget(projectDetail: widget.projectDetail,)

                                )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
