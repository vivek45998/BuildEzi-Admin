import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/admin_page/project/prject_list_widget.dart';
import 'package:web/model/project_model.dart';

import '../../values/app_assets.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  var projectData = <ProjectDetail>[];
  var searchProjectList = <ProjectDetail>[];
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
   var projectDatak= await rootBundle.loadString(AppAssets.projectJson);
    var list = List<ProjectDetail>.from(
        jsonDecode(projectDatak).map((x) => ProjectDetail.fromJson(x)));
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
          if (element.status?.toLowerCase().contains(value.toLowerCase()) ==
              true) {
            print(element.status);
            searchProjectList.add(element);
            setState(() {});
          }
        }
      }
      if (dropdownValue == "PROJECT NAME") {
        searchProjectList.clear();
        for (var element in projectData) {
          if (element.projectName?.toLowerCase()
              .contains(value.toLowerCase()) ==
              true) {
            print(element.projectName);
            searchProjectList.add(element);
            setState(() {});
          }
        }
      }
      if (dropdownValue == "NAME") {
       searchProjectList.clear();

        for (var element in projectData) {
          if (element.clientName?.toLowerCase().contains(value.toLowerCase()) ==
              true) {
            print(element.clientName);
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
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.08,
            child: Padding(
              padding:
              EdgeInsets.only(left: height * 0.016, right: height * 0.016),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: width * 0.035,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width,
                          child: Center(
                            child: TextField(
                              controller: searchController,
                              onChanged: (value) {
                                filterUserList(value);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
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
