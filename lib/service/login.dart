// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_frontend/pages/home.dart';

import '../bottomnavigationbar/bottom_nav_bar.dart';
import '../constants/global_variables.dart';
import '../constants/headers.dart';
import '../constants/utilities.dart';

class Login{


  Future<void> login({

    required String ? mobileNumber,
    required String ? password,

    required context,
  }) async {
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/login';


    // Create a FormData object

    FormData formData = FormData.fromMap({
      'phone_number':mobileNumber,
      'password':password,

    });

    print(apiUrl);

    Dio dio = Dio();
    Response response = await dio.post(
      apiUrl,
      data: formData,
      options: Options(
        headers:ApplicationHeader,
      ),
    );


    if (response.statusCode == 200  ) {
      // Handle a successful response

      if(response.data['status']== "1") {

        print('API response: ${response.data}');
        var message=response.data['response'];
        var message_two=message['data'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var userId= message_two['userid'];
        var phoneNumber= message_two['phone'];
        var branch =message_two['customerbranch'];

        await prefs.setString("jsId", "$userId");
        await prefs.setString("mobileNumber", "$phoneNumber");
        await prefs.setString("branchCode", "$branch");


        GoRouter.of(context).goNamed(RoutePaths.home);


      }else{
        showCustomSnackBar(
          context: context,
          text:response.data['response'].toString(),
        );
      }

    } else {
      // Handle errors here
      print('API request failed with status code ${response.statusCode}');
    }
  }

}