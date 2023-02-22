import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/extention_function.dart';
import 'package:web/sample_page.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);
static const String id="loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailCtrl = TextEditingController();

  var passCtrl = TextEditingController();

  double height = 0;

  double width = 0;

  @override
  bool _isChecked = false;

  validLogin() {
    var email = emailCtrl.text.trim().toString();
    var pass = passCtrl.text.trim().toString();
    if (email.isEmpty) {
      var snackBar = const SnackBar(
        content: Text('Please enter valid email.'),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Please enter valid input");
      return false;
    } else if (emailCtrl.text.isValidEmail(emailCtrl.text) == false) {
      var snackBar = const SnackBar(
        content: Text("The email address is badly formatted."),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("The email address is badly formatted.");
      return false;
    } else if (pass.isEmpty) {
      var snackBar = const SnackBar(
        content: Text("Please enter valid password"),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Please enter valid password");
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SamplePage()));
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                // image: const DecorationImage(
                //   image: AssetImage("assets/images/buildEzi.png"),
                //   fit: BoxFit.cover,
                // )
              ),
              child: Image.asset(
                'assets/images/buildEzi.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            //<-- Expanded widget
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 15),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Container(
                    //   height: height*0.2,
                    //   width: width,
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue.withOpacity(0.2),
                    //     // image: const DecorationImage(
                    //     //   image: AssetImage("assets/images/build_ezi_logo.png"),
                    //     //   fit: BoxFit.cover,
                    //     // )
                    //   ),
                    //   // child: Image.asset(
                    //   //   'assets/images/build_ezi_logo.png',
                    //   //   fit: BoxFit.fitWidth,
                    //   // ),
                    // ),
                    Center(
                      child: SvgPicture.asset("assets/images/build_ezi.svg"),
                    ),
                    // Text(
                    //   'Build Ezi',
                    //   style: GoogleFonts.inter(
                    //     fontSize: 17,
                    //     color: Colors.black,
                    //   ),
                    // ),
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
                    TextField(
                      controller: emailCtrl,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),

                      //...
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passCtrl,
                      obscureText: true,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      //...
                    ),
                    const SizedBox(height: 25),
                    Row(
                        //...
                        ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        validLogin();
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.2),
                                const Color.fromARGB(255, 29, 221, 163)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                            child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                        )),
                      ),
                    )
                    // TextButton(
                    //   style: ButtonStyle(
                    //
                    //   ),
                    //   onPressed: () {
                    //
                    //   },
                    //   child: const Text("Login"),
                    // ),
                    // const SizedBox(height: 15),
                    // TextButton(onPressed: () {  }, child: Text(),
                    //   //...
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
