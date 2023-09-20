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
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80.h, left: 20.w, right: 20.w),
          child: Container(
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
                  width: Get.width.w / 2 - 21,
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
                  width: Get.width.w / 2 - 21,
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
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ],
    ));
  }
}
