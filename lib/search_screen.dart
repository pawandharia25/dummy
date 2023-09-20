import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoPikker extends StatelessWidget {
  const DemoPikker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(

            height: 50.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: Get.width.w,
                  margin: EdgeInsets.only(
                    top: 20.h,
                  ),
                  padding: EdgeInsets.only(
                    left: 10.w,
                    top: 10.h,
                    bottom: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(
                          1.0,
                          1.0,
                        ),
                        blurRadius: 2.0.r,
                        spreadRadius: 1.0.r,
                      ), //BoxShadow
                      //BoxShadow
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(

                        width: 10.w,
                      ),
                      Icon(
                        Icons.arrow_back,
                        size: 22.r,
                        color: Colors.black,
                      ),
                      SizedBox(

                        width: 10.w,
                      ),
                      Text(
                        "Enter Drop Location",
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(

                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: AutoSizeText(
                  "Favorites",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(

                    width: 25.w,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(

                    width: 26.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        "Ajnara le garden",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      AutoSizeText(
                        "Ajnara le garden",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 10.h,
                ),
                child: AutoSizeText(
                  "History",
                  style: GoogleFonts.roboto(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(

                height: 500,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    top: 10.h,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 35.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: Icon(
                                    Icons.access_time_filled_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(

                                  width: 20.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Ajnara le garden",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    AutoSizeText(
                                      "Ajnara le garden",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 60.w),
                              child: Icon(
                                Icons.favorite_border,
                                size: 20.r,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(

                          height: 15.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 20.w, top: 5.h, bottom: 5.h),
                          height: 0.5,
                          color: Colors.black,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}