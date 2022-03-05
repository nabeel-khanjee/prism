import 'dart:async';

import 'package:prism/Utils/colors.dart';
import 'package:prism/Widgets/app_button.dart';
import 'package:prism/Widgets/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prism/Widgets/success_dialog.dart';

class ApplicantDetails extends StatefulWidget {
  ApplicantDetails({Key? key}) : super(key: key);

  @override
  State<ApplicantDetails> createState() => _ApplicantDetailsState();
}

class _ApplicantDetailsState extends State<ApplicantDetails> {
  TextEditingController applicantName = TextEditingController();

  TextEditingController applicantContact = TextEditingController();
  DateTime selectedDate = DateTime.now();

  var _dob;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1965, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dob = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Applicant Details",
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: appColor,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(51, 67, 107, 112),
                      blurRadius: 20.0,
                      offset: Offset(0, 10)),
                ],
              ),
              child: Column(
                children: <Widget>[
                  AppInputFIeld(
                    fieldIcon: FontAwesomeIcons.user,
                    controller: applicantName,
                    initialValue: "Nabeel",
                    obscureText: false,
                    label: "Applicant Name",
                  ),
                  AppInputFIeld(
                    fieldIcon: FontAwesomeIcons.phone,
                    controller: applicantContact,
                    initialValue: "+92-000-0000000",
                    obscureText: false,
                    label: "Applicant Contact",
                  ),
                  Container(
                    padding: EdgeInsets.all(19),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Color.fromARGB(51, 67, 107, 112),
                      //       blurRadius: 20.0,
                      //       offset: Offset(0, 10)),
                      // ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date Of Birth",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.calendarCheck,
                              color: appColor,
                              size: width*.13,
                            ),
                              SizedBox(
                              width: width * 0.035,
                            ),
                          AppButton(
                            width: width*0.7,
                              opTap: () {
                                _selectDate(context);
                                setState(() {
                                  _dob =
                                      "$selectedDate.toLocal()}".split(' ')[0];
                                });
                              },
                              buttonName: _dob != null
                                  ? "$_dob".split(' ')[0]
                                  // : snapshot.data!.data![0].dob != null
                                  //     ? snapshot.data!.data![0].dob!
                                  : "Pick your date of birth".toUpperCase(),
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppButton(
                    width: width,
                    opTap: () {
                      print(applicantName.text);
                      print(applicantContact.text);
                      showSucessDialog(context);
                    },
                    buttonName: "Submit".toUpperCase(),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
