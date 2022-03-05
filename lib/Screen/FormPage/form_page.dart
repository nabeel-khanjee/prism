import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prism/Location/map.dart';
import 'package:prism/Screen/ApplicantDetails/applicant_details.dart';
import 'package:prism/Screen/PhotoGraph/photo_graph.dart';
import 'package:prism/Screen/VerificationOutcome/verification_outcome.dart';
import 'package:prism/Utils/colors.dart';
import 'package:prism/Widgets/app_button.dart';
import 'package:prism/Widgets/form_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _currentAddress = '';

  final startAddressController = TextEditingController();
  String _startAddress = '';

  Position? currentPosition;

  @override
  void initState() {
    // TODO: implement initState
    _getCurrentLocation();
    super.initState();
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        currentPosition = position;
        print('CURRENT POS: $currentPosition');
        // mapController!.animateCamera(
        //   CameraUpdate.newCameraPosition(
        //     CameraPosition(
        //       target: LatLng(position.latitude, position.longitude),
        //       zoom: 18.0,
        //     ),
        // ),
        // );
      });
      // await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  // _getAddress() async {
  //   try {
  //     List<Placemark> p = await placemarkFromCoordinates(
  //         currentPosition!.latitude, currentPosition!.longitude);

  //     Placemark place = p[0];

  //     setState(() {
  //       _currentAddress =
  //           "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
  //       startAddressController.text = _currentAddress;
  //       _startAddress = _currentAddress;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
          "Form",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      floatingActionButton: IconButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => MapScreen(
                      currentLat: currentPosition!.latitude,
                      currentLon: currentPosition!.longitude,
                      endlocationLat: 24.911078,
                      endLocationLon: 67.031039,
                    )))),
        icon: Icon(
          Icons.location_history,
          color: appColor,
          size: width * 0.15,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),

          //  decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(10),
          //       boxShadow: [
          //         BoxShadow(
          //             color: Color.fromARGB(51, 67, 107, 112),
          //             blurRadius: 20.0,
          //             offset: Offset(0, 10)),
          //       ],
          //     ),

          child: Column(
            children: [
              FormButton(
                buttonTitle: "Applicant's Details",
                iconColor: appColor,
                iconData: FontAwesomeIcons.user,
                textColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ApplicantDetails())));
                },
              ),
              FormButton(
                buttonTitle: "Place Details",
                iconColor: appColor,
                iconData: FontAwesomeIcons.locationArrow,
                textColor: Colors.grey,
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: ((context) => PlaceDetail()),
                  //   ),
                  // );
                },
              ),
              FormButton(
                buttonTitle: "Take Photos",
                iconColor: appColor,
                iconData: FontAwesomeIcons.photoVideo,
                textColor: Colors.grey,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => PhotoGraphs())));
                },
              ),
              FormButton(
                buttonTitle: "Verification Outcome",
                iconColor: appColor,
                iconData: FontAwesomeIcons.checkCircle,
                textColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VerificationOutcomes())));
                },
              ),
              AppButton(
                  width: width,
                  opTap: () {},
                  buttonName: "submit".toUpperCase())
            ],
          ),
        ),
      ),
    );
  }
}
