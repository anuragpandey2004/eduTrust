import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/specific_applied_uni_modal.dart';
import 'package:flutter_list_view/services/api_services.dart';

class SpecificAppliedUniProvider extends ChangeNotifier {
String? applicationId;
SpecificAppliedUniversity? specificAppliedUniversity;
bool isLoading=true;

 Future fetchSpecificUni() async {
  isLoading =true;
  notifyListeners();
    var data = await ApiServices().getApi('/application/university/$applicationId');
    specificAppliedUniversity = specificAppliedUniversityFromJson(data);
    
    print(data);
    isLoading =false;
    notifyListeners();
  }
}