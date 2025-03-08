import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/university_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UniversityDetailsProvider extends ChangeNotifier {
  String? universityIDs;
  UniversityDetailsById? universityDetailsById;
  bool isLoading =true;
  

  getuniversityId(String universityID) {
    universityIDs = universityID;
  }

  Future getUniversityDetailsByUniversityID() async {
    SharedPreferences shairedPrif = await SharedPreferences.getInstance();
    String? logintoken = shairedPrif.getString('token').toString();

    Uri url =
        Uri.parse('http://18.188.180.197:9000/v1/university/$universityIDs');
    print(universityIDs);
  
    try{
      var getResponse =
        await http.get(url, headers: {'Authorization': 'Bearer $logintoken'});
    if (getResponse.statusCode == 200) {
      universityDetailsById = universityDetailsByIdFromJson(getResponse.body);
      // print(universityDetailsById!.country.toString());
    } else {
      print('getUniversityDetailsByUniversityID=> error');
    }
    }
    catch(e){
      print('Error:$e');
    }
  }
}
