import 'package:prism/Screen/Detail/detail.dart';
import 'package:prism/Utils/colors.dart';
import 'package:prism/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyHomePage extends GetView<MyDrawerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: MenuScreen(),
        mainScreen: MainScreen(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        backgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width *
            (ZoomDrawer(
              mainScreen: MainScreen(),
              menuScreen: MenuScreen(),
            ).isRtl ? .45 : 0.65),
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/images/output-onlinepngtools.png")),
                    // Text(
                    //   "Prism".toUpperCase(),
                    //   style: TextStyle(
                    //     fontSize: 44,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    // ),
                    // Icon(
                    //   FontAwesomeIcons.caretUp,
                    //   size: 70,
                    // ),
                  ],
                ),
                // Text(
                //   "Surveyors".toUpperCase(),
                //   style: TextStyle(
                //     fontSize: 36,
                //     fontWeight: FontWeight.w900,
                //   ),
                // )
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("Name",style: TextStyle(color: Colors.grey),),
              leading: Icon(FontAwesomeIcons.user,color: Colors.grey),
            ),
            ListTile(
                title: Text("Email",style: TextStyle(color: Colors.grey),),
                leading: Icon(
                  Icons.mail,
                  color: Colors.grey
                )),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              title: Text("Logout",style: TextStyle(color: Colors.grey),),
              leading: Icon(Icons.logout,color: Colors.grey),
            ),
            // Spacer(),

                 IconButton(
                   
                   color: Colors.grey,
              onPressed: () {
                controller.toggleDrawerClose();
              },
              icon: Icon(Icons.close),
            ),
       
          ],
          // style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: appColor,
        elevation: 1,
        leading: RawMaterialButton(

            onPressed: controller.toggleDrawer,
            child: Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            )),
        title: Text(
          "Hello...!\nNabeel".toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 27),
              // decoration: BoxDecoration(
              //     boxShadow: [
              //       BoxShadow(
              //           offset: Offset(3, 5),
              //           blurRadius: 10,
              //           color: Color.fromARGB(157, 143, 229, 251))
              //     ],
              //     gradient: LinearGradient(colors: [
              //       Color.fromRGBO(143, 229, 251, 1),
              //       Color.fromARGB(153, 143, 247, 251),
              //     ])),
              // child: Row(
              //   children: [
              //     RawMaterialButton(
              //         onPressed: controller.toggleDrawer,
              //         child: Icon(
              //           Icons.more_vert_outlined,
              //           color: Colors.grey,
              //         )),
              //     Text(
              //       "Hello...\nNabeel".toUpperCase(),
              //       style: TextStyle(
              //           color: Colors.grey, fontWeight: FontWeight.w900),
              //     ),
              //   ],
              // ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 18,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage()));
                    },
                    child: Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: appColor),
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0,
                                            color: Colors.white24))),
                                child:
                                    Icon(Icons.autorenew, color: Colors.white),
                              ),
                              title: Text(
                                "Introduction to Driving",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                              subtitle: Row(
                                children: <Widget>[
                                  Icon(Icons.linear_scale,
                                      color: Colors.yellowAccent),
                                  Text(" Intermediate",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white, size: 30.0)),
                        )),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }

  void toggleDrawerClose() {
    zoomDrawerController.close!();
  }
}
