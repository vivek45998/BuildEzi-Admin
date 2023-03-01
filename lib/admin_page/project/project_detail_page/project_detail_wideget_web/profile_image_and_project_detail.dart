import 'package:flutter/material.dart';
import 'package:web/model/project_list_model.dart';

class ProfileImageAndProjectDetail extends StatelessWidget {
  ProfileImageAndProjectDetail({Key? key, this.projectDetail})
      : super(key: key);
  ProjectList? projectDetail;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: height * 0.55,
        width: width * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   width: 0.5,
          //   color: Colors.blueAccent,
          // ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              profileImage(height: height, width: width),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "${projectDetail?.data?.builder?.firstName ?? ''} ${projectDetail?.data?.builder?.lastName}"
                    .toUpperCase(),
                style:
                    TextStyle(color: Colors.black87, fontSize: width * 0.017),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    border: Border.all(width: 0.5),
                  ),
                ),
              ),
              projectData(height: height, width: width)
            ],
          ),
        ),
      ),
    );
  }

  profileImage({required double height, required double width}) {
    return Container(
      height: height * 0.2,
      width: height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(height * 0.2),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.5, 0.5),
            blurRadius: 0.5,
            color: Colors.white.withOpacity(0.5),
          )
        ],
      ),
      child: projectDetail?.data?.builder?.profilePicture == ""
          ? CircleAvatar(
              child: Text(
                projectDetail?.data?.builder?.firstName[0].toString() ?? '',
                style: TextStyle(fontSize: width * 0.04),
              ),
            )
          : CircleAvatar(
              backgroundImage: NetworkImage(
                  projectDetail?.data?.builder?.profilePicture ?? ''),
            ),
    );
  }

  projectData({required double height, required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.008,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Builder detail".toUpperCase(),
            style: TextStyle(
                fontSize: width * 0.0098, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: height * 0.016,
        ),
        detailPro(
            title: "First name :",
            titleValue: projectDetail?.data?.builder?.firstName ?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: "Last name :",
            titleValue: projectDetail?.data?.builder?.lastName ?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: "Email :",
            titleValue: projectDetail?.data?.builder?.email ?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: "Phone :",
            titleValue:
                projectDetail?.data?.builder?.phone?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: "Type :",
            titleValue:
                "Builder",
            height: height,
            width: width),
      ],
    );
  }

  detailPro(
      {required String title,
      required String titleValue,
      required double height,
      required double width}) {
    return Row(
      children: [
        SizedBox(
          width: width * 0.006,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: width * 0.0098, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            titleValue,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: width * 0.0085),
          ),
        )
      ],
    );
  }
}
