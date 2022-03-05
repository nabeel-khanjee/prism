// // import 'package:flutter/material.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'dart:math' show cos, sqrt, asin;

// // import 'package:prism/Location/secret.dart';
// // class MapView extends StatefulWidget {
// //   @override
// //   _MapViewState createState() => _MapViewState();
// // }

// // class _MapViewState extends State<MapView> {
// //   CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
// //    GoogleMapController ?mapController;

// //    Position ?_currentPosition;
// //   String _currentAddress = '';

// //   final startAddressController = TextEditingController();
// //   final destinationAddressController = TextEditingController();

// //   final startAddressFocusNode = FocusNode();
// //   final desrinationAddressFocusNode = FocusNode();

// //   String _startAddress = '';
// //   String _destinationAddress = '';
// //   String? _placeDistance;

// //   Set<Marker> markers = {};

// //    PolylinePoints? polylinePoints;
// //   Map<PolylineId, Polyline> polylines = {};
// //   List<LatLng> polylineCoordinates = [];

// //   final _scaffoldKey = GlobalKey<ScaffoldState>();

// //   Widget _textField({
// //     required TextEditingController controller,
// //     required FocusNode focusNode,
// //     required String label,
// //     required String hint,
// //     required double width,
// //     required Icon prefixIcon,
// //     Widget? suffixIcon,
// //     required Function(String) locationCallback,
// //   }) {
// //     return Container(
// //       width: width * 0.8,
// //       child: TextField(
// //         onChanged: (value) {
// //           locationCallback(value);
// //         },
// //         controller: controller,
// //         focusNode: focusNode,
// //         decoration: new InputDecoration(
// //           prefixIcon: prefixIcon,
// //           suffixIcon: suffixIcon,
// //           labelText: label,
// //           filled: true,
// //           fillColor: Colors.white,
// //           enabledBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.all(
// //               Radius.circular(10.0),
// //             ),
// //             borderSide: BorderSide(
// //               color: Colors.grey.shade400,
// //               width: 2,
// //             ),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.all(
// //               Radius.circular(10.0),
// //             ),
// //             borderSide: BorderSide(
// //               color: Colors.blue.shade300,
// //               width: 2,
// //             ),
// //           ),
// //           contentPadding: EdgeInsets.all(15),
// //           hintText: hint,
// //         ),
// //       ),
// //     );
// //   }

// //   // Method for retrieving the current location
// //   _getCurrentLocation() async {
// //     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
// //         .then((Position position) async {
// //       setState(() {
// //         _currentPosition = position;
// //         print('CURRENT POS: $_currentPosition');
// //         mapController!.animateCamera(
// //           CameraUpdate.newCameraPosition(
// //             CameraPosition(
// //               target: LatLng(position.latitude, position.longitude),
// //               zoom: 18.0,
// //             ),
// //           ),
// //         );
// //       });
// //       await _getAddress();
// //     }).catchError((e) {
// //       print(e);
// //     });
// //   }

// //   // Method for retrieving the address
// //   _getAddress() async {
// //     try {
// //       List<Placemark> p = await placemarkFromCoordinates(
// //           _currentPosition!.latitude, _currentPosition!.longitude);

// //       Placemark place = p[0];

// //       setState(() {
// //         _currentAddress =
// //             "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
// //         startAddressController.text = _currentAddress;
// //         _startAddress = _currentAddress;
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   // Method for calculating the distance between two places
// //   Future<bool> _calculateDistance() async {
// //     try {
// //       // Retrieving placemarks from addresses
// //       List<Location> startPlacemark = await locationFromAddress(_startAddress);
// //       List<Location> destinationPlacemark =
// //           await locationFromAddress(_destinationAddress);

// //       // Use the retrieved coordinates of the current position,
// //       // instead of the address if the start position is user's
// //       // current position, as it results in better accuracy.
// //       double startLatitude = _startAddress == _currentAddress
// //           ? _currentPosition!.latitude
// //           : startPlacemark[0].latitude;

// //       double startLongitude = _startAddress == _currentAddress
// //           ? _currentPosition!.longitude
// //           : startPlacemark[0].longitude;

// //       double destinationLatitude = destinationPlacemark[0].latitude;
// //       double destinationLongitude = destinationPlacemark[0].longitude;

// //       String startCoordinatesString = '($startLatitude, $startLongitude)';
// //       String destinationCoordinatesString =
// //           '($destinationLatitude, $destinationLongitude)';

// //       // Start Location Marker
// //       Marker startMarker = Marker(
// //         markerId: MarkerId(startCoordinatesString),
// //         position: LatLng(startLatitude, startLongitude),
// //         infoWindow: InfoWindow(
// //           title: 'Start $startCoordinatesString',
// //           snippet: _startAddress,
// //         ),
// //         icon: BitmapDescriptor.defaultMarker,
// //       );

// //       // Destination Location Marker
// //       Marker destinationMarker = Marker(
// //         markerId: MarkerId(destinationCoordinatesString),
// //         position: LatLng(destinationLatitude, destinationLongitude),
// //         infoWindow: InfoWindow(
// //           title: 'Destination $destinationCoordinatesString',
// //           snippet: _destinationAddress,
// //         ),
// //         icon: BitmapDescriptor.defaultMarker,
// //       );

// //       // Adding the markers to the list
// //       markers.add(startMarker);
// //       markers.add(destinationMarker);

// //       print(
// //         'START COORDINATES: ($startLatitude, $startLongitude)',
// //       );
// //       print(
// //         'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
// //       );

// //       // Calculating to check that the position relative
// //       // to the frame, and pan & zoom the camera accordingly.
// //       double miny = (startLatitude <= destinationLatitude)
// //           ? startLatitude
// //           : destinationLatitude;
// //       double minx = (startLongitude <= destinationLongitude)
// //           ? startLongitude
// //           : destinationLongitude;
// //       double maxy = (startLatitude <= destinationLatitude)
// //           ? destinationLatitude
// //           : startLatitude;
// //       double maxx = (startLongitude <= destinationLongitude)
// //           ? destinationLongitude
// //           : startLongitude;

// //       double southWestLatitude = miny;
// //       double southWestLongitude = minx;

// //       double northEastLatitude = maxy;
// //       double northEastLongitude = maxx;

// //       // Accommodate the two locations within the
// //       // camera view of the map
// //       mapController!.animateCamera(
// //         CameraUpdate.newLatLngBounds(
// //           LatLngBounds(
// //             northeast: LatLng(northEastLatitude, northEastLongitude),
// //             southwest: LatLng(southWestLatitude, southWestLongitude),
// //           ),
// //           100.0,
// //         ),
// //       );

// //       // Calculating the distance between the start and the end positions
// //       // with a straight path, without considering any route
// //       // double distanceInMeters = await Geolocator.bearingBetween(
// //       //   startLatitude,
// //       //   startLongitude,
// //       //   destinationLatitude,
// //       //   destinationLongitude,
// //       // );

// //       await _createPolylines(startLatitude, startLongitude, destinationLatitude,
// //           destinationLongitude);

// //       double totalDistance = 0.0;

// //       // Calculating the total distance by adding the distance
// //       // between small segments
// //       for (int i = 0; i < polylineCoordinates.length - 1; i++) {
// //         totalDistance += _coordinateDistance(
// //           polylineCoordinates[i].latitude,
// //           polylineCoordinates[i].longitude,
// //           polylineCoordinates[i + 1].latitude,
// //           polylineCoordinates[i + 1].longitude,
// //         );
// //       }

// //       setState(() {
// //         _placeDistance = totalDistance.toStringAsFixed(2);
// //         print('DISTANCE: $_placeDistance km');
// //       });

// //       return true;
// //     } catch (e) {
// //       print(e);
// //     }
// //     return false;
// //   }

// //   // Formula for calculating distance between two coordinates
// //   // https://stackoverflow.com/a/54138876/11910277
// //   double _coordinateDistance(lat1, lon1, lat2, lon2) {
// //     var p = 0.017453292519943295;
// //     var c = cos;
// //     var a = 0.5 -
// //         c((lat2 - lat1) * p) / 2 +
// //         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
// //     return 12742 * asin(sqrt(a));
// //   }

// //   // Create the polylines for showing the route between two places
// //   _createPolylines(
// //     double startLatitude,
// //     double startLongitude,
// //     double destinationLatitude,
// //     double destinationLongitude,
// //   ) async {
// //     polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
// //       Secrets.API_KEY, // Google Maps API Key
// //       PointLatLng(startLatitude, startLongitude),
// //       PointLatLng(destinationLatitude, destinationLongitude),
// //       travelMode: TravelMode.transit,
// //     );

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     }

// //     PolylineId id = PolylineId('poly');
// //     Polyline polyline = Polyline(
// //       polylineId: id,
// //       color: Colors.red,
// //       points: polylineCoordinates,
// //       width: 3,
// //     );
// //     polylines[id] = polyline;
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getCurrentLocation();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var height = MediaQuery.of(context).size.height;
// //     var width = MediaQuery.of(context).size.width;
// //     return Container(
// //       height: height,
// //       width: width,
// //       child: Scaffold(
// //         key: _scaffoldKey,
// //         body: Stack(
// //           children: <Widget>[
// //             // Map View
// //             GoogleMap(
// //               markers: Set<Marker>.from(markers),
// //               initialCameraPosition: _initialLocation,
// //               myLocationEnabled: true,
// //               myLocationButtonEnabled: false,
// //               mapType: MapType.normal,
// //               zoomGesturesEnabled: true,
// //               zoomControlsEnabled: false,
// //               polylines: Set<Polyline>.of(polylines.values),
// //               onMapCreated: (GoogleMapController controller) {
// //                 mapController = controller;
// //               },
// //             ),
// //             // Show zoom buttons
// //             SafeArea(
// //               child: Padding(
// //                 padding: const EdgeInsets.only(left: 10.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: <Widget>[
// //                     ClipOval(
// //                       child: Material(
// //                         color: Colors.blue.shade100, // button color
// //                         child: InkWell(
// //                           splashColor: Colors.blue, // inkwell color
// //                           child: SizedBox(
// //                             width: 50,
// //                             height: 50,
// //                             child: Icon(Icons.add),
// //                           ),
// //                           onTap: () {
// //                             mapController!.animateCamera(
// //                               CameraUpdate.zoomIn(),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     ClipOval(
// //                       child: Material(
// //                         color: Colors.blue.shade100, // button color
// //                         child: InkWell(
// //                           splashColor: Colors.blue, // inkwell color
// //                           child: SizedBox(
// //                             width: 50,
// //                             height: 50,
// //                             child: Icon(Icons.remove),
// //                           ),
// //                           onTap: () {
// //                             mapController!.animateCamera(
// //                               CameraUpdate.zoomOut(),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             // Show the place input fields & button for
// //             // showing the route
// //             SafeArea(
// //               child: Align(
// //                 alignment: Alignment.topCenter,
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(top: 10.0),
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.white70,
// //                       borderRadius: BorderRadius.all(
// //                         Radius.circular(20.0),
// //                       ),
// //                     ),
// //                     width: width * 0.9,
// //                     child: Padding(
// //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: <Widget>[
// //                           Text(
// //                             'Places',
// //                             style: TextStyle(fontSize: 20.0),
// //                           ),
// //                           SizedBox(height: 10),
// //                           _textField(
// //                               label: 'Start',
// //                               hint: 'Choose starting point',
// //                               prefixIcon: Icon(Icons.looks_one),
// //                               suffixIcon: IconButton(
// //                                 icon: Icon(Icons.my_location),
// //                                 onPressed: () {
// //                                   startAddressController.text = _currentAddress;
// //                                   _startAddress = _currentAddress;
// //                                 },
// //                               ),
// //                               controller: startAddressController,
// //                               focusNode: startAddressFocusNode,
// //                               width: width,
// //                               locationCallback: (String value) {
// //                                 setState(() {
// //                                   _startAddress = value;
// //                                 });
// //                               }),
// //                           SizedBox(height: 10),
// //                           _textField(
// //                               label: 'Destination',
// //                               hint: 'Choose destination',
// //                               prefixIcon: Icon(Icons.looks_two),
// //                               controller: destinationAddressController,
// //                               focusNode: desrinationAddressFocusNode,
// //                               width: width,
// //                               locationCallback: (String value) {
// //                                 setState(() {
// //                                   _destinationAddress = value;
// //                                 });
// //                               }),
// //                           SizedBox(height: 10),

// //                           Visibility(
// //                             visible: _placeDistance == null ? false : true,
// //                             child: Text(
// //                               'DISTANCE: $_placeDistance km',
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(height: 5),

// //                           ElevatedButton(
// //                             onPressed: (_startAddress != '' &&
// //                                     _destinationAddress != '')
// //                                 ? () async {
// //                                     startAddressFocusNode.unfocus();
// //                                     desrinationAddressFocusNode.unfocus();

// //                                     setState(() {
// //                                       if (markers.isNotEmpty) markers.clear();
// //                                       if (polylines.isNotEmpty) {
// //                                         polylines.clear();
// //                                       }
// //                                       if (polylineCoordinates.isNotEmpty) {
// //                                         polylineCoordinates.clear();
// //                                       }
// //                                       _placeDistance = null;
// //                                     });

// //                                     _calculateDistance().then((isCalculated) {
// //                                       if (isCalculated) {
// //                                         ScaffoldMessenger.of(context)
// //                                             .showSnackBar(
// //                                           SnackBar(
// //                                             content: Text(
// //                                                 'Distance Calculated Sucessfully'),
// //                                           ),
// //                                         );
// //                                       } else {
// //                                         ScaffoldMessenger.of(context)
// //                                             .showSnackBar(
// //                                           SnackBar(
// //                                             content: Text(
// //                                                 'Error Calculating Distance'),
// //                                           ),
// //                                         );
// //                                       }
// //                                     });
// //                                   }
// //                                 : null,
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Text(
// //                                 'Show Route'.toUpperCase(),
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 20.0,
// //                                 ),
// //                               ),
// //                             ),
// //                             style: ElevatedButton.styleFrom(

// //                               primary: Colors.red,
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(20.0),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             // Show current location button
// //             SafeArea(
// //               child: Align(
// //                 alignment: Alignment.bottomRight,
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
// //                   child: ClipOval(
// //                     child: Material(
// //                       color: Colors.orange.shade100, // button color
// //                       child: InkWell(
// //                         splashColor: Colors.orange, // inkwell color
// //                         child: SizedBox(
// //                           width: 56,
// //                           height: 56,
// //                           child: Icon(Icons.my_location),
// //                         ),
// //                         onTap: () {
// //                           mapController!.animateCamera(
// //                             CameraUpdate.newCameraPosition(
// //                               CameraPosition(
// //                                 target: LatLng(
// //                                   _currentPosition!.latitude,
// //                                   _currentPosition!.longitude,
// //                                 ),
// //                                 zoom: 18.0,
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:flutterapp/google_place_util.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class MapScreen extends StatefulWidget {
// //   @override
// //   _MapScreenState createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> implements  GooglePlacesListener {

// //   Map<PolylineId, Polyline> polylines = {};
// //   List<LatLng> polylineCoordinates = [];
// //   PolylinePoints polylinePoints = PolylinePoints();

// //   Position _currentPosition;
// //   String locationAddress = "Search destination";
// //   GooglePlaces googlePlaces;
// //   double _destinationLat;
// //   double _destinationLng;

// //   Completer<GoogleMapController> _controller = Completer();

// //   CameraPosition _kGooglePlex = CameraPosition(
// //     target: LatLng(0, 0),
// //     zoom: 14.4746,
// //   );

// //   @override
// //   void initState() {
// //     super.initState();
// //     googlePlaces = GooglePlaces(this);
// //     _getCurrentLocation();
// //   }

// //   _getCurrentLocation() {
// //     final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
// //     geolocator
// //         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
// //         .then((Position position) {
// //       setState(() {
// //         _currentPosition = position;
// //         _updatePosition(_currentPosition);
// //       });
// //     }).catchError((e) {
// //       print(e);
// //     });
// //   }

// //   Future<void> _updatePosition(Position currentPosition) async {
// //     final GoogleMapController controller = await _controller.future;
// //     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
// //       target: LatLng(currentPosition.latitude, currentPosition.longitude),
// //       zoom: 14.4746,
// //     )));
// //     googlePlaces.updateLocation(currentPosition.latitude, currentPosition.longitude);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var screenWidget = Stack(
// //       children: <Widget>[
// //         GoogleMap(
// //           mapType: MapType.normal,
// //           initialCameraPosition: _kGooglePlex,
// //           myLocationEnabled: true,
// //           polylines: Set<Polyline>.of(polylines.values),
// //           onMapCreated: (GoogleMapController controller) {
// //             _controller.complete(controller);
// //           },
// //         ),

// //         GestureDetector(
// //           onTap: () {
// //             googlePlaces.findPlace(context);
// //           },
// //           child: Container(
// //             height: 50.0,
// //             alignment: FractionalOffset.center,
// //             margin: EdgeInsets.all(10.0),
// //             padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
// //             decoration: BoxDecoration(
// //               color: const Color.fromRGBO(255, 255, 255, 1.0),
// //               border: Border.all(color: const Color(0x33A6A6A6)),
// //               borderRadius: BorderRadius.all(const Radius.circular(6.0)),
// //             ),
// //             child: Row(
// //               children: <Widget>[
// //                 Icon(Icons.search),
// //                 Flexible(
// //                   child: Container(
// //                     padding: EdgeInsets.only(right: 13.0),
// //                     child: Text(
// //                       locationAddress,
// //                       overflow: TextOverflow.ellipsis,
// //                       style: TextStyle(color: Colors.black),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     );

// //     return Scaffold(
// //       backgroundColor: const Color(0xFFA6AFAA),
// //       appBar: AppBar(
// //         title: Text(
// //           "Google maps route",
// //           textAlign: TextAlign.center,
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: screenWidget,
// //     );
// //   }

// //   @override
// //   selectedLocation(double lat, double lng, String address) {
// //     setState(() {
// //       _destinationLat = lat;
// //       _destinationLng = lng;
// //       locationAddress = address;

// //     });
// //     _getPolyline();
// //   }

// //   _addPolyLine() {
// //         polylines.clear();
// //         PolylineId id = PolylineId("poly");
// //         Polyline polyline = Polyline(
// //         polylineId: id, color: Colors.red, points: polylineCoordinates);
// //         polylines[id] = polyline;
// //         setState(() {});
// //   }

// //   _getPolyline() async {
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //         "GOOGLE_KEY",
// //         PointLatLng(_currentPosition.latitude, _currentPosition.longitude),
// //         PointLatLng(_destinationLat, _destinationLng),
// //         travelMode: TravelMode.driving
// //     );
// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     }
// //     _addPolyLine();
// //   }
// // }

// // Let's try to understand the above code snippet:

// // First of all the initState() method will invoke from the Flutter framwork. In this method, we calling _getCurrentLocation(). The _getCurrentLocation() will get the current user location if GPS is ON. So, make sure you have enabled the GPS.
// // When we get the user current location. The _updatePosition() method will automatically call and we display current location of user in the google map widget.
// // When you will tap on seach box, the googlePlaces.findPlace(context); called. It'll will open a pop up, where your can search address. Once you search and tap on searched address, the selectedLocation() method will call.
// // After that _getPolyline() will call to the get detail of route by using google api. Once it get the result, the _addPolyLine() parse the result and display on google map.

// // 6. Now create google_place_util.dart class. It'll search the address by using the google API and display on pop up list. When you select any visible address. It'll close and move to main screen of app.

// // import 'dart:async';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutterapp/flutter_google_places_autocomplete.dart';
// // import 'package:google_maps_webservice/places.dart';

// // class GooglePlaces {
// //   final homeScaffoldKey =  GlobalKey<ScaffoldState>();
// //   final searchScaffoldKey =  GlobalKey<ScaffoldState>();
// //   GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey:"GOOGLE_KEY");
// //   Location location;
// //   GooglePlacesListener _mapScreenState;

// //   GooglePlaces(this._mapScreenState);

// //   Future findPlace(BuildContext context) async {
// //     Prediction p = await showGooglePlacesAutocomplete(
// //       context: context,
// //       location: location,
// //       apiKey: "GOOGLE_KEY",
// //       onError: (res) {
// //         homeScaffoldKey.currentState
// //             .showSnackBar( SnackBar(content:  Text(res.errorMessage)));
// //       },
// //     );

// //     displayPrediction(p, homeScaffoldKey.currentState);
// //   }

// //   Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
// //     if (p != null) {
// //       // get detail (lat/lng)
// //       PlacesDetailsResponse detail =
// //           await _places.getDetailsByPlaceId(p.placeId);
// //       final lat = detail.result.geometry.location.lat;
// //       final lng = detail.result.geometry.location.lng;
// //       _mapScreenState.selectedLocation(
// //           lat, lng, detail.result.formattedAddress);
// //     }
// //   }

// //   void updateLocation(double lat, double long) {
// //     location =  Location(lat, long);
// //   }
// // }

// // abstract class GooglePlacesListener {
// //   selectedLocation(double lat, double long, String address);
// // }

// // 7. Now create flutter_google_place_autocomplete.dart class. It is used inside of above class that actually manage and display search address result in the drop down list.

// // library flutter_google_places_autocomplete.src;

// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_webservice/places.dart';

// class GooglePlacesAutocompleteWidget extends StatefulWidget {

//   final String apiKey;
//   final String hint;
//   final Location location;
//   final num offset;
//   final num radius;
//   final String language;
//   final List<String> types;
//   final List<Component> components;
//   final bool strictbounds;
//   final ValueChanged<PlacesAutocompleteResponse> onError;

//   GooglePlacesAutocompleteWidget(
//       {required this.apiKey,
//       this.hint = "Search",
//     required  this.offset,
//     required  this.location,
//     required  this.radius,
//     required  this.language,
//     required  this.types,
//     required  this.components,
//     required  this.strictbounds,
//     required  this.onError,
//       Key? key})
//       : super(key: key);

//   @override
//   State<GooglePlacesAutocompleteWidget> createState() {
//     return  _GooglePlacesAutocompleteOverlayState();
//   }

//   static GooglePlacesAutocompleteState? of(BuildContext context) => context
//       .findAncestorStateOfType<GooglePlacesAutocompleteState>();
// }

// class _GooglePlacesAutocompleteOverlayState
//     extends GooglePlacesAutocompleteState {
//   @override
//   Widget build(BuildContext context) {
//     final header =  Column(children: <Widget>[
//        Material(

//           child:  Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//                IconButton(
//                 color: Colors.black45,
//                 icon:  Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//                Expanded(
//                   child:  Padding(
//                 child: _textField(),
//                 padding: const EdgeInsets.only(right: 8.0),
//               )),
//             ],
//           )),
//        Divider(
//           //height: 1.0,
//           )
//     ]);

//     var body;

//     if (query.text.isEmpty ||
//         response == null ||
//         response!.predictions.isEmpty) {
//       body =  Material(
//         color: Colors.white,
//         borderRadius:  BorderRadius.only(
//             bottomLeft:  Radius.circular(2.0),
//             bottomRight:  Radius.circular(2.0)),
//       );
//     } else {
//       body =  SingleChildScrollView(
//           child:  Material(
//               borderRadius:  BorderRadius.only(
//                   bottomLeft:  Radius.circular(2.0),
//                   bottomRight:  Radius.circular(2.0)),
//               color: Colors.white,
//               child:  ListBody(
//                   children: response!.predictions
//                       .map((p) =>  PredictionTile(
//                           prediction: p, onTap: Navigator.of(context).pop))
//                       .toList())));
//     }

//     final container =  Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
//         child:  Stack(children: <Widget>[
//           header,
//            Padding(padding:  EdgeInsets.only(top: 48.0), child: body),
//         ]));

//     if (Platform.isIOS) {
//       return  Padding(
//           padding:  EdgeInsets.only(top: 8.0), child: container);
//     }
//     return container;
//   }

//   Widget _textField() =>  TextField(
//         controller: query,
//         autofocus: true,
//         decoration:  InputDecoration(
//             hintText: widget.hint,
//             hintStyle:  TextStyle(color: Colors.black54, fontSize: 16.0),
//             border: null),
//         onChanged: search,
//       );
// }

// class GooglePlacesAutocompleteResult extends StatefulWidget {
//   final ValueChanged<Prediction> onTap;

//   GooglePlacesAutocompleteResult({required this.onTap});

//   @override
//   _GooglePlacesAutocompleteResult createState() =>
//        _GooglePlacesAutocompleteResult();
// }

// class _GooglePlacesAutocompleteResult
//     extends State<GooglePlacesAutocompleteResult> {
//   @override
//   Widget build(BuildContext context) {
//     final state = GooglePlacesAutocompleteWidget.of(context);
//     assert(state != null);

//     if (state!.query.text.isEmpty ||
//         state.response == null ||
//         state.response!.predictions.isEmpty) {
//       final children = <Widget>[];

//       return  Stack(children: children);
//     }
//     return  PredictionsListView(
//         predictions: state.response!.predictions, onTap: widget.onTap);
//   }
// }

// class PredictionsListView extends StatelessWidget {
//   final List<Prediction> predictions;
//   final ValueChanged<Prediction> onTap;

//   PredictionsListView({required this.predictions, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return  ListView(
//         children: predictions
//             .map((Prediction p) =>
//                  PredictionTile(prediction: p, onTap: onTap))
//             .toList());
//   }
// }

// class PredictionTile extends StatelessWidget {
//   final Prediction prediction;
//   final ValueChanged<Prediction> onTap;

//   PredictionTile({required this.prediction, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return  ListTile(
//       leading:  Icon(Icons.location_on),
//       title:  Text(prediction.description),
//       onTap: () {
//         if (onTap != null) {
//           onTap(prediction);
//         }
//       },
//     );
//   }
// }

// Future showGooglePlacesAutocomplete(
//     { required BuildContext context,
//      String? apiKey,
//     String hint = "Search",
//      num? offset,
//     Location? location,
//     num? radius,
//     String? language,
//     List<String>? types,
//     List<Component>? components,
//     bool? strictbounds,
//     ValueChanged<PlacesAutocompleteResponse>? onError}) {
//   final builder = (BuildContext ctx) =>  GooglePlacesAutocompleteWidget(
//         apiKey: apiKey!,
//         language: language!,
//         components: components!,
//         types: types!,
//         location: location!,
//         radius: radius!,
//         strictbounds: strictbounds!,
//         offset: offset!,
//         hint: hint,
//         onError: onError!,
//       );

//   return showDialog(context: context, builder: builder);
// }

// abstract class GooglePlacesAutocompleteState
//     extends State<GooglePlacesAutocompleteWidget> {
//   late TextEditingController query;
//    PlacesAutocompleteResponse? response;
//   late GoogleMapsPlaces _places;
//   late bool searching;

//   @override
//   void initState() {
//     super.initState();
//     query =  TextEditingController(text: "");
//     _places =  GoogleMapsPlaces(apiKey:widget.apiKey);
//     searching = false;
//   }

//   Future<Null> doSearch(String value) async {
//     if (mounted && value.isNotEmpty) {
//       setState(() {
//         searching = true;
//       });

//       final res = await _places.autocomplete(value,
//           offset: widget.offset,
//           location: widget.location,
//           radius: widget.radius,
//           language: widget.language,
//           types: widget.types,
//           components: widget.components,
//           strictbounds: widget.strictbounds);

//       if (res.errorMessage?.isNotEmpty == true ||
//           res.status == "REQUEST_DENIED") {
//         onResponseError(res);
//       } else {
//         onResponse(res);
//       }
//     } else {
//       // onResponse();
//     }
//   }

//   late Timer _timer;

//   Future<Null> search(String value) async {
//     _timer.cancel();
//     _timer =  Timer(const Duration(milliseconds: 300), () {
//       _timer.cancel();
//       doSearch(value);
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _places.dispose();
//     super.dispose();
//   }

//   @mustCallSuper
//   void onResponseError(PlacesAutocompleteResponse res) {
//     if (mounted) {
//       if (widget.onError != null) {
//         widget.onError(res);
//       }
//       setState(() {
//         response = null;
//         searching = false;
//       });
//     }
//   }

//   @mustCallSuper
//   void onResponse(PlacesAutocompleteResponse res) {
//     if (mounted) {
//       setState(() {
//         response = res;
//         searching = false;
//       });
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prism/Utils/colors.dart';

class MapScreen extends StatefulWidget {
  final double currentLat;
  final double currentLon;
  final double endlocationLat;
  final double endLocationLon;

  const MapScreen(
      {Key? key,
      required this.currentLat,
      required this.currentLon,
      required this.endlocationLat,
      required this.endLocationLon})
      : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  Position? _currentPosition;

  String googleAPiKey = "AIzaSyBF2Y2bkRKW9UzdZh5cfALYdR1_Uoapdcc";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  // LatLng startLocation = LatLng(widget.currentLat, widget.currentLon);
  // LatLng endLocation = LatLng(widget.endlocationLat,widget.endLocationLon);

  @override
  void initState() {
    markers.add(Marker(
      //add start location marker
      markerId:
          MarkerId(LatLng(widget.currentLat, widget.currentLon).toString()),
      position:
          LatLng(widget.currentLat, widget.currentLon), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Your',
        snippet: 'Location',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker(
      //add distination location marker
      markerId: MarkerId(
          LatLng(widget.endlocationLat, widget.endLocationLon).toString()),
      position: LatLng(
          widget.endlocationLat, widget.endLocationLon), //position of marker
      infoWindow: InfoWindow(
        anchor: const Offset(0.5, 0.0),

        //popup info
        title: 'Case',
        snippet: 'Location',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(80), //Icon for Marker
    ));

    getDirections(); //fetch direction polylines from Google API
    // _getCurrentLocation();
    super.initState();
  }
  // Method for retrieving the current location

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(widget.currentLat, widget.currentLon),
      PointLatLng(widget.endlocationLat, widget.endLocationLon),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: appColor,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          MaterialButton(onPressed: () {
            getDirections();
          })
        ],
        centerTitle: true,
        title: Text(
          "Location",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: appColor,
      ),
      body: Stack(
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: LatLng(
                  widget.currentLat, widget.currentLon), //initial position
              zoom: 16.0, //initial zoom level
            ),
            markers: markers, //markers to show on map
            polylines: Set<Polyline>.of(polylines.values), //polylines
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),
          Positioned(
            bottom: 100,
            right: 0,

            // alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.white, // inkwell color
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          Icons.my_location,
                          color: appColor,
                        ),
                      ),
                      onTap: () {
                        _getCurrentLocation();
                        mapController!.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                _currentPosition!.latitude,
                                _currentPosition!.longitude,
                              ),
                              zoom: 18.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // alignment: Alignment.bottomLeft,
            right: 0,
            bottom: 170,

            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.white, // inkwell color
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: appColor,
                        ),
                      ),
                      onTap: () {
                        // _getCurrentLocation();
                        mapController!.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                widget.endlocationLat,
                                widget.endLocationLon,
                              ),
                              zoom: 18.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  String _currentAddress = '';

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }
}
