import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RiderBokkedPage extends StatefulWidget {
  const RiderBokkedPage({Key? key}) : super(key: key);

  @override
  State<RiderBokkedPage> createState() => _RiderBokkedPageState();
}

class _RiderBokkedPageState extends State<RiderBokkedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  height: 380.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 70.h, right: 15.w, left: 15.w),
                    child: Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: Get.width.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 15.w),
                                width: Get.width.w / 2 - 26,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "PIN",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    AutoSizeText(
                                      " 4 5 6 7",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                width: 1.w,
                                color: Colors.black,
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 15.w),
                                width: Get.width.w / 2 - 26,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "Arriving in  ",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 28,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.green.shade900,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            "2",
                                            style: GoogleFonts.roboto(
                                                fontSize: 18.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          AutoSizeText(
                                            "  min",
                                            style: GoogleFonts.roboto(
                                              fontSize: 13.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 25.r,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  children: [
                                    AutoSizeText(
                                      "Driver Name",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          "4.5  ",
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFFFD700),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.7.w, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(3.r)),
                                  child: AutoSizeText(
                                    "1234567890",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                AutoSizeText(
                                  "Vehicle Name",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Share pickup notes with Captain",
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Icon(
                                  Icons.message,
                                  size: 22.r,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Colors.grey))),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                          thickness: sqrt1_2,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              "Enjoying Ride?",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            InkWell(
                              onTap: () {},
                              child: AutoSizeText(
                                "Addtip to Captain",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  height: 130.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: AutoSizeText(
                              "Pickup details",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Pickup Address",
                          style: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 20.r,
                                color: Colors.blue,
                              ),
                              AutoSizeText(
                                "  Edit location",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 20.r,
                                color: Colors.blue,
                              ),
                              AutoSizeText(
                                "  Add as Favorite",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 40.w,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  height: 130.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: AutoSizeText(
                              "Drop details",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Drop Address",
                          style: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 20.r,
                                color: Colors.blue,
                              ),
                              AutoSizeText(
                                "  Edit location",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 20.r,
                                color: Colors.blue,
                              ),
                              AutoSizeText(
                                "  Add as Favorite",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 40.w,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  height: 170.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: AutoSizeText(
                              "Payment",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: AutoSizeText(
                              "Ride Fare",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  "₹159",
                                  style: GoogleFonts.roboto(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 15.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                AutoSizeText(
                                  "  ₹147",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  maxRadius: 14.r,
                                  child: Icon(
                                    Icons.currency_rupee,
                                    size: 20.r,
                                    color: Colors.white,
                                  ),
                                ),
                                AutoSizeText(
                                  "  Cash",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            "Change payment method",
                            style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  height: 175.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              maxRadius: 25.r,
                              child: Icon(
                                Icons.currency_rupee_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: Column(
                              children: [
                                AutoSizeText(
                                  "Support our heroes",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                AutoSizeText(
                                  "Tip amount will be credited to captain",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            "Add Tip",
                            style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    color: Colors.grey.shade300),
                                child: AutoSizeText(
                                  "₹10",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    color: Colors.grey.shade300),
                                child: AutoSizeText(
                                  "₹20",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    color: Colors.grey.shade300),
                                child: AutoSizeText(
                                  "₹30",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  height: 170.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.0.h),
                            child: AutoSizeText(
                              "More aboute Driver",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        height: 80.h,
                        width: Get.width.w,
                        child: Row(
                          children: [
                            Container(
                              width: Get.width.w / 3 - 17,
                              alignment: Alignment.center,
                              height: 30,
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    "4.5",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  AutoSizeText(
                                    "Rating",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 0.1.w,
                              color: Colors.black,
                              thickness: 0.1,
                            ),
                            Container(
                              width: Get.width.w / 3 - 17,
                              height: 30,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    "45",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  AutoSizeText(
                                    "Trips",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 0.1.w,
                              color: Colors.black,
                              thickness: 0.1,
                            ),
                            Container(
                              width: Get.width.w / 3 - 18,
                              height: 30,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    "2 years",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  AutoSizeText(
                                    "Duration",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        children: [
                          AutoSizeText(
                            "Captain speaks English,hindi",
                            style: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  height: 175.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.0.h),
                            child: AutoSizeText(
                              "Your ride is Insured",
                              style: GoogleFonts.roboto(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: Icon(
                              Icons.shield,
                              color: Colors.green,
                              size: 25.r,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: AutoSizeText(
                              "Your insurance coverage is valid for inly\nbike ridesin Piker",
                              style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: AutoSizeText(
                              "Know More   ",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  height: 175.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 3),
                            color: Colors.black12,
                            blurRadius: 5.0.r)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.0.h),
                            child: AutoSizeText(
                              "Ride cancellation policy",
                              style: GoogleFonts.roboto(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: Icon(
                              Icons.info,
                              size: 25.r,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: AutoSizeText(
                              "We strive to compensate our captains fairly\nfor their time and effort",
                              style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: AutoSizeText(
                              "Know More   ",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: 16.w, left: 16.w),
                      height: 50.h,
                      width: Get.width.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1, color: Colors.red.shade800),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(00, 3),
                                color: Colors.black12,
                                blurRadius: 5.0.r)
                          ]),
                      child: AutoSizeText(
                        "Cancle Ride",
                        style: GoogleFonts.roboto(
                            fontSize: 17.sp,
                            color: Colors.red.shade800,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ));
  }
}
