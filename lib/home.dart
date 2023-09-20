import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_1/bookride_page.dart';
import 'package:demo_1/offerpage.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      _deal(),
      _rideCost(),
      _coupen(),
    ]);
  }

  Widget _deal() {
    return Positioned(
      top: Get.height.h * 2.7 / 5,
      child: Container(
        padding: EdgeInsets.only(top: 9.h),
        alignment: Alignment.topCenter,
        height: 450.h,
        width: Get.width.w,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r))),
        child: AutoSizeText(
          "Saving ₹15 with special discount",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: Colors.white),
        ),
      ),
    );
  }

  Widget _rideCost() {
    return Positioned(
      top: Get.height.h * 2.9 / 5,
      child: Container(
        height: 400.h,
        width: Get.width.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
        ),
        child: Column(
          children: [
            Container(
              height: 80.h,
              width: Get.width.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r)),
                  color: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.motorcycle_sharp),
                  AutoSizeText(
                    "Bike",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Colors.white),
                  ),
                  AutoSizeText(
                    "1 min",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Row(
                    children: [
                      AutoSizeText(
                        "₹146  ",
                        style: GoogleFonts.roboto(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                            color: Colors.white),
                      ),
                      AutoSizeText(
                        "₹146",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 15,
                  )
                ],
              ),
            ),
            Container(
              height: 80.h,
              width: Get.width.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.motorcycle_sharp),
                  AutoSizeText(
                    "Car",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Colors.black),
                  ),
                  AutoSizeText(
                    "1 min",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Row(
                    children: [
                      AutoSizeText(
                        "₹146  ",
                        style: GoogleFonts.roboto(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                            color: Colors.black),
                      ),
                      AutoSizeText(
                        "₹146",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 15.r,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _coupen() {
    return Positioned(
        top: Get.height.h * 3.8 / 5,
        child: Container(
          height: 350.h,
          width: Get.width.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10.r)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(00, -8),
                    color: Colors.black12,
                    blurRadius: 10.0.r)
              ]),
          child: Column(children: [
            InkWell(
              onTap: () {
                Get.to(OfferPage());
              },
              child: Container(
                height: 80.h,
                width: Get.width.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.motorcycle_sharp),
                    AutoSizeText(
                      "1 Coupon available",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 120.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                    )
                  ],
                ),
              ),
            ),
            DottedLine(
              dashLength: 5.w,
              dashGapLength: 4,
            ),
            Container(
              padding: EdgeInsets.only(left: 13.w),
              height: 60.h,
              width: Get.width.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.currency_rupee),
                  Padding(
                    padding: EdgeInsets.only(left: 37.w),
                    child: AutoSizeText(
                      "Cash",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(BookRidePage());
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                height: 50.h,
                width: Get.width.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7), color: Colors.red),
                child: AutoSizeText(
                  "Book Ride",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                      color: Colors.white),
                ),
              ),
            )
          ]),
        ));
  }

  Widget _showDraggedAddress() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 0,
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
