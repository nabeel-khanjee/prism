import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prism/Global/global.dart';
import 'package:prism/Utils/colors.dart';
import 'package:prism/Widgets/app_button.dart';
import 'package:video_player/video_player.dart';

class PhotoGraphs extends StatefulWidget {
  const PhotoGraphs({
    Key? key,
    // @required this.surid, @required this.formFormate
  }) : super(key: key);

  @override
  _PhotoGraphsState createState() => _PhotoGraphsState();
}

class _PhotoGraphsState extends State<PhotoGraphs> {
  Future<XFile?>? _pickVideo;

  File? imageFile1;
  File? imageFile2;
  File? imageFile3;
  File? imageFile4;
  File? imageFile5;
  File? imageFile6;
  File? imageFile7;
  File? imageFile8;
  File? imageFile9;

  var clickstatus = true;

  String? _retrieveDataError;

  _getFromCamera1() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile1 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery1() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile1 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera2() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile2 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery2() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile2 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera3() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile3 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery3() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile3 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera4() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile4 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery4() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile4 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera5() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile5 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery5() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile5 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera6() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile6 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery6() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile6 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera7() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile7 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery7() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile7 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera8() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile8 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery8() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile8 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera9() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile9 = File(pickedFile.path);
      });

      Navigator.pop(context);
    }
  }

  _getFromGallery9() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile9 = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  Future<void> _showChoiceDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery1();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera1();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog2(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery2();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera2();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog3(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery3();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera3();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog4(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery4();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera4();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog5(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery5();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera5();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog6(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery6();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera6();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog7(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery7();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera7();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog8(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery8();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera8();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialog9(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: appColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromGallery9();
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: appColor,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: appColor,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera9();
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: appColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void waittoaddImage() async {
    buildShowDialog(context);

    await Future.delayed(const Duration(seconds: 3), () {
      if (success == 'true') {
        clickstatus = true;

        Fluttertoast.showToast(
            msg: "Successfully Add Image.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: appColor,
            textColor: Colors.white,
            fontSize: 16.0);
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => Loginn()));
      } else if (success == 'error') {
        clickstatus = true;

        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: appColor,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        waittoaddImage();
      }
    });

    Navigator.pop(context);
  }

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  bool isVideo = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    // if (isVideo) {
    final XFile? file = await _picker.pickVideo(
        source: source, maxDuration: const Duration(seconds: 30));
    await _playVideo(file);
  }
  // }

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _disposeVideoController();
    // _toBeDisposed!.dispose();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    print("object");
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
      print("object1");
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return Container(
        height: 400,
        decoration: BoxDecoration(
            border: Border.all(color: appColor),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: const Text(
            'You have not yet picked a video',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (_controller != null) {
          _disposeVideoController();

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: appColor,
          centerTitle: true,
          title: const Text(
            "Gallery",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              
              color: Colors.white),
          ),
        ),
        // floatingActionButton: IconButton(

        //   color: appColor,
        //   onPressed: (){
        //         _onImageButtonPressed(ImageSource.camera,
        //                       context: context);

        // }, icon: Icon(FontAwesomeIcons.video)),

        floatingActionButton: MaterialButton(
          height: 60,
          minWidth: 60,
          onPressed: () {
            _onImageButtonPressed(ImageSource.camera, context: context);
          },
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          // onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: ((context) => MapScreen(
          //               currentLat: currentPosition!.latitude,
          //               currentLon: currentPosition!.longitude,
          //               endlocationLat: 24.911078,
          //               endLocationLon: 67.031039,
          //             )))),
          child: Icon(
            FontAwesomeIcons.video,
            color: appColor,
            // size: width * 0.15,
          ),
        ),
        body: Container(
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
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: Container(
                // height: MediaQuery.of(context).size.height / 1.25,
                child: Column(
                  children: [
                    Container(child: _previewVideo()),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 80,
                              height: 120,
                              child: Text(
                                'Image (1)',
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                          Container(
                            width: 120,
                            height: 120,
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox.fromSize(
                                        size: const Size.fromRadius(70),
                                        child: imageFile1 != null
                                            ? Image.file(
                                                imageFile1!,
                                                fit: BoxFit.fill,
                                              )
                                            :
                                            // (snapshot.data!.data![0]
                                            //             .image1 ==
                                            //         null)
                                            // ?
                                            Center(
                                                child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: appColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Center(
                                                        child: Text(
                                                            "Choose Image"))))
                                        // : Image.network(
                                        //     snapshot.data.data[0]
                                        //         .image1,
                                        //     fit: BoxFit.fill,
                                        //   ),
                                        )),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: appColor,
                                    child: InkWell(
                                      onTap: () {
                                        _showChoiceDialog1(context);
                                      },
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(),
                          // InkWell(
                          //   onTap: () {
                          //     // Api.Addimage(
                          //     //     imageFile1, widget.surid, 'addimageone');
                          //     waittoaddImage();
                          //   },
                          //   child: Container(
                          //     height: 30,
                          //     width: 50,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: appColor,
                          //     ),
                          //     child: const Center(
                          //         child: Text(
                          //       'Save',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //       ),
                          //     )),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 80,
                              height: 120,
                              child: Text(
                                'Image (2)',
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                          Container(
                            width: 120,
                            height: 120,
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox.fromSize(
                                        size: const Size.fromRadius(70),
                                        child: imageFile2 != null
                                            ? Image.file(
                                                imageFile2!,
                                                fit: BoxFit.fill,
                                              )
                                            :
                                            //  (snapshot.data!.data![0]
                                            //             .image2 ==
                                            //         null)
                                            // ?
                                            Center(
                                                child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: appColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Center(
                                                        child: Text(
                                                            "Choose Image"))))
                                        // : Image.network(
                                        //     snapshot.data!.data![0]
                                        //         .image2!,
                                        //     fit: BoxFit.fill,
                                        //   ),
                                        )),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: appColor,
                                    child: InkWell(
                                      onTap: () {
                                        _showChoiceDialog2(context);
                                      },
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(),
                          // InkWell(
                          //   onTap: () {
                          //     // Api.Addimage(
                          //     //     imageFile2, widget.surid, 'addimagetwo');
                          //     waittoaddImage();
                          //   },
                          //   child: Container(
                          //     height: 30,
                          //     width: 50,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: appColor,
                          //     ),
                          //     child: const Center(
                          //         child: Text(
                          //       'Save',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //       ),
                          //     )),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 80,
                              height: 120,
                              child: Text(
                                'Image (3)',
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                          Container(
                            width: 120,
                            height: 120,
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox.fromSize(
                                        size: const Size.fromRadius(70),
                                        child: imageFile3 != null
                                            ? Image.file(
                                                imageFile3!,
                                                fit: BoxFit.fill,
                                              )
                                            :
                                            //  (snapshot.data!.data![0]
                                            //             .image3 ==
                                            //         null)
                                            //     ?
                                            Center(
                                                child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: appColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Center(
                                                        child: Text(
                                                            "Choose Image"))))
                                        // : Image.network(
                                        //     snapshot.data!.data![0]
                                        //         .image3!,
                                        //     fit: BoxFit.fill,
                                        //   ),
                                        )),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: appColor,
                                    child: InkWell(
                                      onTap: () {
                                        _showChoiceDialog3(context);
                                      },
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(),
                          // InkWell(
                          //   onTap: () {
                          //     // Api.Addimage(imageFile3, widget.surid,
                          //     //     'addimagethree');
                          //     waittoaddImage();
                          //   },
                          //   child: Container(
                          //     height: 30,
                          //     width: 50,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: appColor,
                          //     ),
                          //     child: const Center(
                          //         child: Text(
                          //       'Save',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //       ),
                          //     )),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // if (widget.formFormate == "1")
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 80,
                                height: 120,
                                child: Text(
                                  'Image (4)',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox.fromSize(
                                          size: const Size.fromRadius(70),
                                          child: imageFile4 != null
                                              ? Image.file(
                                                  imageFile4!,
                                                  fit: BoxFit.fill,
                                                )
                                              :
                                              // (snapshot.data!.data![0]
                                              //             .image4 ==
                                              //         null)
                                              //     ?
                                              Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: appColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Center(
                                                          child: Text(
                                                              "Choose Image"))))
                                          // : Image.network(
                                          //     snapshot.data!
                                          //         .data![0].image4!,
                                          //     fit: BoxFit.fill,
                                          //   ),
                                          )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: appColor,
                                      child: InkWell(
                                        onTap: () {
                                          _showChoiceDialog4(context);
                                        },
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Spacer(),
                            // InkWell(
                            //   onTap: () {
                            //     // Api.Addimage(imageFile4, widget.surid,
                            //     //     'addimagefour');
                            //     waittoaddImage();
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: appColor,
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //       ),
                            //     )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 80,
                                height: 120,
                                child: Text(
                                  'Image (5)',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox.fromSize(
                                          size: const Size.fromRadius(70),
                                          child: imageFile5 != null
                                              ? Image.file(
                                                  imageFile5!,
                                                  fit: BoxFit.fill,
                                                )
                                              :
                                              // (snapshot.data!.data![0]
                                              //             .image5 ==
                                              //         null)
                                              //     ?
                                              Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: appColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Center(
                                                          child: Text(
                                                              "Choose Image"))))
                                          // : Image.network(
                                          //     snapshot.data!
                                          //         .data![0].image5!,
                                          //     fit: BoxFit.fill,
                                          //   ),
                                          )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: appColor,
                                      child: InkWell(
                                        onTap: () {
                                          _showChoiceDialog5(context);
                                        },
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Spacer(),
                            // InkWell(
                            //   onTap: () {
                            //     // Api.Addimage(imageFile5, widget.surid,
                            //     //     'addimagefive');
                            //     waittoaddImage();
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: appColor,
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //       ),
                            //     )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 80,
                                height: 120,
                                child: Text(
                                  'Image (6)',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox.fromSize(
                                          size: const Size.fromRadius(70),
                                          child: imageFile6 != null
                                              ? Image.file(
                                                  imageFile6!,
                                                  fit: BoxFit.fill,
                                                )
                                              :
                                              //  (snapshot.data!.data![0]
                                              //             .image6 ==
                                              //         null)
                                              //     ?
                                              Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: appColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Center(
                                                          child: Text(
                                                              "Choose Image"))))
                                          // : Image.network(
                                          //     snapshot.data!
                                          //         .data![0].image6!,
                                          //     fit: BoxFit.fill,
                                          //   ),
                                          )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: appColor,
                                      child: InkWell(
                                        onTap: () {
                                          _showChoiceDialog6(context);
                                        },
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Spacer(),
                            // InkWell(
                            //   onTap: () {
                            //     // Api.Addimage(imageFile6, widget.surid,
                            //     //     'addimagesix');
                            //     waittoaddImage();
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: appColor,
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //       ),
                            //     )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 80,
                                height: 120,
                                child: Text(
                                  'Image (7)',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox.fromSize(
                                          size: const Size.fromRadius(70),
                                          child: imageFile7 != null
                                              ? Image.file(
                                                  imageFile7!,
                                                  fit: BoxFit.fill,
                                                )
                                              :
                                              // (snapshot.data!.data![0]
                                              //             .image7 ==
                                              //         null)
                                              //     ?
                                              Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: appColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Center(
                                                          child: Text(
                                                              "Choose Image"))))
                                          // : Image.network(
                                          //     snapshot.data!
                                          //         .data![0].image7!,
                                          //     fit: BoxFit.fill,
                                          //   ),
                                          )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: appColor,
                                      child: InkWell(
                                        onTap: () {
                                          _showChoiceDialog7(context);
                                        },
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Spacer(),
                            // InkWell(
                            //   onTap: () {
                            //     // Api.Addimage(imageFile7, widget.surid,
                            //     //     'addimageseven');
                            //     waittoaddImage();
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: appColor,
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //       ),
                            //     )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 80,
                                height: 120,
                                child: Text(
                                  'Image (8)',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox.fromSize(
                                          size: const Size.fromRadius(70),
                                          child: imageFile8 != null
                                              ? Image.file(
                                                  imageFile8!,
                                                  fit: BoxFit.fill,
                                                )
                                              :
                                              //  (snapshot.data!.data![0]
                                              //             .image8 ==
                                              //         null)
                                              //     ?
                                              Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: appColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Center(
                                                          child: Text(
                                                              "Choose Image"))))
                                          // : Image.network(
                                          //     snapshot.data!
                                          //         .data![0].image8!,
                                          //     fit: BoxFit.fill,
                                          //   ),
                                          )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: appColor,
                                      child: InkWell(
                                        onTap: () {
                                          _showChoiceDialog8(context);
                                        },
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Spacer(),
                            // InkWell(
                            //   onTap: () {
                            //     // Api.Addimage(imageFile8, widget.surid,
                            //     //     'addimageeight');
                            //     waittoaddImage();
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: appColor,
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //       ),
                            //     )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 80,
                                height: 120,
                                child: Text(
                                  'Image (9)',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox.fromSize(
                                          size: const Size.fromRadius(70),
                                          child: imageFile9 != null
                                              ? Image.file(
                                                  imageFile9!,
                                                  fit: BoxFit.fill,
                                                )
                                              :
                                              //  (snapshot.data!.data![0]
                                              //             .image9 ==
                                              //         null)
                                              //     ?
                                              Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: appColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Center(
                                                          child: Text(
                                                              "Choose Image"))))
                                          // : Image.network(
                                          //     snapshot.data!
                                          //         .data![0].image9!,
                                          //     fit: BoxFit.fill,
                                          //   ),
                                          )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: appColor,
                                      child: InkWell(
                                        onTap: () {
                                          _showChoiceDialog9(context);
                                        },
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Spacer(),
                            // InkWell(
                            //   onTap: () {
                            //     // Api.Addimage(imageFile9, widget.surid,
                            //     //     'addimagenine');
                            //     waittoaddImage();
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: appColor,
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //       ),
                            //     )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      AppButton(
                          width: width,
                          opTap: () {
                            _disposeVideoController();
                          },
                          buttonName: "submit".toUpperCase())
                    ]),
                  ],
                ),
              ))),
        ),
      ),
    );
  }
}

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Container(
        height: 400,
        decoration: BoxDecoration(
            border: Border.all(color: appColor),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: AspectRatio(
            aspectRatio: controller!.value.aspectRatio,
            child: VideoPlayer(controller!),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
