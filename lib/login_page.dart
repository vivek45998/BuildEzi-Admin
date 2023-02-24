import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/extention_function.dart';
import 'package:web/local_storage.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/utiils/utils.page.dart';
import 'package:web/values/app_assets.dart';
import 'package:web/values/app_strings.dart';
import 'dart:html' as html;
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

  @override
  bool _isChecked = false;


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
    }

    // } else if (pass.length <= 8) {
    //   Utils.showSnackBar(AppStrings.lengthPass, context, Colors.red);
    //   return false;
    // } else if (pass.validateStructure(pass) == false) {
    //   Utils.showSnackBar(AppStrings.passCombineError, context, Colors.red);
    //   return false;
    // }
    else {
      LocalStorage.saveData(LocalStorage.email, email);
      Get.offAllNamed(RouterUrlName.samplePage);
      //GoRouter.of(context).go(RouterUrlName.samplePage);
      //GoRouter.of(context).pushReplacementNamed("samplePage");

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const SamplePage(),
      //   ),
      // );
      return true;
    }
  }
@override
  void initState() {

    super.initState();
    var email=LocalStorage.getData(LocalStorage.email);
    print('4====$email');
    html.window.onUnload.listen((event) async {
      print('Reloaded====$email');
      if(email!=null){
        Get.toNamed(RouterUrlName.samplePage);

      }
      // Navigator.pushNamed(context, RouterUrlName.userDetail);
      // Get.offNamed(RouterUrlName.samplePage);
    });
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
              ),
              child: Image.asset(
                AppAssets.buildEziIcon,
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
                    Center(
                      child: Image.asset(
                        AppAssets.buildEziPngIcon,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        AppStrings.loginTitle,
                        style: GoogleFonts.inter(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Text(AppStrings.enterEmailLabel),
                    TextField(
                      controller: emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),

                      //...
                    ),
                    const SizedBox(height: 20),
                    Text(AppStrings.enterPasswordLabel),
                    TextField(
                      controller: passCtrl,
                      keyboardType: TextInputType.visiblePassword,
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
                            AppStrings.login,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
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
