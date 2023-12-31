import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_frontend/constants/colors.dart';



class SubscriptionDetailsContainer extends StatelessWidget {
  final String subscriptionID;
  final String dateOfPurchase;
  final String subscriptionType;
  final String branch;

  const SubscriptionDetailsContainer({
    Key? key,
    required this.subscriptionID,
    required this.dateOfPurchase,
    required this.subscriptionType,
    required this.branch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 350,
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        // borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Subscription ID',
                    style: GoogleFonts.commissioner(
                      color: greens,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ':  $subscriptionID',
                    style: GoogleFonts.commissioner(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'DOP:',
                    style: GoogleFonts.commissioner(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    dateOfPurchase,
                    style: GoogleFonts.commissioner(
                      color: greens,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Type:',
                    style: GoogleFonts.commissioner(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subscriptionType,
                    style: GoogleFonts.commissioner(
                      color: greens,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Branch:',
                    style: GoogleFonts.commissioner(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    branch,
                    style: GoogleFonts.commissioner(
                      color: greens,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_drop_down_sharp,
            size: 24,
            color: greens,
          ),
        ],
      ),
    );
  }
}
