import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web/login_page.dart';
import 'package:web/sample_page.dart';
import 'admin_page/dashboard.dart';
import 'admin_page/project.dart';
import 'admin_page/user_page.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        DashboardPage.id: (context) => const DashboardPage(),
        SamplePage.id: (context) => const SamplePage(),
        ProjectPage.id: (context) => ProjectPage(),
        UserPage.id: (context) => const UserPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        //primarySwatch:  Colors.blueGrey,
      ),
      body:   LoginPage(),
    );
  }
}
