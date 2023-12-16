// ignore_for_file: unused_local_variable

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';

import '../constants/colors.dart';
import '../custom/custom_home.dart';
import '../model/home.dart';
import '../service/homeservice.dart';
import 'couponsavail.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String ? mobileNumber;
  Coupon? totalAvailable ;



  Future<void> fetchPostData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobileNumber = prefs.getString("mobileNumber");

    final apiCall = Dashboard();
    final  alldashboardData = await  apiCall.getDashboard(
      mobileNumber:mobileNumber,
      context: context,
    );
    setState(() {
      totalAvailable = alldashboardData  ;
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
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'I',
                            style: GoogleFonts.montserrat(
                                color: greens,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: 'dly ',
                          style: GoogleFonts.montserrat(
                              color: const Color.fromRGBO(38, 50, 56, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'V',
                          style: GoogleFonts.montserrat(
                              color: greens,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'ada ',
                          style: GoogleFonts.montserrat(
                              color: const Color.fromRGBO(38, 50, 56, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'S',
                          style: GoogleFonts.montserrat(
                              color: greens,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'ambar',
                          style: GoogleFonts.montserrat(
                              color: const Color.fromRGBO(38, 50, 56, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      color: greens,
                      child: const Icon(Icons.person_2_outlined,
                          color: Colors.white, size: 20.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              ///////////////////////////////////////////////////////////////////////////////////////////////////////

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 36.0,
                    width: 149.0, // Total width of the container
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7, // Represents 70% of the width
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                              border: Border.all(
                                color: greens, // Set the border color to green
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Total Available \n Coupons',
                                style: GoogleFonts.montserrat(
                                    color: greens,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3, // Represents 30% of the width
                          child: Container(
                            decoration: BoxDecoration(
                              color: greens,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                              border: Border.all(
                                color: greens, // Set the border color to green
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${totalAvailable?.totalAvail ?? "0"}",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 36.0,
                    width: 149.0, // Total width of the container
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7, // Represents 70% of the width
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                              border: Border.all(
                                color: redish, // Set the border color to green
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Total Used \n Coupons',
                                style: GoogleFonts.montserrat(
                                    color: redish,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3, // Represents 30% of the width
                          child: Container(
                            decoration: BoxDecoration(
                              color: redish,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                              border: Border.all(
                                color: redish, // Set the border color to green
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: Center(
                              child: Text(
                                  "${totalAvailable?.totalUsed ?? "0"}",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) =>  CouponsAvailable(phone:mobileNumber,type:"Breakfast")));

                },
                child: CustomCard(
                  imagePath: 'lib/images/breakfast.png',
                  title: 'Breakfast',
                  statusText1: 'Available',
                  statusValue1: "${totalAvailable?.bAvail ?? "0"}",
                  statusColor1: greens,
                  statusText2: 'Used',
                  statusValue2:  "${totalAvailable?.bUsed ?? "0"}",
                  statusColor2: redish,
                  labelText: 'Breakfast',
                ),
              ),

              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) =>  CouponsAvailable(phone:mobileNumber,type:"Lunch")));

                },
                child: CustomCard(
                  imagePath: 'lib/images/lunch.png',
                  title: 'Lunch',
                  statusText1: 'Available',
                  statusValue1: "${totalAvailable?.lAvail ?? "0"}",
                  statusColor1: greens,
                  statusText2: 'Used',
                  statusValue2:  "${totalAvailable?.lUsed?? "0"}",
                  statusColor2: redish,
                  labelText: 'Lunch',
                ),
              ),

              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => CouponsAvailable(phone:mobileNumber,type:"Dinner")));

                },
                child: CustomCard(
                  imagePath: 'lib/images/dinner.png',
                  title: 'Dinner',
                  statusText1: 'Available',
                  statusValue1: "${totalAvailable?.dAvail ?? "0"}",
                  statusColor1: greens,
                  statusText2: 'Used',
                  statusValue2: "${totalAvailable?.dUsed ?? "0"}",
                  statusColor2: redish,
                  labelText: 'Dinner',
                ),
              ),
              const SizedBox(height: 25),

              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

              // InkWell(
              //   onTap: () {
              //     GoRouter.of(context).goNamed(RoutePaths.subscription);
              //   },
              //   child: Card(
              //     elevation: 0,
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //     ),
              //     child: SizedBox(
              //       width: 317,
              //       height: 130,
              //       child: Stack(
              //         children: [
              //           // Background Image
              //           SvgPicture.asset(
              //             'lib/images/card1.svg',
              //             width: 350,
              //             height: 150,
              //             fit: BoxFit.cover,
              //           ),
              //
              //           SizedBox(
              //             height: 130,
              //             child: Container(
              //               width: 25,
              //               height: double.infinity,
              //               decoration: const BoxDecoration(
              //                 color: Color.fromRGBO(111, 207, 151, 0.67),
              //                 borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(7.0),
              //                   bottomLeft: Radius.circular(7.0),
              //                 ),
              //               ),
              //               child: RotatedBox(
              //                 quarterTurns: 3,
              //                 child: Center(
              //                   child: Text(
              //                     'Subscriptions',
              //                     style: GoogleFonts.montserrat(
              //                       color: Colors.white,
              //                       fontSize: 11,
              //                       fontWeight: FontWeight.w500,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //
              //           Padding(
              //             padding:
              //                 const EdgeInsets.fromLTRB(40.0, 20.0, 8.0, 8.0),
              //             child: Column(
              //               children: [
              //                 Row(
              //                   children: [
              //                     const Text(
              //                       '*',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                         fontWeight: FontWeight.w600,
              //                         color: Color.fromRGBO(42, 243, 126, 1),
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       width: 7,
              //                     ),
              //                     const SizedBox(
              //                       width: 100,
              //                       child: Text(
              //                         'Breakfast',
              //                         style: TextStyle(
              //                           fontSize: 9,
              //                           fontWeight: FontWeight.w600,
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //                     ),
              //
              //                     // Container with color
              //                     SizedBox(
              //                       width: 152.0,
              //                       height: 23,
              //                       child: Row(
              //                         children: [
              //                           Expanded(
              //                             flex: 3,
              //                             child: Container(
              //                               decoration: BoxDecoration(
              //                                 color: Colors.white,
              //                                 borderRadius:
              //                                     const BorderRadius.only(
              //                                   topLeft: Radius.circular(5.0),
              //                                   bottomLeft:
              //                                       Radius.circular(5.0),
              //                                 ),
              //                                 border: Border.all(
              //                                   color: greens,
              //                                   width: 2.0,
              //                                 ),
              //                               ),
              //                               child: Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.center,
              //                                 children: [
              //                                   Text(
              //                                     'start date',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: greens,
              //                                       fontSize: 7,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                   const SizedBox(
              //                                     height: 1,
              //                                   ),
              //                                   Text(
              //                                     '01 Dec 2023',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: greens,
              //                                       fontSize: 5,
              //                                       fontWeight:
              //                                           FontWeight.normal,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                           Expanded(
              //                             flex: 3,
              //                             child: Container(
              //                               decoration: BoxDecoration(
              //                                 color: greens,
              //                                 borderRadius:
              //                                     const BorderRadius.only(
              //                                   topRight: Radius.circular(5.0),
              //                                   bottomRight:
              //                                       Radius.circular(5.0),
              //                                 ),
              //                                 border: Border.all(
              //                                   color: greens,
              //                                   width: 2.0,
              //                                 ),
              //                               ),
              //                               child: Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.center,
              //                                 children: [
              //                                   Text(
              //                                     'End date',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: Colors.white,
              //                                       fontSize: 7,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                   const SizedBox(
              //                                     height: 1,
              //                                   ),
              //                                   Text(
              //                                     '30 Dec 2023',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: Colors.white,
              //                                       fontSize: 5,
              //                                       fontWeight:
              //                                           FontWeight.normal,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 const SizedBox(height: 10),
              //                 Row(
              //                   children: [
              //                     const Text(
              //                       '*',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                         fontWeight: FontWeight.w600,
              //                         color: Color.fromRGBO(42, 243, 126, 1),
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       width: 7,
              //                     ),
              //                     const SizedBox(
              //                       width: 100,
              //                       child: Text(
              //                         'Lunch',
              //                         style: TextStyle(
              //                           fontSize: 9,
              //                           fontWeight: FontWeight.w600,
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //                     ),
              //
              //                     // Container with color
              //                     SizedBox(
              //                       width: 152.0,
              //                       height: 23,
              //                       child: Row(
              //                         children: [
              //                           Expanded(
              //                             flex: 3,
              //                             child: Container(
              //                               decoration: BoxDecoration(
              //                                 color: Colors.white,
              //                                 borderRadius:
              //                                     const BorderRadius.only(
              //                                   topLeft: Radius.circular(5.0),
              //                                   bottomLeft:
              //                                       Radius.circular(5.0),
              //                                 ),
              //                                 border: Border.all(
              //                                   color: greens,
              //                                   width: 2.0,
              //                                 ),
              //                               ),
              //                               child: Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.center,
              //                                 children: [
              //                                   Text(
              //                                     'start date',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: greens,
              //                                       fontSize: 7,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                   const SizedBox(
              //                                     height: 1,
              //                                   ),
              //                                   Text(
              //                                     '01 Dec 2023',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: greens,
              //                                       fontSize: 5,
              //                                       fontWeight:
              //                                           FontWeight.normal,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                           Expanded(
              //                             flex: 3,
              //                             child: Container(
              //                               decoration: BoxDecoration(
              //                                 color: greens,
              //                                 borderRadius:
              //                                     const BorderRadius.only(
              //                                   topRight: Radius.circular(5.0),
              //                                   bottomRight:
              //                                       Radius.circular(5.0),
              //                                 ),
              //                                 border: Border.all(
              //                                   color: greens,
              //                                   width: 2.0,
              //                                 ),
              //                               ),
              //                               child: Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.center,
              //                                 children: [
              //                                   Text(
              //                                     'End date',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: Colors.white,
              //                                       fontSize: 7,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                   const SizedBox(
              //                                     height: 1,
              //                                   ),
              //                                   Text(
              //                                     '30 Dec 2023',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: Colors.white,
              //                                       fontSize: 5,
              //                                       fontWeight:
              //                                           FontWeight.normal,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 const SizedBox(height: 10),
              //                 Row(
              //                   children: [
              //                     const Text(
              //                       '*',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                         fontWeight: FontWeight.w600,
              //                         color: Color.fromRGBO(42, 243, 126, 1),
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       width: 7,
              //                     ),
              //                     const SizedBox(
              //                       width: 100,
              //                       child: Text(
              //                         'Dinner',
              //                         style: TextStyle(
              //                           fontSize: 9,
              //                           fontWeight: FontWeight.w600,
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //                     ),
              //
              //                     // Container with color
              //                     SizedBox(
              //                       width: 152.0,
              //                       height: 23,
              //                       child: Row(
              //                         children: [
              //                           Expanded(
              //                             flex: 3,
              //                             child: Container(
              //                               decoration: BoxDecoration(
              //                                 color: Colors.white,
              //                                 borderRadius:
              //                                     const BorderRadius.only(
              //                                   topLeft: Radius.circular(5.0),
              //                                   bottomLeft:
              //                                       Radius.circular(5.0),
              //                                 ),
              //                                 border: Border.all(
              //                                   color: greens,
              //                                   width: 2.0,
              //                                 ),
              //                               ),
              //                               child: Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.center,
              //                                 children: [
              //                                   Text(
              //                                     'start date',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: greens,
              //                                       fontSize: 7,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                   const SizedBox(
              //                                     height: 1,
              //                                   ),
              //                                   Text(
              //                                     '01 Dec 2023',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: greens,
              //                                       fontSize: 5,
              //                                       fontWeight:
              //                                           FontWeight.normal,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                           Expanded(
              //                             flex: 3,
              //                             child: Container(
              //                               decoration: BoxDecoration(
              //                                 color: greens,
              //                                 borderRadius:
              //                                     const BorderRadius.only(
              //                                   topRight: Radius.circular(5.0),
              //                                   bottomRight:
              //                                       Radius.circular(5.0),
              //                                 ),
              //                                 border: Border.all(
              //                                   color: greens,
              //                                   width: 2.0,
              //                                 ),
              //                               ),
              //                               child: Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.center,
              //                                 children: [
              //                                   Text(
              //                                     'End date',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: Colors.white,
              //                                       fontSize: 7,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                   const SizedBox(
              //                                     height: 1,
              //                                   ),
              //                                   Text(
              //                                     '30 Dec 2023',
              //                                     style: GoogleFonts.montserrat(
              //                                       color: Colors.white,
              //                                       fontSize: 5,
              //                                       fontWeight:
              //                                           FontWeight.normal,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}
