// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:toggle_switch/toggle_switch.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/pages/couponsused.dart';

import '../constants/colors.dart';
import '../model/common.dart';
import '../service/commonservice.dart';

class CouponsAvailable extends StatefulWidget {
  final String ? phone;
  final String ? type;
  const CouponsAvailable({Key? key, required this.phone, required this.type}) : super(key: key);

  @override
  State<CouponsAvailable> createState() => _CouponsAvailableState();
}

class _CouponsAvailableState extends State<CouponsAvailable> {
  bool isAvailable = true;
String ? imageBytes ;

  List<Availablecoupons> subList = [];
  Future<void> fetchPostData() async {

    final apiCall = Getavailcoupons();
    final  allavailData = await  apiCall.getAcoupons(
      phoneNumber:widget.phone,
      coupontype:widget.type,
      context: context,
    );
    setState(() {
      subList = allavailData  ;
    });
  }



  Future<void> _dialogBuilder(BuildContext context, {required String qR}) {
    return showDialog<void>(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Center(child: const Text('Scan to Claim coupon')),
          content:  QrImageView(
          data: qR,
          version: QrVersions.auto,
          // size: double.infinity,
        ),
          actions: <Widget>[
            // TextButton(
            //   style: TextButton.styleFrom(
            //     textStyle: Theme.of(context).textTheme.labelLarge,
            //   ),
            //   child: const Text('Disable'),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //     textStyle: Theme.of(context).textTheme.labelLarge,
            //   ),
            //   child: const Text('Enable'),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
          ],
        );
      },
    );
  }












  @override
  void initState() {
    fetchPostData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<Availablecoupons> listData = [];
    if (subList.length >= 2){

      listData = subList.sublist(0,2);

    }else{
      listData = subList;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coupons',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: greens,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                 '${widget.type} Coupons',
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
                          builder: (context) =>  CouponsUsed(phone:widget.phone,type: widget.type),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var items in listData)

                      GestureDetector(

                        onTap :()=>_dialogBuilder(context,qR:items.qrId),

                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            padding: const EdgeInsets.all(
                                4.0), // Adjust padding as needed
                            height: 170.0,
                            width: 180.0,


                            child: QrImageView(
                              data: items.qrId,
                              version: QrVersions.auto,
                              size: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 30,
                      // ),
                      // Column(
                      //   children: [
                      //     Container(
                      //       padding: const EdgeInsets.all(
                      //           8.0), // Adjust padding as needed
                      //       height: 145.0,
                      //       width: 150.0,
                      //       child: QrImageView(
                      //         data: '0987654321',
                      //         version: QrVersions.auto,
                      //         size: double.infinity,
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       height: 8, // Adjust the height as needed
                      //     ),
                      //     Align(
                      //       alignment: Alignment.bottomCenter,
                      //       child: Text(
                      //         'Coupon 2',
                      //         style: GoogleFonts.montserrat(
                      //           fontSize: 14, // Adjust the font size as needed
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),

                // const SizedBox(
                //   height: 30,
                //   width: 30,
                // ),
                // const Qrcustomwidget(),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,

                  child: Padding(
                    padding: const EdgeInsets.all(25.0),

                    child: GridView.builder(

                      itemCount: subList.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 30),
                      itemBuilder: (context, index) => const Qrcustomwidget(),
                    ),
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
