import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/admin_page/user/user_page.dart';
import 'package:web/extention_function.dart';
import 'package:web/model/user_data.dart';
import 'package:web/values/app_assets.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var userData = <UserData>[];

  @override
  void initState() {
    super.initState();
    readJsonUserList();
  }

  readJsonUserList() async {
    var countryData = await rootBundle.loadString(AppAssets.userJson);
    var list = List<UserData>.from(
        jsonDecode(countryData).map((x) => UserData.fromJson(x)));
    userData.clear();
    setState(() {
      userData.addAll(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          var user = userData[index];
          return UserItem(user:user);
        },
        itemCount: userData.length,
      ),
    );
    return const Scaffold(
      body: Center(
        child: Text("user"),
      ),
    );
  }
}
