import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/admin_page/user/mobile_and_web_layout_design/mobile_design.dart';
import 'package:web/admin_page/user/mobile_and_web_layout_design/web_dsign.dart';
import 'package:web/admin_page/user/user_detail_responsive/response_layout.dart';

import '../../../local_storage.dart';
import '../../../model/user_data.dart';


class LayoutPage extends StatefulWidget {
  LayoutPage({Key? key,this.user}) : super(key: key);
  UserData? user;
  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  UserData? user;
  @override
  initState() {
    // TODO: implement initState
    // html.window.onUnload.listen((event) async {
    //   print('Reloaded');
    //   // Navigator.pushNamed(context, RouterUrlName.userDetail);
    //   // Get.offNamed(RouterUrlName.samplePage);
    // });
    print('++++++++++++++++++++++++++++++++++++++++++++++++++++');
    super.initState();
    widget.user = Get.arguments;
    if (widget.user != null) {
      LocalStorage.saveData(LocalStorage.user, widget.user);
      LocalStorage.saveData(LocalStorage.isRefresh, true);
    } else {
      LocalStorage.saveData(LocalStorage.isRefresh, false);
    }
    userData();
    //print(user?.email);
  }

  userData() async {
    var data = LocalStorage.getData(LocalStorage.user);
    bool isRefresh = LocalStorage.getData(LocalStorage.isRefresh);
    //final u=jsonDecode(data);
    //  user=data;
    //  print("is=$isRefresh");
    if (isRefresh == true) {
      user = data;
      // LocalStorage.
    } else {
      var y = UserData.fromJson(data);
      user = y;
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
    return Scaffold(
      backgroundColor: Colors.cyanAccent.withOpacity(0.4),
      body: ResponsiveLayoutPage(
        mobileBody: MobileLayout(user:user),
        desktopBody: DesktopPage(user:user),
      ),
    );
  }
}
