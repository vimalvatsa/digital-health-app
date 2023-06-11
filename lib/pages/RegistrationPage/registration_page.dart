import 'package:flutter/material.dart';
import 'package:flutter_app_testing/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/controllers/global_controller.dart';

String dobInString = '';
DateTime dob = DateTime.now();
bool isDateSelected = false;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final TextEditingController _nameTextEditingController =
      TextEditingController();

  final TextEditingController _phonenumTextEditingController =
      TextEditingController();

  final TextEditingController _addressTextEditingController =
      TextEditingController();
  final TextEditingController _ageTextEditingController =
      TextEditingController();
  final RegistrationPageController _registrationPageController =
      Get.find<RegistrationPageController>();

  final GlobalController _globalController = Get.find<GlobalController>();

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
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _nameTextEditingController,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFADA4A5),
                          fontSize: 14,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: tr('Name'),
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _emailTextEditingController,
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
                            hintText: 'Enter Email',
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
                        controller: _passwordTextEditingController,
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
                            hintText: 'Enter password',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _phonenumTextEditingController,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                        cursorColor: Colors.white,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Phone number',
                          counterText: "",
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          hintText: 'Enter Contact Number',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          final datePick = await showDatePicker(
                            context: context,
                            initialDate: dob,
                            firstDate: new DateTime(1900),
                            lastDate:
                                new DateTime.now().add(Duration(days: 365)),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        Colors.black, // header background color
                                    onPrimary:
                                        Colors.white, // header text color
                                    onSurface: Colors.black, // body text color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary:
                                          Colors.black, // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (datePick != null && datePick != dob) {
                            setState(() {
                              dob = datePick;
                              isDateSelected = true;

                              // put it here
                              dobInString =
                                  "${dob.day}/${dob.month}/${dob.year}";
                              print(dobInString); // 08/14/2019
                            });
                          }
                          setState(() {});
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0XFF79397E),
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: (dobInString != '')
                              ? Text(
                                  dobInString,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                )
                              : Text("Enter your Date of birth",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 300.0,
                          ),
                          child: TextField(
                            controller: _addressTextEditingController,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Address',
                              labelStyle: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                              hintText: 'Enter your address here',
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 300.0,
                          ),
                          child: TextField(
                            controller: _ageTextEditingController,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Age',
                              labelStyle: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                              hintText: 'Enter your age here',
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
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
                              backgroundColor: Color(0XFF79397E)),
                          child:
                              _registrationPageController.loading.value == false
                                  ? Text('Register')
                                  : Container(
                                      width: 20.0,
                                      child: CircularProgressIndicator(
                                        color: MedRecConstants.accentColour,
                                      )),
                          onPressed: () async {
                            if (_registrationPageController.loading.value) {
                              return;
                            }
                            if (_emailTextEditingController.text.isEmpty ||
                                _passwordTextEditingController.text.isEmpty ||
                                _phonenumTextEditingController.text.isEmpty ||
                                _addressTextEditingController.text.isEmpty ||
                                _ageTextEditingController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Either Title or Password or Phone number or address or age is empty'),
                                ),
                              );
                            }
                            final check =
                                await _registrationPageController.signUp(
                                    _emailTextEditingController.text,
                                    _passwordTextEditingController.text,
                                    _nameTextEditingController.text,
                                    _addressTextEditingController.text,
                                    _phonenumTextEditingController.text,
                                    _ageTextEditingController.text.isEmpty,
                                    _globalController.user,
                                    _globalController.auth,
                                    context);
                            _globalController.name.value =
                                _nameTextEditingController.text.toString();
                            _globalController.email.value =
                                _emailTextEditingController.text.toString();
                            _globalController.address.value =
                                _addressTextEditingController.text.toString();
                            _globalController.phonenum.value =
                                _phonenumTextEditingController.text.toString();
                            _globalController.age.value =
                                _ageTextEditingController.text.toString();
                            if (check) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/contacts');
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/loginpage');
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 3.0,
                            shape: StadiumBorder(),
                            backgroundColor: Color(0XFF79397E)),
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
