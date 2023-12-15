// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:toggle_switch/toggle_switch.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/pages/couponsused.dart';

import '../constants/colors.dart';

class CouponsTotal extends StatefulWidget {
  const CouponsTotal({Key? key}) : super(key: key);

  @override
  State<CouponsTotal> createState() => _CouponsTotalState();
}

class _CouponsTotalState extends State<CouponsTotal> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(RoutePaths.home);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: greens,

        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Coupons',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: ToggleSwitch(
                      initialLabelIndex: isAvailable ? 0 : 1,
                      minHeight: 30.0,
                      cornerRadius: 5,
                      minWidth: 110.0,
                      activeBgColor: const [Color.fromRGBO(43, 135, 97, 1)],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: const Color.fromRGBO(209, 46, 52, 1),
                      customTextStyles: [
                        TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ],
                      centerText: true,
                      totalSwitches: 2,
                      labels: const ['Available', 'Used'],
                      onToggle: (index) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CouponsUsed(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.all(
                  //               8.0), // Adjust padding as needed
                  //           height: 145.0,
                  //           width: 150.0,
                  //           child: QrImageView(
                  //             data: '1234567890',
                  //             version: QrVersions.auto,
                  //             size: double.infinity,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 8, // Adjust the height as needed
                  //         ),
                  //         Align(
                  //           alignment: Alignment.bottomCenter,
                  //           child: Text(
                  //             'Coupon 1',
                  //             style: GoogleFonts.montserrat(
                  //               fontSize: 14, // Adjust the font size as needed
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       width: 30,
                  //     ),
                  //     Column(
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.all(
                  //               8.0), // Adjust padding as needed
                  //           height: 145.0,
                  //           width: 150.0,
                  //           child: QrImageView(
                  //             data: '0987654321',
                  //             version: QrVersions.auto,
                  //             size: double.infinity,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 8, // Adjust the height as needed
                  //         ),
                  //         Align(
                  //           alignment: Alignment.bottomCenter,
                  //           child: Text(
                  //             'Coupon 2',
                  //             style: GoogleFonts.montserrat(
                  //               fontSize: 14, // Adjust the font size as needed
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),

                  const SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  // const Qrcustomwidget(),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GridView.builder(
                      itemCount: 16,
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30),
                      itemBuilder: (context, index) => const Qrcustomwidget(),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Qrcustomwidget extends StatelessWidget {
  const Qrcustomwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
              spreadRadius: 0.5,
            ),
          ]),
      child: QrImageView(
        data: 'This is a simple QR code',
        version: QrVersions.auto,
        gapless: false,
      ),
    );
  }
}
