// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/admin_page/user/user_detail_responsive/layout_builder.dart';
import 'package:web/model/user_data.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/values/app_strings.dart';

class UserItem extends StatelessWidget {
  UserItem({Key? key, this.user}) : super(key: key);
  UserData? user;
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
          var  map= {
              "firstName": "abhay",
              "lastName": "mishra",
              "email": "abhay@yopmail.com",
              "id": "5",
              "name": "abhay",
              "type": "builder",
              "image": "https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",

              "phone": "6464544484",
              "trial_ended": "2023-03-23"
            };
          context.vxNav.push(Uri.parse(RouterUrlName.layoutPage),params: user);
         //   Get.rootDelegate.offNamed(RouterUrlName.layoutPage,arguments: user);
        //    Get.rootDelegate.toNamed(RouterUrlName.layoutPage,parameters:{"id":user?.id??''});
         // Get.offAllNamed("/'${RouterUrlName.layoutPage}'?device=phone&id=354&name=Enzo");
            //Get.to(()=>LayoutPage(user: user,));
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
                  user?.firstName![0].toUpperCase() ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Sk-modernist",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            title: Text(
              user?.firstName.toString().capitalizeFirst ?? "",
              style: TextStyle(
                fontSize: height * 0.020,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            subtitle: Text(
              user?.email ?? "",
              style: TextStyle(
                  fontSize: height * 0.016,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
            trailing: SizedBox(
              width: width * 0.2,
              child: Row(
                children: [
                  Expanded(
                    child: Text(AppStrings.enable..capitalizeFirst),
                  ),
                  Expanded(
                    child: Text(AppStrings.disable..capitalizeFirst),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
