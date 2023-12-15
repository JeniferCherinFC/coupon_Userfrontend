
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/global_variables.dart';
import '../constants/headers.dart';
import '../constants/utilities.dart';
import '../model/home.dart';

class Dashboard{


  Future<Coupon?> getDashboard({
    required String ? mobileNumber,
    required context,
  }) async {

    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/getcoupondetails';

    Coupon? dataList;


    // Create a FormData object
    FormData formData = FormData.fromMap({
      'phone_number':mobileNumber,
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


            dataList =  Coupon(
            totalAvail: message_two['totalAvailable'],
        totalUsed: message_two['totalUsed'],
        bAvail: message_two['bAvailable'],
        bUsed: message_two['bUsed'],
        lAvail: message_two['lAvailable'],
        lUsed: message_two['lUsed'],
        dAvail: message_two['dAvailable'],
        dUsed: message_two['dUsed']

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
    return dataList;
  }

}