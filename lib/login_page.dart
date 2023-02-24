import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/extention_function.dart';
import 'package:web/sample_page.dart';
import 'package:web/utiils/utils.page.dart';
import 'package:web/values/app_assets.dart';
import 'package:web/values/app_colors.dart';
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

        body: width > 480
            ? Row(children: [
                Container(
                  height: height,
                  width: width * 0.5,
                  decoration: const BoxDecoration(
                   // color: Colors.blue.withOpacity(0.2),
                    image: DecorationImage(
                      image: AssetImage(AppAssets.splashBackgroundImage),
                      fit: BoxFit.cover,
                    )
                  ),
                  child: Image.asset(
                    AppAssets.buildEziIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                    color: AppColor.loginBackground,
                    width: width * 0.5,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.02, horizontal: width * 0.03),
                        child: Container(
                            constraints: BoxConstraints(maxWidth: width * 0.01),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.015),
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
                                  Container(
                                      // height: height * 0.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 6,
                                            offset:
                                                Offset(0, 0), // Shadow position
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.05),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: height * 0.04),
                                                Center(
                                                  child: Text(
                                                    AppStrings.loginTitle,
                                                    style: GoogleFonts.inter(
                                                      fontSize: height * 0.025,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.03),
                                                Text(
                                                  AppStrings.enterEmailLabel,
                                                  style: TextStyle(
                                                      fontSize: height * 0.02),
                                                ),
                                                SizedBox(
                                                  height: height * 0.08,
                                                  child: TextField(
                                                    controller: emailCtrl,

                                                    decoration:
                                                         const InputDecoration(
                                                            hintText: AppStrings.email,
                                                            border:
                                                                OutlineInputBorder()),
                                                    style: TextStyle(fontSize: height*0.02),

                                                    //...
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.02),
                                                Text(
                                                  AppStrings.enterPasswordLabel,
                                                  style: TextStyle(
                                                      fontSize: height * 0.02),
                                                ),
                                                SizedBox(
                                                  height: height * 0.08,
                                                  child: TextField(
                                                    controller: passCtrl,
                                                    obscureText: true,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: AppStrings.password,
                                                            border:
                                                                OutlineInputBorder()),
                                                    style: TextStyle(fontSize: height*0.02),
                                                    //...
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.03),
                                                InkWell(
                                                  onTap: () {
                                                   // validLogin();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => const SamplePage(),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: height * 0.06,
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Colors.blue
                                                                .withOpacity(
                                                                    0.2),
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                29,
                                                                221,
                                                                163)
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                        child: Text(
                                                      AppStrings.login,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize:
                                                              height * 0.02,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.04),
                                              ])))
                                ]))))
              ])
            : SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: const BoxDecoration(
                      // color: Colors.blue.withOpacity(0.2),
                        image: DecorationImage(
                          image: AssetImage(AppAssets.splashBackgroundImage),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Image.asset(
                      AppAssets.buildEziIcon,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                      color: AppColor.loginBackground,
                      width: width,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.03),
                          child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: width * 0.01),
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.015),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        AppAssets.buildEziPngIcon,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                        // height: height * 0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 6,
                                              offset: Offset(
                                                  0, 0), // Shadow position
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.05),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: height * 0.04),
                                                  Center(
                                                    child: Text(
                                                      AppStrings.loginTitle,
                                                      style: GoogleFonts.inter(
                                                        fontSize:
                                                            height * 0.025,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.03),
                                                  Text(
                                                    AppStrings.enterEmailLabel,
                                                    style: TextStyle(
                                                        fontSize:
                                                            height * 0.02),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.08,
                                                    child: TextField(
                                                      controller: emailCtrl,
                                                      decoration:
                                                          const InputDecoration(
                                                            hintText: AppStrings.email,
                                                              border:
                                                                  OutlineInputBorder()),
                                                      style: TextStyle(fontSize: height*0.02),

                                                      //...
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.02),
                                                  Text(
                                                    AppStrings
                                                        .enterPasswordLabel,
                                                    style: TextStyle(
                                                        fontSize:
                                                            height * 0.02),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.08,
                                                    child: TextField(
                                                      controller: passCtrl,
                                                      obscureText: true,
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText: AppStrings.password,
                                                              border:
                                                                  OutlineInputBorder()),
                                                      style: TextStyle(fontSize: height*0.02),
                                                      //...
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.03),
                                                  InkWell(
                                                    onTap: () {
                                                      validLogin();
                                                    },
                                                    child: Container(
                                                      height: height * 0.06,
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Colors.blue
                                                                  .withOpacity(
                                                                      0.2),
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  29,
                                                                  221,
                                                                  163)
                                                            ],
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Center(
                                                          child: Text(
                                                        "Login",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                height * 0.02,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.04),
                                                ])))
                                  ])

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
                              )))
                ]),
              ));
  }
}
