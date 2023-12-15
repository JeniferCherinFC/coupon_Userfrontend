// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/pages/couponsavail.dart';

import '../constants/colors.dart';
import '../model/common.dart';
import '../service/commonservice.dart';

// import 'package:intl/intl.dart';

class CouponsUsed extends StatefulWidget {
  final String ? phone;
  final String ? type;
  const CouponsUsed({Key? key, this.phone, this.type}) : super(key: key);

  @override
  State<CouponsUsed> createState() => _CouponsUsedState();
}

class _CouponsUsedState extends State<CouponsUsed> {
  bool isUsed = true;
  List<Usedcoupons> subList = [];


  Future<void> fetchPostData() async {

    final apiCall = Getusedcoupons();
    final  allusedData = await  apiCall.getUcoupons(
      phoneNumber:widget.phone,
      coupontype:widget.type,
      context: context,
    );
    setState(() {
      subList = allusedData  ;

    });
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
    return Scaffold(
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
                    // ignore: dead_code
                    initialLabelIndex: isUsed ? 1 : 0,
                    minHeight: 30.0,
                    cornerRadius: 5,
                    minWidth: 110.0,
                    activeBgColor: const [Color.fromRGBO(209, 46, 52, 1)],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: const Color.fromRGBO(43, 135, 97, 1),
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
                          builder: (context) =>  CouponsAvailable(phone: widget.phone, type: widget.type,),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 30,
                  width: 30,
                ),
                ///////////////////////////////////////////////////////////////////////////////
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
