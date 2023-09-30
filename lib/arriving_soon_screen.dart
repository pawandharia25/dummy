import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_1/on_trip_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class ArrivingSoonScreen extends StatefulWidget {
  const ArrivingSoonScreen({Key? key}) : super(key: key);

  @override
  State<ArrivingSoonScreen> createState() => _ArrivingSoonScreenState();
}

class _ArrivingSoonScreenState extends State<ArrivingSoonScreen> {
  //get map controller to access map
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatlng;
  String _draggedAddress = "";

  void goToOnTripPage() {
    Future.delayed(Duration(seconds: 5), () {
      Get.to(OnTripScreen());
    });
  }

  @override
  void initState() {
    _init();
    goToOnTripPage();
    super.initState();
  }

  _init() {
    //set default latlng for camera position
    _defaultLatLng = const LatLng(11, 104);
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
        child: const Icon(Icons.location_on),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(children: [
      _getMap(),
      _getCustomPin(),
      // _showDraggedAddress(),
      _rideDetails(),
      _topBar(),
      _backButton(),
      _captainProfile(),
    ]);
  }

  Widget _backButton() {
    return Positioned(
        child: Container(
      height: 45.h,
      width: 60.w,
      margin: EdgeInsets.only(top: 80.h, left: 30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
              offset: Offset(00, 5), blurRadius: 10.r, color: Colors.black12),
          BoxShadow(
              offset: Offset(00, -5), blurRadius: 10.r, color: Colors.black12)
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    ));
  }

  Widget _captainProfile() {
    return Positioned(
        bottom: 27 * 9,
        child: Container(
          height: 70.h,
          width: 90.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            boxShadow: [
              BoxShadow(
                  offset: Offset(00, 15),
                  blurRadius: 10.r,
                  color: Colors.black12),
              BoxShadow(
                  offset: Offset(00, -15),
                  blurRadius: 10.r,
                  color: Colors.black12)
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0.r),
            child: CircleAvatar(
              maxRadius: 40.r,
              child: Icon(Icons.person, size: 40.r),
            ),
          ),
        ));
  }

  Widget _topBar() {
    return Positioned(
      top: 0,
      child: Container(
        height: 150.h,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Captain is Waiting",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _rideDetails() {
    return Positioned(
      bottom: 4.9 / 17,
      child: Container(
        height: 270.h,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r)),
            color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 25.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.grey.shade300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Captain Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      AutoSizeText(
                        "PB03 A1 9474",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 25.h,
                  width: 300.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Captain has arrived",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      AutoSizeText(
                        "Hero Splendor+",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 120.h,
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.amber),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "RIDE DETAILS",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "OTP :",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                  text: "1234",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ]))
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.w,
                              ),
                              child: AutoSizeText(
                                "RIDE DETAILS",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  "11:24",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 15.r,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                AutoSizeText(
                                  "Sector 8, Jaipur",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 72.5.w),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: DottedLine(
                              direction: Axis.vertical,
                              dashColor: Colors.black,
                              lineLength: 30.h,
                              dashLength: 3.h,
                              dashGapLength: 3.h,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  "11:24",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 15.r,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const AutoSizeText(
                                  "Sector 8, Jaipur",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 2.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 30, right: 30),
                    height: 60.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(00, 8),
                              color: Colors.black12,
                              blurRadius: 10.0.r)
                        ]),
                    child: AutoSizeText(
                      "Emergency Issue",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(left: 30, right: 30),
                      height: 60.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(00, 8),
                                color: Colors.black12,
                                blurRadius: 10.0.r)
                          ]),
                      child: Image.asset(
                        "assets/cross-23.png",
                        height: 30.h,
                        width: 30.w,
                      )),
                ),
                SizedBox(
                  width: 60.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget _showDraggedAddress() {
  //   return SafeArea(
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: 60,
  //       decoration: const BoxDecoration(
  //         color: Colors.blue,
  //       ),
  //       child: Center(
  //           child: Text(
  //         _draggedAddress,
  //         style:
  //             const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
  //       )),
  //     ),
  //   );
  // }

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
