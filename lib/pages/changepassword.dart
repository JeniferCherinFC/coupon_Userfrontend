import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_frontend/constants/colors.dart';
import 'package:user_frontend/pages/profilesetting.dart';

import '../constants/utilities.dart';
import '../service/commonservice.dart';


class ChangePWD extends StatefulWidget {
  const ChangePWD({Key? key}) : super(key: key);

  @override
  State<ChangePWD> createState() => _ChangePWDState();
}

class _ChangePWDState extends State<ChangePWD> {
   TextEditingController newPasswordController = TextEditingController();
   TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key to validate the form
  bool _isPasswordHidden = true; // Track the visibility state for new password
  bool _confirmPasswordEnabled =
      false; // Track the enable state for confirm password



  void _onOkPressed() {
    if (_formKey.currentState?.validate() ?? false) {

      String newPassword = newPasswordController.text;
      String confirmPassword = confirmPasswordController.text;

      if (newPassword == confirmPassword) {
        userchpass();
      } else {
        showCustomSnackBar(
          context: context,
          text:"Passwords do not match",
        );
      }
    }
  }

     String ? mobileNumber;

  Changepass chpassword= Changepass();
  String? userId;

  userchpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobileNumber = prefs.getString("mobileNumber");

    chpassword.changepassword(

      mobileNumber: mobileNumber,
      password:confirmPasswordController.text,
      context: context,
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change password',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: newPasswordController,
                    obscureText: _isPasswordHidden,
                    onChanged: (value) {
                      setState(() {
                        _confirmPasswordEnabled = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "New Password",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greens,
                          width: 2.5,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greens,
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          8), // Limit the input to 8 characters
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length != 8) {
                        return 'Password must be exactly 8 characters';
                      } else if (!RegExp(r'(?=.*[A-Z])(?=.*\d)')
                          .hasMatch(value)) {
                        return 'Password must contain at least one capital letter\n and one number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: confirmPasswordController,
                    obscureText: true,
                    enabled: _confirmPasswordEnabled,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greens,
                          width: 2.5,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greens,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (_confirmPasswordEnabled) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter confirm password';
                        } else if (newPasswordController.text != value) {
                          return 'Passwords do not match';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _onOkPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: greens,
                      minimumSize: const Size(140, 40),
                    ),
                    child: Text(
                      'Save ',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
