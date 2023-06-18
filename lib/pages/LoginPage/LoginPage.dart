import 'package:flutter/material.dart';
import 'package:flutter_app_testing/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_app_testing/pages/RegistrationPage/controllers/registration_page_controller.dart';
import '../../global/controllers/global_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginemailTextEditingController =
      TextEditingController();

  final TextEditingController _loginpasswordTextEditingController =
      TextEditingController();
  // final LoginPageController _loginPageController =
  // Get.put(LoginPageController());

  final GlobalController _globalController = Get.find<GlobalController>();
  final RegisterationPageController _registerationPageController =
      Get.find<RegisterationPageController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: MedRecConstants.mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240.0,
              height: 240.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              )),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _loginemailTextEditingController,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFADA4A5),
                      fontSize: 14,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: tr('Email'),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: tr('Enter Email'),
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    obscureText: true,
                    controller: _loginpasswordTextEditingController,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFADA4A5),
                      fontSize: 14,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: tr('Password'),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: tr('Enter password'),
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 3.0,
                            shape: StadiumBorder(),
                            backgroundColor: Colors.black),
                        child:
                            _registrationPageController.loading.value == false
                                ? Text(
                                    tr('Login'),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )
                                : CircularProgressIndicator(),
                        onPressed: () async {
                          if (_registrationPageController.loading.value) {
                            return;
                          }
                          if (_loginemailTextEditingController.text.isEmpty ||
                              _loginpasswordTextEditingController
                                  .text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Either Title or Password is empty'),
                              ),
                            );

                            var res = await _registrationPageController.login(
                                _loginemailTextEditingController.text,
                                _loginpasswordTextEditingController.text,
                                _globalController.auth,
                                _globalController.user,
                                context);
                            if (res) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            }
                          }
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 3.0,
                          shape: StadiumBorder(),
                          backgroundColor: Colors.black),
                      child: Text(
                        tr('Register'),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).pushReplacementNamed('/');
                      }),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () async {
                    await _registrationPageController.forgotPassword(
                        _globalController.auth,
                        _globalController.user,
                        context);
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    )));
  }
}
