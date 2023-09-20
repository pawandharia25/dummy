
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AutoSizeText(
          "Offers",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: Colors.black),
        ),
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    AutoSizeText(
                      "Pikker app Coin Balance",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: Colors.black),
                    ),
                    AutoSizeText(
                      "You don't have any coins currently",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AutoSizeText(
                      "0",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black),
                    ),
                    Icon(Icons.money),
                  ],
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Container(
                padding: EdgeInsets.all(10.0.r),
                alignment: Alignment.center,
                height: 80.h,
                width: Get.width.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(00, 7),
                          color: Colors.black12,
                          blurRadius: 7.r),
                      BoxShadow(
                          offset: Offset(00, -5),
                          color: Colors.black12,
                          blurRadius: 7.r)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AutoSizeText(
                      "Now Save more on ride using Pikker app Coins!",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.r,
                    )
                  ],
                ),
              )),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0.r),
                child: AutoSizeText(
                  "Available Coupons",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter Coupon Code",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 0.5))),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.all(15.r),
              child: Container(
                  alignment: Alignment.center,
                  height: 180.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(00, 7),
                            color: Colors.black12,
                            blurRadius: 7.r),
                        BoxShadow(
                            offset: Offset(00, -5),
                            color: Colors.black12,
                            blurRadius: 7.r)
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 40.h,
                        width: Get.width.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.red,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                            ),
                            AutoSizeText(
                              "   Auto Offers",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              "ERTYUYT",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp,
                                  color: Colors.black),
                            ),
                            AutoSizeText(
                              "Select",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.sp,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: AutoSizeText(
                              "Get 30% OFF",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: AutoSizeText(
                              "Save ₹14 on this ride.",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: AutoSizeText(
                              "View Details",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
