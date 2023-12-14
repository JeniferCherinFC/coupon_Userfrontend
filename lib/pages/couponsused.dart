// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/pages/couponsavail.dart';

// import 'package:intl/intl.dart';

class CouponsUsed extends StatefulWidget {
  const CouponsUsed({Key? key}) : super(key: key);

  @override
  State<CouponsUsed> createState() => _CouponsUsedState();
}

class _CouponsUsedState extends State<CouponsUsed> {
  bool isUsed = true;

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
                            builder: (context) => const CouponsAvailable(),
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
                  Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: GridView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30),
                        itemBuilder: (context, index) {
                          final currentDate =
                              DateTime.now().add(Duration(days: index));
                          return Qrcustomwidget(
                            date: currentDate,
                          );
                        },
                      )),
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
  final DateTime date;

  const Qrcustomwidget({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('d MMM yy').format(date);

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
        ],
      ),
      child: Column(
        children: [
          QrImageView(
            data: 'This is a simple QR code',
            version: QrVersions.auto,
            gapless: false,
          ),
          const SizedBox(height: 10),
          Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
