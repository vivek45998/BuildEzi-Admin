import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/model/project_list_model.dart';
import 'package:web/route/router_url_name.dart';

class ProjectItem extends StatelessWidget {
  ProjectItem({Key? key, this.projectDetail}) : super(key: key);
  ProjectList? projectDetail;
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: height * 0.016, right: height * 0.016),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            context.vxNav.push(Uri.parse(RouterUrlName.projectLayoutPage),
                params: projectDetail);
            // Get.toNamed(RouterUrlName.userDetail,arguments: user);
            // context.goNamed("detailPage",extra: user );
            // // GoRoute(
            // //   path: RouterName.userDetail,
            // //   builder: (context, state) => UserDetail(user: user),
            // // );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => UserDetail(user:user),
            //   ),
            // );
          },
          child: ListTile(
            leading: Container(
              width: width * 0.1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  projectDetail?.data?.builder?.firstName![0].toUpperCase() ??
                      '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Sk-modernist",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            title: Text(
              projectDetail?.data?.builder?.firstName
                      .toString()
                      .capitalizeFirst ??
                  "",
              style: TextStyle(
                fontSize: height * 0.020,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            subtitle: Text(
              projectDetail?.data?.name ?? "",
              style: TextStyle(
                  fontSize: height * 0.016,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
            // trailing: SizedBox(
            //   width: width * 0.2,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Text(AppStrings.enable..capitalizeFirst),
            //       ),
            //       Expanded(
            //         child: Text(AppStrings.disable..capitalizeFirst),
            //       )
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
