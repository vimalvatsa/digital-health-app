import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../global/controllers/global_controller.dart';


class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({Key? key}) : super(key: key);

  @override
  _PrescriptionPageState createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  final GlobalController _globalController = Get.find<GlobalController>();
  // Define variables to hold patient information, prescription history, and contact information
  String patientName = '';
  String patientAge = '';
  String patientGender = '';
  String prescriptionHistory = '';
  String contactInfo = '';

  // Define variables to hold medication information
  String medicationName = '';
  String medicationDosage = '';
  String medicationFrequency = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MedRecConstants.mainNavBarColor,
        elevation: 0,
        title: Text('Prescription Page'),
      ),
      body: SingleChildScrollView(
        future: _globalController.getPrescription(
          _globalController.auth.currentUser
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color:MedRecConstants.mainColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Prescription Information',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children[
                                Text(
                                  'Patient Name :',
                                  style: GoogleFonts.poppins(
                                    color: MedRecConstants.accentColour,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    '${_globalController.name}',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontsize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                           Row(
                            children: [
                              Text(
                                'Age : ',
                                style: GoogleFonts.poppins(
                                  color: MedRecConstants.accentColour,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${_globalController.age.value}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                           Row(
                            children: [
                              Text(
                                'Gender : ',
                                style: GoogleFonts.poppins(
                                  color: MedRecConstants.accentColour,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${_globalController.gender.value}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text('Prescription History:',
                              style: GoogleFonts.poppins(
                                color: MedRecConstants.accentColour,
                              ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('Date: 01/01/2022'),
                          Text('Doctor: Dr. Smith'),
                          Text('Medication: Aspirin'),
                          SizedBox(height: 15.0),
                          Text(
                            'Contact Information',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              Text(
                                'Phone number : ',
                                style: GoogleFonts.poppins(
                                  color: MedRecConstants.accentColour,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${_globalController.phonenum.value.toString()}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Medication Information',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20.0),
                          Text('Name: Aspirin'),
                          Text('Dosage: 500mg'),
                          Text('Frequency: Twice daily'),
                          SizedBox(height: 30.0),
                          ElevatedButton(
                              onPressed: () async {
                                await _globalController.auth.signOut();
                                _globalController.user == null;
                                Navigator.of(context).pushNamed('/loginpage');
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 15.0),
                                  backgroundColor:
                                      MedRecConstants.accentColour,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)))),
                              child: Text('Logout'))
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}

class Get {
}