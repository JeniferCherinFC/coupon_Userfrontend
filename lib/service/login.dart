import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_frontend/pages/home.dart';

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
    final String apiUrl = '$baseUrl/api/login';


    // Create a FormData object

    FormData formData = FormData.fromMap({
      'mobileNumber':mobileNumber,
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
        var message_two=message['user'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var user= message_two['jsId'];
        var mobileNumber= message_two['mobileNumber'];
        await prefs.setString("jsId", "$user");
        await prefs.setString("mobileNumber", "$mobileNumber");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
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