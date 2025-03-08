import 'package:flutter/material.dart';
//import 'package:flutter_list_view/model/university_by_city_id_model.dart';
import 'package:flutter_list_view/model/university_by_country_Name_model.dart';
import 'package:flutter_list_view/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenProvider extends ChangeNotifier {
  String? countryName;
  String? cityId;
  String? courseId;
  bool? topCity; //check which card is tab country,city or top courses
  bool isLoading = true;
  List<UnivertyByCountryName> UnivresitySearchByCountryName = [];
  List<UnivertyByCountryName> universityByCityId = [];
  List<UnivertyByCountryName> universityByCourseId = [];
  List <UnivertyByCountryName> universityList =[];
  
   String? universityListLength;
   bool isGridView = false;
   String? phone;
  //  setmobilenumber(String mobile){
    
  //  }
  void reset() {
    
    countryName = null;
    cityId = null;
    courseId = null;
    topCity = null;
    isLoading = true;
    UnivresitySearchByCountryName = [];
    universityByCityId = [];
    universityByCourseId = [];
    universityList = [];
    universityListLength = null;
    isGridView = false;
    
    notifyListeners();
  }
   getisGridView(bool gridView){
      isGridView = gridView;
      notifyListeners();
   }
 
  getCityID(String cityIDForUrl) {
    cityId = cityIDForUrl;
    notifyListeners();
  }
  getuniversityListLength(String universityList) {
    universityListLength = universityList;
    notifyListeners();
  }

  getCountryName(String countryNameForUrl) {
    countryName = countryNameForUrl;
  }

  getCourseId(String coursesId) {
    courseId = coursesId;
    notifyListeners();
  }

  getTopCity(bool? topCitys) {
    topCity = topCitys;
    notifyListeners();
  } // on what basis data will shown in home screen/check which card is tab country,city or top courses

  Future getUniversityByCountryName() async {
    SharedPreferences shairedPrif = await SharedPreferences.getInstance();
    String? logintoken = shairedPrif.getString('token').toString() ;
    Uri url = Uri.parse(
        'http://18.188.180.197:9000/v1/university/get-by-country/$countryName');
    try {
      var getResponse = await http.get(url, headers: {
        'Authorization': 'Bearer $logintoken',
      });
      if (getResponse.statusCode == 200) {
        UnivresitySearchByCountryName =
            univertyByCountryNameFromJson(getResponse.body);
      } else {
        print('getUniversityByCountryName Error');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future getUniversityByCityID() async {
    var data = await ApiServices().getApi('/university/get-by-city/$cityId');
    universityByCityId = univertyByCountryNameFromJson(data);
  }

  Future getUniversityByCourseID() async {
    var data =
        await ApiServices().getApi('/university/get-by-course/$courseId');
         universityByCourseId = univertyByCountryNameFromJson(data);
  }

  Future fatchData() async {
    isLoading = true;
    notifyListeners();
    if (topCity == false) {
      await getUniversityByCountryName();
      universityList=UnivresitySearchByCountryName;
      notifyListeners();
    } else if (topCity == true) {
      await getUniversityByCityID();
      universityList=universityByCityId;
      notifyListeners();
    } else {
      await getUniversityByCourseID();
      universityList=universityByCourseId;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  // Future getUniversityByCityID() async {
  //   SharedPreferences shairedPrif = await SharedPreferences.getInstance();
  //   String? logintoken = shairedPrif.getString('token').toString();
  //   Uri url = Uri.parse(
  //       'http://18.188.180.197:9000/v1/university/get-by-city/$cityId');
  //   try {
  //     var getResponse = await http.get(url, headers: {
  //       'Authorization': 'Bearer $logintoken',
  //     });
  //     if (getResponse.statusCode == 200) {
  //       print('=====0000+>${getResponse.body}}');

  //       universityByCityId = univertyByCountryNameFromJson(getResponse.body);
  //     } else {
  //       print('getuniversityByCityId error');
  //     }
  //   } catch (e) {
  //     print('Error:e');
  //   }
  // }

  // Future getUniversityByCourseID() async {
  //   SharedPreferences shairedPrif = await SharedPreferences.getInstance();
  //   String? logintoken = shairedPrif.getString('token').toString();
  //   Uri url = Uri.parse(
  //       'http://18.188.180.197:9000/v1/university/get-by-course/$courseId');

  //   try {
  //     var getResponse = await http.get(url, headers: {
  //       'Authorization': 'Bearer $logintoken',
  //     });
  //     universityByCourseId = univertyByCountryNameFromJson(getResponse.body);
  //   } catch (e) {
  //     print('Error :$e');
  //   }
  // }
}
