import 'package:flutter_list_view/utils/shared_prefs.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl = 'http://18.188.180.197:9000/v1';

  Future getApi(String urlEndPoint) async {
    try {
      // SharedPreferences shairedPrif = await SharedPreferences.getInstance();
      // String? logintoken = shairedPrif.getString('token').toString();
      // String? logintoken = await SharedPrefs().getString('token');
      // String? logintoken = await SharedPrefs().getString('token');

      String? logintoken = await SharedPrefs().getString('token');
      Uri url = Uri.parse('$baseUrl$urlEndPoint');

      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $logintoken',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error: ${response.statusCode},');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error in ApiServices: $e');
    }
  }

  ///post api for formType data
  Future postApi(String urlEndPoint, Map<String, dynamic> body) async {
    try {
      String baseUrl = 'http://18.188.180.197:9000/v1';
      String? logintoken = await SharedPrefs().getString('token');
      Uri url = Uri.parse('$baseUrl$urlEndPoint');
      var response = await http.post(url,
          headers: {
            'Authorization': 'Bearer $logintoken',
          },
          body: body);
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        print('Error: ${response.statusCode},');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error in ApiServices: $e');
    }
  }
}
