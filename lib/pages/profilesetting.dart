import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';
import 'package:user_frontend/constants/colors.dart';
import 'package:user_frontend/custom/custom_profilesetting.dart';
import 'package:user_frontend/pages/changepassword.dart';
import 'package:user_frontend/pages/editprofile.dart';
import 'package:user_frontend/pages/login.dart';
import 'package:user_frontend/pages/subscriptions.dart';
import 'package:user_frontend/pages/terms_conditions.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout !',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: greens,
            ),
          ),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // OK
              },
              child: Text(
                'ok',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(RoutePaths.home);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 193,
                  width: 900,
                  color: greens,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 100, // Adjust the top position to your liking
                        child: Text(
                          'Profile',
                          style: GoogleFonts.commissioner(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 140,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Color.fromARGB(255, 163, 223, 171),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomSetting(
                  text: 'Edit profile',
                  icon: Icons.person_outline,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Editprofile(),
                      ),
                    );
                  },
                ),
                CustomSetting(
                  text: 'Terms & conditions',
                  icon: Icons.description_outlined,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsConditions(),
                      ),
                    );
                  },
                ),
                CustomSetting(
                  text: 'Change password',
                  icon: Icons.lock_outlined,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePWD(),
                      ),
                    );
                  },
                ),
                CustomSetting(
                  text: 'Subscription',
                  icon: Icons.bookmark_outline,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Subscriptions(),
                      ),
                    );
                  },
                ),
                CustomSetting(
                  text: 'Logout',
                  icon: Icons.logout_outlined,
                  onPressed: () async {
                    // Show logout confirmation dialog
                    bool? logoutConfirmed =
                        await _showLogoutConfirmationDialog(context);
      
                    // If the user confirms logout, navigate to the sign-in page
                    if (logoutConfirmed == true) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
