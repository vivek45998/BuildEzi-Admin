// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:web/model/user_data.dart';

import '../../values/app_assets.dart';

class UserDetail extends StatefulWidget {
  UserDetail({Key? key, this.user}) : super(key: key);
  UserData? user;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
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
                     
                      child: CircleAvatar(child: Image.network(widget.user?.image ?? '')),
                        
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text("First name"),
                      Text(widget.user?.firstName ?? '')
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
