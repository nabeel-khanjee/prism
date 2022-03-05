import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prism/Animation/FadeAnimation.dart';
import 'package:prism/Screen/Home/home.dart';
import 'package:prism/Widgets/app_button.dart';
import 'package:prism/Widgets/app_input_field.dart';
import 'package:location/location.dart';

Future<void> main() async {
  Get.put<MyDrawerController>(MyDrawerController());
 if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  
  runApp(MaterialApp(
    title: "Prism Surveyors (Pvt) Ltd.",
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    // theme: ThemeData(primarySwatch: appColor),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  Location location = Location();
  bool _loading = false;

  LocationData? _location;
  String? _error;

   getLocation() async {
    // setState(() {
    //   _error = null;
    //   _loading = true;
    // });
    try {
      final LocationData _locationResult = await location.getLocation();
      // setState(() {
      //   _location = _locationResult;
      //   _loading = false;
      // });
    } on PlatformException catch (err) {
      // setState(() {
      //   _error = err.code;
      //   _loading = false;
      // });
    }
  }



  @override
  void initState() {
    super.initState();
    getLocation();
    location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/loing_background.jpg'),
                    fit: BoxFit.cover,
                  )),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            4,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          2,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(51, 59, 99, 104),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                AppInputFIeld(
                                    fieldIcon: FontAwesomeIcons.user,
                                    controller: emailController,
                                    obscureText: false,
                                    initialValue: "Enter Email",
                                    label: "Email"),
                                AppInputFIeld(
                                    fieldIcon: FontAwesomeIcons.lock,
                                    controller: passwordController,
                                    obscureText: true,
                                    initialValue: "Enter Password",
                                    label: "Password"),

                                //   Container(
                                //     padding: EdgeInsets.all(8.0),
                                //     decoration: BoxDecoration(
                                //         border: Border(
                                //             bottom: BorderSide(
                                //                 color: Colors.grey[100]))),
                                //     child: TextFormField(

                                //       controller: emailController,
                                //       decoration: InputDecoration(

                                //           border: InputBorder.none,
                                //           hintText: "Email or Phone number",
                                //           hintStyle:
                                //               TextStyle(color: Colors.grey[400])),
                                //     ),
                                //   ),
                                //   Container(
                                //     padding: EdgeInsets.all(8.0),
                                //     child: TextFormField(

                                //       controller: passwordController,
                                //       decoration: InputDecoration(
                                //           border: InputBorder.none,
                                //           hintText: "Password",
                                //           hintStyle:
                                //               TextStyle(color: Colors.grey[400])),
                                //     ),
                                //   )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        2,
                        AppButton(
                          width:width,
                            opTap: () {
                              print(emailController.text);
                              print(passwordController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => MyHomePage())));
                            },
                            buttonName: "login".toUpperCase()),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
