import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter_app_testing/global/controllers/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_testing/pages/RegistrationPage/controllers/registration_page_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var usersRef = FirebaseFirestore.instance.collection('users');

  var phonenum = "".obs;
  var dobdate = "".obs;
  var address = "".obs;

  var name = "".obs;
  var email = "".obs;
  var age = "".obs;
  var labelText = "".obs;

  Future<void> setProfile(
      usersRef, User? user, RegistrationPageController controller) async {
    await usersRef.doc(user?.email).set({
      "Name": name.value,
      "Contact": phonenum.value,
      "DOB": dobdate.value,
      "Address": address.value,
      "Age": age.value,
    }, SetOptions(merge: true));
  }

  Future<void> getProfile(usersRef, User? user) async {
    var temp = await usersRef.doc(user?.email).get();
    if (temp.exists) {
      var data = temp.data() as Map<String, dynamic>;
      if (data["Name"] == null) {
        return;
      }
      name.value = data["Name"];
      phonenum.value = data["Contact"];
      dobdate.value = data["DOB"];
      address.value = data["Address"];
      age.value = data["Age"];
    }
  }
}
