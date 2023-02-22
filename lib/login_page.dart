
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/sample_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailCtrl=TextEditingController();
  var passCtrl=TextEditingController();
  double height = 0;

  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [

          Expanded( //<-- Expanded widget
            child: Container(
              constraints: const BoxConstraints(maxWidth: 21),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Login to your account',
                      style: GoogleFonts.inter(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const SizedBox(
                   // height:height*0.2,
                  //  width: width*0.2,
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      //...
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    //...
                  ),
                  const SizedBox(height: 25),
                  Row(
                    //...
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SamplePage()));
                    },
                    child: Text("Login"),
                    //...
                  ),
                  const SizedBox(height: 15),
                  // TextButton(
                  //   //...
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
