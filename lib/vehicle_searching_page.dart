import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_1/ride_booked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class VehicleSearchPage extends StatefulWidget {
  const VehicleSearchPage({Key? key}) : super(key: key);

  @override
  State<VehicleSearchPage> createState() => _VehicleSearchPageState();
}

class _VehicleSearchPageState extends State<VehicleSearchPage> {
  //get map controller to access map
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatlng;
  String _draggedAddress = "";

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    //set default latlng for camera position
    _defaultLatLng = LatLng(11, 104);
    _draggedLatlng = _defaultLatLng;
    _cameraPosition =
        CameraPosition(target: _defaultLatLng, zoom: 17.5 // number of map view
            );

    //map will redirect to my current location when loaded
    _gotoUserCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      //get a float button to click and go to current location
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _gotoUserCurrentPosition();
        },
        child: Icon(Icons.location_on),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(children: [
      _getMap(),
      _getCustomPin(),
      _showDraggedAddress(),
      _VehicleSerch(),
    ]);
  }

  Widget _VehicleSerch() {
    return Positioned(
      top: Get.height.h * 2.5 / 5,
      child: Container(
        height: 500.h,
        width: Get.width.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60.h,
              width: Get.width.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Icon(
                      Icons.lightbulb,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    child: AutoSizeText(
                      "You can change drop location & payment method\nwhile on ride as well",
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Container(
                height: 60.h,
                width: Get.width.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15.w, right: 15.w),
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: Icon(Icons.motorcycle_sharp)),
                    Icon(Icons.vertical_distribute),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          Container(
                            height: 28.h,
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "Pickup location",
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp, color: Colors.grey),
                            ),
                          ),
                          Container(
                            height: 28.h,
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "Drop location",
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 30.h, bottom: 30.h, right: 20.w, left: 20.w),
              child: InkWell(
                onTap: () {
                  Get.to(RiderBokkedPage());
                },
                child: Container(
                  height: 15.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xFFFFD700),
                ),
                SizedBox(
                  width: 10.w,
                ),
                AutoSizeText(
                  "Finding the perfect Captain for you",
                  style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _showDraggedAddress() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Center(
            child: Text(
          _draggedAddress,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget _getMap() {
    return GoogleMap(
      initialCameraPosition:
          _cameraPosition!, //initialize camera position for map
      mapType: MapType.normal,
      onCameraIdle: () {
        //this function will trigger when user stop dragging on map
        //every time user drag and stop it will display address
        _getAddress(_draggedLatlng);
      },
      onCameraMove: (cameraPosition) {
        //this function will trigger when user keep dragging on map
        //every time user drag this will get value of latlng
        _draggedLatlng = cameraPosition.target;
      },
      onMapCreated: (GoogleMapController controller) {
        //this function will trigger when map is fully loaded
        if (!_googleMapController.isCompleted) {
          //set controller to google map when it is fully loaded
          _googleMapController.complete(controller);
        }
      },
    );
  }

  Widget _getCustomPin() {
    return Center(
      child: Container(
        width: 150,
        child: Lottie.asset("assets/pin.json"),
      ),
    );
  }

  //get address from dragged pin
  Future _getAddress(LatLng position) async {
    //this will list down all address around the position
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr =
        "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
    setState(() {
      _draggedAddress = addresStr;
    });
  }

  //get user's current location and set the map's camera to that location
  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  //go to specific position by latlng
  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 17.5)));
    //every time that we dragged pin , it will list down the address here
    await _getAddress(position);
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    //check if user denied permission forever
    if (locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
}
