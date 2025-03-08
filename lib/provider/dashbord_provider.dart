import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/all_courses_model.dart';
import 'package:flutter_list_view/model/all_location_model';
import 'package:flutter_list_view/model/country_group_model.dart';
import 'package:flutter_list_view/model/university_name_search.dart';
import 'package:flutter_list_view/services/api_services.dart';

class DashbordProvider extends ChangeNotifier {
  List<GetAllCourses> allCourses = [];
  List<GetAllLocation> allLocation = [];
   GroupedByCountry? selectedItemForDropDown ;
   bool isloading = true;

  UnivertyCountryGroup universityCountryGroup = UnivertyCountryGroup(
    groupedByCountry: [],
    groupedByCity: [],
    groupedByCourse: [],
  );
  List<UnivertyNameForSearch> allUniversittyForSearch = [];

 getSelectedItem(GroupedByCountry newValue) {
    selectedItemForDropDown = newValue;
    notifyListeners();
  }
 Future getCourses() async{
  final data = await ApiServices().getApi('/metadata/courses');
  allCourses = getAllCoursesFromJson(data);
 }

Future getLocations() async{
  isloading =true;
  notifyListeners();
  final data = await ApiServices().getApi('/metadata/locations');
  allLocation = getAllLocationFromJson(data);
  isloading = false;
  notifyListeners();
 }
 Future getUniversityCountryGroup() async{
  final data = await ApiServices().getApi('/dashboard/group-by');
   universityCountryGroup = univertyCountryGroupFromJson(data);
 }
 Future getUnivresityNameFoRSearch() async{
  final data = await ApiServices().getApi('/dashboard/all-names');
    allUniversittyForSearch = univertyNameForSearchFromJson(data);
 }


  // Future getCourses() async {
  
  //   Uri url = Uri.parse('http://18.188.180.197:9000/v1/metadata/courses');
  //   var getResponse = await http.get(url);
  //   allCourses = getAllCoursesFromJson(getResponse.body);
  //   notifyListeners();
  // }

  // Future getLocations() async {
  //   try {
  //     Uri url = Uri.parse('http://18.188.180.197:9000/v1/metadata/locations');
  //     var getResponse = await http.get(url);
  //     allLocation = getAllLocationFromJson(getResponse.body);
  //     print('get all location+++++=>${allLocation.length}');
  //   } catch (e) {
  //     print('Error :$e');
  //   }
  //   notifyListeners();
  // }

  // Future getUniversityCountryGroup() async {
  //   SharedPreferences shairedPrif = await SharedPreferences.getInstance();
  //   String? logintoken = shairedPrif.getString('token').toString();
  //   Uri url = Uri.parse('http://18.188.180.197:9000/v1/dashboard/group-by');
  //   try {
  //     var getresponse = await http.get(url, headers: {
  //       'Authorization': 'Bearer $logintoken',
  //     });
  //     print('Response Body: ${getresponse.body}');
  //     universityCountryGroup = univertyCountryGroupFromJson(getresponse.body);
  //   } catch (e) {
  //     print('Error $e');
  //   }
  //   notifyListeners();
  // }

  // Future getUnivresityNameFoRSearch() async {
  //   SharedPreferences shairedPrif = await SharedPreferences.getInstance();
  //   String? logintoken = shairedPrif.getString('token').toString();
  //   Uri url = Uri.parse('http://18.188.180.197:9000/v1/dashboard/all-names');

  //   try {
  //     var getresponse =
  //         await http.get(url, headers: {'Authorization': 'Bearer $logintoken'});

  //     // print('getUnivresityNameFoRSearch=${getresponse.body}');
  //     allUniversittyForSearch = univertyNameForSearchFromJson(getresponse.body);
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
}
