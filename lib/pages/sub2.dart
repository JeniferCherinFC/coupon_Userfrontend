import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/constants/colors.dart';
import 'package:user_frontend/custom/custom_subscription.dart';
import 'package:user_frontend/model/common.dart';

import '../service/commonservice.dart';


class Sub extends StatefulWidget {
  const Sub({Key? key}) : super(key: key);

  @override
  State<Sub> createState() => _SubState();
}

class _SubState extends State<Sub> {

  String ? mobileNumber;
  List<Subscription> subList = [];

  Future<void> fetchsubData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobileNumber = prefs.getString("mobileNumber");
    final apiCall = GetSubscription();
    final allSubdata = await apiCall.getsubscription(

      context: context, phoneNumber: mobileNumber,
    );
    setState(() {
      subList = allSubdata;
    });

  }

  @override
  void initState() {
    fetchsubData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscriptions',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: greens,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).pop(); // Navigate back
        //   },
        // ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
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

             SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child: Column(
                  children: [
                    SizedBox(height: 10,),
                    for (var items in subList )
                    SubscriptionDetailsContainer(
                      subscriptionID:items.subId,
                      dateOfPurchase: items.dop,
                      subscriptionType: items.couponType,
                      branch: items.branch,
                    ),
                  ],
              ),

            ),

            ],
          ),
        ),
      ),
    );
  }
}
