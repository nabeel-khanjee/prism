import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prism/Global/global.dart';
import 'package:prism/Utils/colors.dart';
import 'package:prism/Widgets/app_button.dart';
import 'package:prism/Widgets/app_input_field.dart';
import 'package:prism/Widgets/success_dialog.dart';

class VerificationOutcomes extends StatefulWidget {
  // final surid;
  const VerificationOutcomes({
    Key? key,

    // @required this.surid
  }) : super(key: key);

  @override
  _VerificationOutcomesState createState() => _VerificationOutcomesState();
}

class _VerificationOutcomesState extends State<VerificationOutcomes> {
  var checkBoxValue = false;
  var checkBoxValue1 = false;

  var status;
  var clickstatus;
  var test = true;
  // bool _isVisible = Surveyor_list[0].reportStatus == "Positive" ? true : false;
  // bool _Visible = Surveyor_list[0].reportStatus == "Negative" ? true : false;
  bool _isVisible = false;
  bool _Visible = false;

  final _surveyorname = TextEditingController();
  final _comments = TextEditingController();
  final _remarks = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? dropdownvalue;
  String? dropdownvalue1;

  // Future<GetVerificationOutcome>? verificationOuthcomeData;
  @override
  void initState() {
    // TODO: implement initState
    // dropdownvalue = Surveyor_list[0].reportStatus == "Negative"
    //     ? positive[0]
    //     : Surveyor_list[0].comments;
    // dropdownvalue1 = Surveyor_list[0].reportStatus == "Positive"
    //     ? negative[0]
    // : Surveyor_list[0].comments;

    super.initState();
  }

  var positive = [
    "Confirmation about the Applicant received at the given address",
    "Appicant contact number was not reachable / Poweered off",
    'Appartment floor was incorrectly mentioned',
    'Address plate was affixed on the main gate',
    'Satisfactory',
    "The Applicant was not known to be the neighbour",
    "Neighbours confirmation about applicant's residence was not satisfactory",
    'Applicant contact number provided was incorrect',
    'Appartment / Flat number was found incorrect',
    'Address plate was not affixed on the main gate',
  ];
  var negative = [
    "Applicant was not found residing at the given address",
    "Appicant contact number was not reachable / Poweered off",
    "it was inform that the applicant's used to live at the given address However, he has shifted his residence",
    'Applicant refused to conduct the verification',
    'Unsatisfactory',
    'Applicant contact number provided was incorrect',
    'Appartment / Flat number was found incorrect',
    'Applicant has shifted from the given address',
    'The provided address was incomplete, could not located',
    'Applicant address was found closed',
    'Appartment / Complex name was incorrect',
    'Confirmation of residence ontained at the given address. However, it was informed that the applicant is not present in the city',
  ];
  void waittosendData() async {
    await Future.delayed(const Duration(seconds: 1), () {
      if (success == 'true') {
        Navigator.pop(context);
        clickstatus = true;
        showSucessDialog(context);
      } else if (success == 'error') {
        clickstatus = true;

        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        waittosendData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  var width=  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: appColor,
        title: const Text(
          "Verification Outcome",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(
                  color: const Color.fromARGB(51, 67, 107, 112),
                  blurRadius: 20.0,
                  offset: const Offset(0, 10)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppInputFIeld(
                      controller: _surveyorname,
                      obscureText: false,
                      initialValue: "initialValue",
                      label: "Surveyor",
                      fieldIcon: FontAwesomeIcons.user),

                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200))),

                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(20),
                    //   border: Border.all(color: appColor),
                    // ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        FaIcon(FontAwesomeIcons.checkDouble, color: appColor),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: 70,
                            child: Text(
                              "Report Status:",
                              maxLines: 2,
                              style: TextStyle(color: appColor),
                            )),
                        const Spacer(),
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                            // value: Surveyor_list[0].reportStatus == "Positive"
                            //     ? test
                            //     : checkBoxValue,
                            value: checkBoxValue,

                            activeColor: appColor,

                            // border: BorderSide(color: Colors.white),
                            focusColor: appColor,
                            onChanged: (bool? value) {
                              setState(() {
                                checkBoxValue = value!;
                                // Surveyor_list[0].reportStatus = "Positive";
                                checkBoxValue1 = false;
                                _isVisible = true;
                                _Visible = false;
                                status = "Positive";
                              });
                            },
                          ),
                        ),
                        Text(
                          "Positive",
                          style: TextStyle(color: appColor),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                            // value: Surveyor_list[0].reportStatus == "Negative"
                            // ? test
                            // : checkBoxValue1,
                            value: checkBoxValue1,

                            activeColor: appColor,

                            // border: BorderSide(color: Colors.white),
                            focusColor: appColor,
                            onChanged: (bool ?value) {
                              setState(() {
                                checkBoxValue1 = value!;
                                // Surveyor_list[0].reportStatus = "Negative";
                                checkBoxValue = false;
                                _Visible = true;
                                _isVisible = false;
                                status = "Negative";
                              });
                            },
                          ),
                        ),
                        Text(
                          "Negative",
                          style: TextStyle(color: appColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 60,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            // width: MediaQuery.of(context).size.width / 1.06,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade200))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButtonHideUnderline(
                                child: FittedBox(
                                  child: DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: const Padding(
                                      padding: EdgeInsets.only(left: 120),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),

                                    // Array list of items
                                    items: positive.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 40,
                          child: Container(
                              color: Colors.white,
                              child: Text(
                                'Comments',
                                style: TextStyle(color: appColor),
                              )),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _Visible,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 60,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade200))),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: DropdownButtonHideUnderline(
                                  child: FittedBox(
                                    child: DropdownButton(
                                      borderRadius: BorderRadius.circular(10),
                                      // Initial Value
                                      value: dropdownvalue1,

                                      // Down Arrow Icon
                                      icon: const Padding(
                                        padding: EdgeInsets.only(left: 120),
                                        child: Icon(Icons.keyboard_arrow_down),
                                      ),

                                      // Array list of items
                                      items: negative.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue1 = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 40,
                          child: Container(
                              color: Colors.white,
                              child: Text(
                                'Comments',
                                style: TextStyle(color: appColor),
                              )),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextFormField(
                  //   controller: _comments,
                  //   decoration:  InputDecoration(
                  //       labelText: 'Comments',
                  //       hintText: Surveyor_list[0].comments,
                  //       border: const OutlineInputBorder(),
                  //       enabledBorder: const OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: appColor,
                  //         ),
                  //       )),
                  // ),

                  AppInputFIeld(
                      controller: _remarks,
                      obscureText: false,
                      initialValue: "initialValue",
                      label: "Remarks",
                      fieldIcon: FontAwesomeIcons.outdent),

                  AppButton(
                      width: width,
                      opTap: () {},
                      buttonName: "submit".toUpperCase())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
