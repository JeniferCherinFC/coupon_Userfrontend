
import 'dart:convert';
import 'dart:typed_data';
// import 'dart:io' as Io;
// import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_frontend/model/common.dart';
// import '../bottomnavigationbar/bottom_nav_bar.dart';
import '../constants/global_variables.dart';
import '../constants/headers.dart';
import '../constants/utilities.dart';
// import '../pages/login.dart';
import '../pages/profilesetting.dart';

class Changepass{


  Future<void> changepassword({

    required String ? mobileNumber,
    required String ? password,
    required context,
  }) async {
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/changepassword';

    FormData formData = FormData.fromMap({
      'phone_number':mobileNumber,
      'newpassword':password,

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
        showCustomSnackBar(
          context: context,
          text:message.toString(),
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
            const ProfileSetting(), // Replace with your actual profile page
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


class GetSubscription {
  Future<List<Subscription>> getsubscription({
    required String ? phoneNumber,
    required context,
  }) async {
    List<Subscription> dataList = [];
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/getSubdetails';
    print(apiUrl);

    FormData formData = FormData.fromMap({
      'phone_number':phoneNumber,
    });
    Dio dio = Dio();
    Response response = await dio.post(
      apiUrl,
      data: formData,
      options: Options(
        headers:ApplicationHeader,
      ),

    );

    if (response.statusCode == 200) {
      // Handle a successful response
      if (response.data['status'] == "1") {
        print('API response: ${response.data}');
        var message = response.data['response'];
        var subDetails = message['data'];
        for (var itemData in subDetails) {
          String subId = itemData['subId'].toString();
          String dop = itemData['dop'].toString();
          String couponType = itemData['coupontype'].toString();
          String branch = itemData['branch'].toString();
          String sDate = itemData['sDate'].toString();
          String eDate = itemData['eDate'].toString();

          dataList.add(
            Subscription(
                subId:subId,
                dop: dop,
                couponType: couponType,
                branch: branch,
                sDate: sDate,
                eDate: eDate
            ),

          );
        }
      } else {
        showCustomSnackBar(
          context: context,
          text: response.data['response'].toString(),
        );
      }
    } else {
      // Handle errors here
      print('API request failed with status code ${response.statusCode}');
    }
    return dataList;
  }
}


class Getavailcoupons {
  Future<List<Availablecoupons>> getAcoupons({
    required String ? phoneNumber,
    required String ? coupontype,

    required context,
  }) async {
    List<Availablecoupons> dataList = [];
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/getAcoupons';
    print(apiUrl);

    FormData formData = FormData.fromMap({
      'phone_number':phoneNumber,
      'coupon_type':coupontype
    });
    Dio dio = Dio();
    Response response = await dio.post(
      apiUrl,
      data: formData,
      options: Options(
        headers:ApplicationHeader,
      ),

    );

    if (response.statusCode == 200) {
      print(response.data);
      // Handle a successful response
      if (response.data['status'] == "1") {
        print('API response: ${response.data}');
        var message = response.data['response'];
        var availDetails = message['data']['details'];
        var totalavail = message['data']['totalAvailable'];




        for (var itemData in availDetails) {
          String qrId = itemData['qrId'].toString();
          String QR = itemData['QR'].toString();


   var  data = Uri.parse(QR).data;



// Will returns your image as Uint8List
          Uint8List? bytes = data?.contentAsBytes();


          // Uint8List bytes = base64.decode(QR.split(',').last);

          dataList.add(
            Availablecoupons(
                qrId:qrId,
                QR: QR,
               bytes :bytes,
               avail: totalavail,

            ),

          );
        }
      } else {
        showCustomSnackBar(
          context: context,
          text: response.data['response'].toString(),
        );
      }
    } else {
      // Handle errors here
      print('API request failed with status code ${response.statusCode}');
    }


    return dataList;
  }
}

class Getusedcoupons {
  Future<List<Usedcoupons>> getUcoupons({
    required String ? phoneNumber,
    required String ? coupontype,

    required context,
  }) async {
    List<Usedcoupons> dataList = [];
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/getUcoupons';
    print(apiUrl);

    FormData formData = FormData.fromMap({
      'phone_number':phoneNumber,
      'coupon_type':coupontype
    });
    Dio dio = Dio();
    Response response = await dio.post(
      apiUrl,
      data: formData,
      options: Options(
        headers:ApplicationHeader,
      ),

    );

    if (response.statusCode == 200) {
      print(response.data);
      // Handle a successful response
      if (response.data['status'] == "1") {
        print('API response: ${response.data}');
        var message = response.data['response'];
        var availDetails = message['data']['details'];
        var totalavail = message['data']['totalUsed'];



        for (var itemData in availDetails) {
          String qrId = itemData['qrId'].toString();
          String QR =      itemData['QR'].toString();
          String claimeddate = itemData['claimeddate'].toString();

       // Uint8List base64Decode(String QR) => base64.decode(itemData['QR']);



          dataList.add(
            Usedcoupons(
              qrId:qrId,
              QR: QR,
              avail:  totalavail,
              claimeddate: claimeddate,

            ),

          );
        }
      } else {
        showCustomSnackBar(
          context: context,
          text: response.data['response'].toString(),
        );
      }
    } else {
      // Handle errors here
      print('API request failed with status code ${response.statusCode}');
    }
    return dataList;
  }
}
class Base64Image extends StatelessWidget {
  final String base64String;

  Base64Image(this.base64String);

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.cover,
    );
  }
}