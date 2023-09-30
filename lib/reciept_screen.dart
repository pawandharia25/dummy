import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_1/controller/reciept_screen_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'clipper.dart';

class ReceiptScreen extends GetView<ReceiptScreenController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReceiptScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Container(
                      height: 45.h,
                      width: 60.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.r),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(00, 5),
                                blurRadius: 10.r,
                                color: Colors.black12),
                            BoxShadow(
                                offset: const Offset(00, -5),
                                blurRadius: 10.r,
                                color: Colors.black12)
                          ]),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.h),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(00, 3),
                      blurRadius: 10.r,
                      color: Colors.black12),
                  BoxShadow(
                      offset: const Offset(00, -3),
                      blurRadius: 10.r,
                      color: Colors.black12)
                ]),
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                      height: 450.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.h, left: 20.w),
                                child: Container(
                                  height: 70.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50.r),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 8),
                                          blurRadius: 7.r,
                                          color: Colors.black12),
                                      BoxShadow(
                                          offset: Offset(0, -8),
                                          blurRadius: 7.r,
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
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              AutoSizeText(
                                "Your trip with Dinesh has ended",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            height: 190.h,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                    width: 0.5.w, color: Colors.grey.shade400)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.w, top: 20.h),
                                      child: AutoSizeText(
                                        "RIDE DETAILS",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 10.h),
                                    child: Row(
                                      children: [
                                        AutoSizeText(
                                          "11:24",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.sp),
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
                                Padding(
                                  padding: EdgeInsets.only(left: 72.5.w),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: DottedLine(
                                      direction: Axis.vertical,
                                      dashColor: Colors.black,
                                      lineLength: 30.h,
                                      dashLength: 3,
                                      dashGapLength: 3,
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
                                              color: Colors.grey,
                                              fontSize: 13.sp),
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
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Image.asset("assets/shape .png",
                                            height: 17.h),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        const AutoSizeText("****8295")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                                text: "Rs. ",
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: "123",
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal))
                                            ])),
                                        SizedBox(
                                          width: 20.w,
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40.h,
                              width: 200.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(23.r)),
                              child: AutoSizeText(
                                "Rate the Captain",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border,
                              ),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AutoSizeText(
                            "Very Good",
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
