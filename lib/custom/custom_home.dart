import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/constants/colors.dart';



class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String statusText1;
  final String statusValue1;
  final Color statusColor1;
  final String statusText2;
  final String statusValue2;
  final Color statusColor2;
  final String labelText;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.statusText1,
    required this.statusValue1,
    required this.statusColor1,
    required this.statusText2,
    required this.statusValue2,
    required this.statusColor2,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap event using GoRouter
        GoRouter.of(context).goNamed(RoutePaths.availableCoupon);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: greens,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: SizedBox(
          width: 317,
          height: 130,
          child: Stack(
            children: [
              // Left side: Image
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    40.0, 30, 0, 0), // Adjust the left value
                child: SizedBox(
                  height: 73,
                  width: 91,
                  // child: SvgPicture.asset(
                  child: Image.asset(
                    imagePath,
                    height: 73, // Specify the same height as the Container
                    width: 91, // Specify the same width as the Container
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 8,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: greens,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),

              SizedBox(
                height: 130,
                child: Container(
                  width: 25,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(111, 207, 151, 0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: Text(
                        labelText, // Use the dynamic text here
                        style: GoogleFonts.montserrat(
                          color: greens,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Right side: Two sets of containers
              Positioned(
                top: 0,
                right: 40,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 23.0,
                      width: 120.0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                ),
                                border: Border.all(
                                  color: statusColor1,
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  statusText1,
                                  style: GoogleFonts.montserrat(
                                    color: statusColor1,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: statusColor1,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                                border: Border.all(
                                  color: statusColor1,
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  statusValue1,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 23.0,
                      width: 120.0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                ),
                                border: Border.all(
                                  color: statusColor2,
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  statusText2,
                                  style: GoogleFonts.montserrat(
                                    color: statusColor2,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: statusColor2,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                                border: Border.all(
                                  color: statusColor2,
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  statusValue2,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                left: 280,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.qr_code,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
