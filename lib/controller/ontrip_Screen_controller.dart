// import 'dart:async';

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class OnTripScreenController extends GetxController{
//   //get map controller to access map
//   Completer<GoogleMapController> _googleMapController = Completer();
//   CameraPosition? _cameraPosition;
//   late LatLng _defaultLatLng;
//   late LatLng _draggedLatlng;
//   String _draggedAddress = "";

//   // @override
//   // void initState() {
//   //   _init();
//   //   super.initState();
//   // }

//  void onInit(){
//   _init();
//   super.onInit();
//  }

//   _init() {
//     //set default latlng for camera position
//     _defaultLatLng = LatLng(11, 104);
//     _draggedLatlng = _defaultLatLng;
//     _cameraPosition = CameraPosition(
//       target: _defaultLatLng,
//       zoom: 17.5 // number of map view 
//     );
  
//   //get address from dragged pin 
//   Future _getAddress(LatLng position) async {
//     //this will list down all address around the position
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark address = placemarks[0]; // get only first and closest address
//     String addresStr = "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
  
   
//     // setState(() {
//     //   _draggedAddress = addresStr;
//     // });
//   }

//   //get user's current location and set the map's camera to that location
//   Future _gotoUserCurrentPosition() async {
//     Position currentPosition = await determineUserCurrentPosition();
//     _gotoSpecificPosition(LatLng(currentPosition.latitude, currentPosition.longitude));
//   }

//   //go to specific position by latlng
//   Future _gotoSpecificPosition(LatLng position) async {
//     GoogleMapController mapController = await _googleMapController.future;
//     mapController.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//         target: position,
//         zoom: 17.5
//       )
//     ));
//     //every time that we dragged pin , it will list down the address here
//     await _getAddress(position);
//   }

//   Future determineUserCurrentPosition() async {
//     LocationPermission locationPermission;
//     bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     //check if user enable service for location permission
//     if(!isLocationServiceEnabled) {
//       print("user don't enable location permission");
//     }

//     locationPermission = await Geolocator.checkPermission();

//     //check if user denied location and retry requesting for permission
//     if(locationPermission == LocationPermission.denied) {
//       locationPermission = await Geolocator.requestPermission();
//       if(locationPermission == LocationPermission.denied) {
//         print("user denied location permission");
//       }
//     }

//     //check if user denied permission forever
//     if(locationPermission == LocationPermission.deniedForever) {
//       print("user denied permission forever");
//     }

//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//   }
  
//     //map will redirect to my current location when loaded
//     _gotoUserCurrentPosition();
//   }

// }