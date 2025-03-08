import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/applied_university_model.dart';
import 'package:flutter_list_view/screens/applications/component/mainCard.dart';
import 'package:flutter_list_view/services/api_services.dart';

class AppliedUniversityProvider extends ChangeNotifier {
 List<AppliedUniversity>? appliedUniversityList;
List<Maincard> universityCards = [];
bool isLoading= true;
   Future fetchApplicationDeatils() async {
     isLoading = true;
    notifyListeners();
    final data = await ApiServices().getApi('/application/universities');
   // applicationFormData = applicantFormFromJson(data);
appliedUniversityList = appliedUniversityFromJson(data)  ;
    print(data);
    isLoading = false;
    notifyListeners();
  }

 Future<void> initializeForms() async {
  await fetchApplicationDeatils(); 
  
  if (appliedUniversityList != null) {
    universityCards.clear(); 

    for (var university in appliedUniversityList!) {
      universityCards.add(
        Maincard(
          nameOfUniversity: university.universityName?? 'N/A',
          imageurl: university.universityLogo ?? 'https://via.placeholder.com/150',
          universitydis: university.description ?? 'No description available',
          applicationDate: 'N/A',
          applicationId: university.applicationId.toString(),
        ),
      );
    }
  }

  isLoading = false; 
    notifyListeners();
}}