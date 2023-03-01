import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/admin_page/project/prject_list_widget.dart';
import 'package:web/model/project_list_model.dart';

import '../../values/app_assets.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  var projectData = <ProjectList>[];
  var searchProjectList = <ProjectList>[];
  var type = "";
  var occupation = "";
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readJsonUserList();
  }

  String dropdownValue = 'PROJECT STATUS';
  var items = ['PROJECT NAME', 'PROJECT STATUS', "NAME"];

  readJsonUserList() async {
    var projectDatak = await rootBundle.loadString(AppAssets.projectJson);
    var list = List<ProjectList>.from(
        jsonDecode(projectDatak).map((x) => ProjectList.fromJson(x)));
    projectData.clear();
    searchProjectList.clear();
    setState(() {
      projectData.addAll(list);
      searchProjectList.addAll(list);
    });
  }

  filterUserList(String value) {
    if (value.isNotEmpty) {
      if (dropdownValue == "PROJECT STATUS") {
        searchProjectList.clear();

        for (var element in projectData) {
          if (element.data?.status
                  ?.toLowerCase()
                  .contains(value.toLowerCase()) ==
              true) {
            print(element.data?.status);
            searchProjectList.add(element);
            setState(() {});
          }
        }
      }
      if (dropdownValue == "PROJECT NAME") {
        searchProjectList.clear();
        for (var element in projectData) {
          if (element.data?.name?.toLowerCase().contains(value.toLowerCase()) ==
              true) {
            print(element.data?.name);
            searchProjectList.add(element);
            setState(() {});
          }
        }
      }
      if (dropdownValue == "NAME") {
        searchProjectList.clear();

        for (var element in projectData) {
          if (element.data?.builder?.firstName
                  ?.toLowerCase()
                  .contains(value.toLowerCase()) ==
              true) {
            print(element.data?.builder?.firstName);
            searchProjectList.add(element);
            setState(() {});
          }
        }
      }
    } else {
      searchProjectList.clear();
      searchProjectList.addAll(projectData);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
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
                    Icon(
                      Icons.search,
                      size: height * 0.045,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: width,
                        child: Center(
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              filterUserList(value);
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                border: InputBorder.none,
                                hintText: "Search"),
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
              var projectDetail = searchProjectList[index];
              return ProjectItem(projectDetail: projectDetail);
            },
            itemCount: searchProjectList.length,
          ),
        ],
      ),
    );
    return const Scaffold(
      body: Center(
        child: Text("user"),
      ),
    );
  }
}
