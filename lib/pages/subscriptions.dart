import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/constants/colors.dart';
import 'package:user_frontend/custom/custom_subscription.dart';


class Subscriptions extends StatefulWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(RoutePaths.home);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Your ',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Subscriptions',
                          style: GoogleFonts.montserrat(
                            color: greens,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const SubscriptionDetailsContainer(
                  subscriptionID: '5678ADF5',
                  dateOfPurchase: '4 Dec 23',
                  subscriptionType: 'Lunch',
                  branch: 'Velachery',
                ),
                const SizedBox(height: 20),
                const SubscriptionDetailsContainer(
                  subscriptionID: '1234XYZ',
                  dateOfPurchase: '5 Dec 23',
                  subscriptionType: 'Dinner',
                  branch: 'Thiruvanmiyur',
                ),
                const SizedBox(height: 20),
                const SubscriptionDetailsContainer(
                  subscriptionID: '7890ABC',
                  dateOfPurchase: '6 Dec 23',
                  subscriptionType: 'Breakfast',
                  branch: 'Velachery',
                ),
                const SizedBox(height: 20),
                const SubscriptionDetailsContainer(
                  subscriptionID: '4567LMN',
                  dateOfPurchase: '7 Dec 23',
                  subscriptionType: 'BreakFast',
                  branch: 'Guindy',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
