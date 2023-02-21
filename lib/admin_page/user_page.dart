import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
static const String id="userPage";
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("user"),
    );
    return const Scaffold(body: Center(child: Text("user"),),);
  }
}
