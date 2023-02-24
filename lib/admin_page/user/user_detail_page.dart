// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/local_storage.dart';
import 'package:web/model/user_data.dart';
import 'package:web/route/router_url_name.dart';
import 'dart:html' as html;
import '../../values/app_assets.dart';

class UserDetail extends StatefulWidget {
  UserDetail({Key? key, this.user}) : super(key: key);
  UserData? user;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
   UserData ? user;
  @override
  initState() {
    // TODO: implement initState
    html.window.onUnload.listen((event) async {
      print('Reloaded');
     // Navigator.pushNamed(context, RouterUrlName.userDetail);
     // Get.offNamed(RouterUrlName.samplePage);
    });
    print('++++++++++++++++++++++++++++++++++++++++++++++++++++');
    super.initState();
   widget.user =Get.arguments;
   if(widget.user!=null){
     LocalStorage.saveData(LocalStorage.user, widget.user);
     LocalStorage.saveData(LocalStorage.isRefresh, true);
   }
    else{
      LocalStorage.saveData(LocalStorage.isRefresh, false);
    }
    userData();
   //print(user?.email);

  }

  userData() async {
     var data=LocalStorage.getData(LocalStorage.user);
     bool isRefresh=LocalStorage.getData(LocalStorage.isRefresh);
     //final u=jsonDecode(data);
     //  user=data;
     //  print("is=$isRefresh");
     if(isRefresh==true){
       user=data;
      // LocalStorage.
     }
     else{
       var y=UserData.fromJson(data);
       user=y;
     }
    setState(() {
    // user=
    });
  //  user=data;
    //user=UserData.fromJson(data);
    //print("assssssssss${y?.firstName}");
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
              ),
              child: Image.asset(
                AppAssets.buildEziIcon,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.2,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,

                      child: CircleAvatar(child: Image.network(user?.image ?? '')),

                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text("First name"),
                      Text(user?.firstName ?? '')
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
