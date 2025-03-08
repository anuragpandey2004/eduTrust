import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_list_view/search_university.dart';
import 'package:flutter_list_view/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;

class OtpProvider extends ChangeNotifier {
  String mobileNumber = '';
  String otpValue = '';

  getphoneNumber(String phoneNumber) {
    mobileNumber = phoneNumber;
  }


  getotp(String otp) {
    otpValue = otp;
  }

  printnumber() {
    print('number $mobileNumber');
  }

  Future postRequestOtp() async {
    
    Uri url = Uri.parse('http://18.188.180.197:9000/v1/login/initiate');

   try{
     final response = await http.post(url,
        body: jsonEncode({'contactNumber': mobileNumber}));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print('Response: ${data['message']}');
    } else {
      print('Error: ${response.reasonPhrase}');
    }
   }
   catch(e){
         print('Error: $e');
   }
  }

  Future postRequestLogin(BuildContext context) async {
    
    Uri url = Uri.parse('http://18.188.180.197:9000/v1/login/verify');
   try{ final response = await http.post(url,
        body: jsonEncode(
            {"contactNumber": mobileNumber, 'otp': otpValue}));
    // SharedPreferences shairedPrif = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

     // print("Response ${data['message']}");
      //print("Access token =>${data['accessToken']}");
      String accesstoken = data['accessToken'];
       // await SharedPrefs().setString("token", accesstoken);
        await SharedPrefs().setString("token", accesstoken);
        await SharedPrefs().setString("phone", mobileNumber);
           whereToGo(context);
       
    }
    else {
         ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.body.toString()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
        print('OTP verification failed: ${response.body}');
        // Show the SnackBar directly if OTP is invalid
       // showErrorMessage(context, 'Invalid OTP or session expired.');
      }
    }
    catch(e){
    print("Error $e");
    }
    notifyListeners();
  }

  ///shaired prifarance
  
  Future whereToGo(BuildContext  context) async {
    // SharedPreferences shairedPrif = await SharedPreferences.getInstance();
    // String? logintoken = shairedPrif.getString('token');
        String? logintoken = await SharedPrefs().getString('token');
    if (
    logintoken != null && logintoken.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SearchUniversityScreen()),
        (route) => false,
      );
    } else {
   //  showErrorMessage(context,'Invalid OTP or session expired.');

          ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid OTP or session expired.'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
    print('error');
    }
  }
//   void showErrorMessage (BuildContext context, String message){
// ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.red,
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
}
