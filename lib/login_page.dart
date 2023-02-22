import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/extention_function.dart';
import 'package:web/sample_page.dart';
import 'package:web/utiils/utils.page.dart';
import 'package:web/values/app_assets.dart';
import 'package:web/values/app_strings.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const String id = "loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  double height = 0;
  double width = 0;


  validLogin() {
    var email = emailCtrl.text.trim().toString();
    var pass = passCtrl.text.trim().toString();
    if (email.isEmpty) {
      Utils.showSnackBar(AppStrings.emailEmpty, context, Colors.red);
      return false;
    } else if (emailCtrl.text.isValidEmail(emailCtrl.text) == false) {
      Utils.showSnackBar(AppStrings.emailBadlyFormated, context, Colors.red);
      return false;
    } else if (pass.isEmpty) {
      Utils.showSnackBar(AppStrings.passEmpty, context, Colors.red);
      return false;
    } else if (pass.length <= 8) {
      Utils.showSnackBar(AppStrings.lengthPass, context, Colors.red);
      return false;
    } else if (pass.validateStructure(pass) == false) {
      Utils.showSnackBar(AppStrings.passCombineError, context, Colors.red);
      return false;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SamplePage(),
        ),
      );
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: width> 480 ? Row(
        children: [
          Container(
            height: height,
            width: width*0.5,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              // image: const DecorationImage(
              //   image: AssetImage("assets/images/buildEzi.png"),
              //   fit: BoxFit.cover,
              // )
            ),
            child: Image.asset(
              AppAssets.buildEziIcon,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            width: width*0.5,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: height*0.02, horizontal: width*0.03),
              child: Container(
                constraints:  BoxConstraints(maxWidth: width*0.01),
                padding:  EdgeInsets.symmetric(horizontal: width*0.015),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      // child: Image.asset(
                        AppAssets.buildEziPngIcon,
                        fit: BoxFit.fitWidth,
                      ),
                      child: Image.asset('assets/images/build_ezi_logo.png',),
                    ),

                    const SizedBox(height: 8),

                      Container(
                         height: height*0.5,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(10),
                           ),

                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width*0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: height*0.05),
                              Center(
                                child: Text(
                                  AppStrings.loginTitle,
                                  style: GoogleFonts.inter(
                                    fontSize: height*0.025,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: height*0.05),

                              Text("Enter Email",
                                style: TextStyle(fontSize: height*0.02),),
                              SizedBox(
                                height: height*0.08,
                    Text(AppStrings.enterEmailLabel.capitalize()),

                                child: TextField(
                                  controller: emailCtrl,
                                  decoration:
                                  const InputDecoration(border: OutlineInputBorder()),

                                  //...
                                ),
                              ),
                              SizedBox(height: height*0.02),

                              Text("Enter Password",
                                style: TextStyle(fontSize: height*0.02),),
                              SizedBox(
                                height: height*0.08,
                                child: TextField(
                                  controller: passCtrl,
                                  obscureText: true,
                                  decoration:
                                  const InputDecoration(border: OutlineInputBorder()),
                                  //...
                                ),
                              ),

                              SizedBox(height: height*0.03),
                              InkWell(
                                onTap: () {
                                  validLogin();
                                },
                                child: Container(
                                  height: height * 0.06,

                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue.withOpacity(0.2),
                                          const Color.fromARGB(255, 29, 221, 163)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child:  Center(
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: height*0.02,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        )
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
      ) : Container(),
    );
  }
}
