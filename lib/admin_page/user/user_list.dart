import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/admin_page/user/user_item.dart';
import 'package:web/model/user_data.dart';
import 'package:web/values/app_assets.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var userData = <UserData>[];
  var searchUserList = <UserData>[];
  var type = "";
  var occupation = "";
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readJsonUserList();
  }

  bool isEnabled = false;

  String dropdownValue = 'USER TYPE';
  var items = ['USER TYPE', 'OCCUPATION TYPE', "NAME"];

  readJsonUserList() async {
    var us = await rootBundle.loadString(AppAssets.userJson);
    var list =
        List<UserData>.from(jsonDecode(us).map((x) => UserData.fromJson(x)));
    userData.clear();
    setState(() {
      userData.addAll(list);
      searchUserList.addAll(list);
    });
  }

  filterUserList(String value) {
    if (value.isNotEmpty) {
      if (dropdownValue == "USER TYPE") {
        searchUserList.clear();

        for (var element in userData) {
          if (element.type?.toLowerCase().contains(value.toLowerCase()) ==
              true) {
            print(element.type);
            searchUserList.add(element);
            setState(() {});
          }
        }
      }
      if (dropdownValue == "OCCUPATION TYPE") {
        searchUserList.clear();
        for (var element in userData) {
          if (element.occupation?.name
                  ?.toLowerCase()
                  .contains(value.toLowerCase()) ==
              true) {
            print(element.occupation?.name);
            searchUserList.add(element);
            setState(() {});
          }
        }
      }
      if (dropdownValue == "NAME") {
        searchUserList.clear();

        for (var element in userData) {
          if (element.firstName?.toLowerCase().contains(value.toLowerCase()) ==
              true) {
            print(element.firstName);
            searchUserList.add(element);
            setState(() {});
          }
        }
      }
    } else {
      searchUserList.clear();
      searchUserList.addAll(userData);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: height * 0.016, right: height * 0.016),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isEnabled = true;
                        });
                      },
                      child: Icon(
                        Icons.search,
                        size: height * 0.045,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: width,
                        child: Center(
                          child: TextField(
                            //renabled: isEnabled,
                            //  showCursor: isEnabled,

                            controller: searchController,
                            onChanged: (value) {
                              filterUserList(value);
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              // labelText:"Search".capitalizeFirst,
                              label: Text("Search"),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DropdownButton(
                      // Initial Value
                      underline: const SizedBox(),
                      value: dropdownValue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              var user = searchUserList[index];
              return UserItem(user: user);
            },
            itemCount: searchUserList.length,
          ),
        ],
      ),
    );

  }
}
