import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/applicant_form_model.dart';
import 'package:flutter_list_view/screens/applicationForm/component/education_form.dart';
import 'package:flutter_list_view/screens/applicationForm/component/work_experince_form.dart';
//import 'package:flutter_list_view/screens/applicationForm/component/Education.dart';
import 'package:flutter_list_view/services/api_services.dart';
import 'package:flutter_list_view/utils/shared_prefs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ApplicationFormProvider extends ChangeNotifier {
  List form = [];
  List workForm =[];
  // List<Education> educationHistory = [];
  String orgName = '';
  String refName = '';
  String refNumn  = '';
  String start = '';
String end = '';


  ApplicantForm? applicationFormData;
  bool isLoading = true;
  bool isSaveButtonLoading = false;

  Map<String, dynamic> map = {};
  Map<String,dynamic> universityMap = {
   
  };
  Map<String, dynamic> uplodeCV = {
    'docType': 'CV',
    'description': 'This is my CV .......'
  };
  Map<String, dynamic> saveWork = {
 'orgName':'Tesla-2',
  'referenceName':'Elon Musk-2',
'referenceNum':'55555555',
    'workStartDate':'2023-02-01',
   'workEndDate':'2023-02-28',
  };
  Map<String, dynamic> saveTravel = {
    
  };
   Future<void> initializeForms() async {
    await fetchApplicationDeatils(); // Fetch the applicant details from API
    if (applicationFormData != null && applicationFormData!.educationHistories != null) {
       form.clear();
      for (var history in applicationFormData!.educationHistories!) {
        form.add(EducationForm(
          name: history.degreeName,
          startDate: history.degreeStartDate,
          endDate: history.degreeEndDate,
          id: history.educationHistoryId.toString(),
        ));
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> initializeWorkForms() async {
    await fetchApplicationDeatils(); // Fetch the applicant details from API
    if (applicationFormData != null && applicationFormData!.workExperiences != null) {
      workForm.clear();
      for (var history in applicationFormData!.workExperiences!) {
        workForm.add(
          WorkExperinceForm(refName: history.referenceName, orgName:history.orgName, refNumber: history.referenceNumber, startDate: history.workStartDate, endDate: history.workEndDate)
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }
  void addForm() async{
 //await fetchApplicationDeatils();

    form.add(EducationForm(
      // name: 'rr',
      // endDate: 'ii',
      // startDate: 'pp',
      // id: 'kk',
      name: applicationFormData!.educationHistories![form.length].degreeName,
      startDate:
          applicationFormData!.educationHistories![form.length].degreeStartDate,
      endDate:
          applicationFormData!.educationHistories![form.length].degreeEndDate,
          id: applicationFormData!.educationHistories![form.length].educationHistoryId.toString(),
    ));
    notifyListeners();
  }

  void reemoveWorkForm(index) {
        print("Form removed. Remaining forms: ${workForm.length}");

  workForm.removeAt(index);
  notifyListeners();
   
  }

   void reemoveForm(index) {
        print("Form removed. Remaining forms: ${form.length}");

  form.removeAt(index);
  notifyListeners();
   
  }
  //  void removeForm(String id) {
  //   form.removeWhere((entry) => entry.id == id); // Remove by ID
  //   notifyListeners();
  // }

  void addworkForm() async{
 //await fetchApplicationDeatils();

    workForm.add(WorkExperinceForm(
     endDate: applicationFormData!.workExperiences![workForm.length].workEndDate,
     orgName: applicationFormData!.workExperiences![workForm.length].orgName,
     refName: applicationFormData!.workExperiences![workForm.length].referenceName,
     refNumber: applicationFormData!.workExperiences![workForm.length].referenceNumber,
     startDate: applicationFormData!.workExperiences![workForm.length].workStartDate
      ));
    notifyListeners();
  }

  Map<String, dynamic> saveEducaion = {
    //   'degreeName':"Btech",
    //  "degreeGapYears": "4 Year",
    // "degreeStartDate": '12 Jan 2022',
    // 'degreeEndDate': '13 Jan 2022',
    // 'gapPresent'   :"true",
  };
  

  setEducationData(
      String degreeName,
      String degreeGapYears,
      String degreeStartDate,
      String degreeEndDate,
      String gapPresent,
      XFile? degreeFile) {
    saveEducaion['degreeName'] = degreeName;
    saveEducaion['degreeGapYears'] = degreeGapYears;
    saveEducaion['degreeStartDate'] = degreeStartDate;
    saveEducaion['degreeEndDate'] = degreeEndDate;
    saveEducaion['gapPresent'] = gapPresent;
    saveEducaion['degreeFile'] = degreeFile;
    notifyListeners();
  }


  setWorkData(String? orgNamee, String? referenceName, String? referenceNum,
      String? workStartDate, String? workEndDate,) {
        orgName= orgNamee!;
        refName = referenceName!;
        refNumn = referenceNum!;
        start = workStartDate!;
        end = workEndDate!;
    // saveWork['orgName'] = orgName;
    // saveWork['referenceName'] = referenceName;
    // saveWork['referenceNum'] = referenceNum;
    // saveWork['workStartDate'] = workStartDate;
    // saveWork['workEndDate'] = workEndDate;
   // saveWork['degreeFile'] = degreeFile;
   notifyListeners();
  }

  //
  setApplicantData(
      String fullName,
      String mobNum,
      String email,
      String alternateMobNum,
      String nationality,
      String city,
      String gender,
      String maritalStatus) {
    map['fullName'] = fullName;
    map['email'] = email;
    map['mobNum'] = mobNum;
    map['alternateMobNum'] = alternateMobNum;
    map['nationality'] = nationality;
    map['city'] = city;
    map['gender'] = gender;
    map['maritalStatus'] = maritalStatus;
    notifyListeners();
  }

  setTravelData(
    String passportAvailable,
    String visaAvailable,
    String visaRefusal,
    String passportNumber,
    String visaNumber,
    String visaRefusalReason,
    XFile? passport,
    XFile? visa,
  ) {
    saveTravel['passportAvailable'] = passportAvailable;
    saveTravel['visaAvailable'] = visaAvailable;
    saveTravel['visaRefusal'] = visaRefusal;
    saveTravel['passportNumber'] = passportNumber;
    saveTravel['visaNumber'] = visaNumber;
    saveTravel['visaRefusalReason'] = visaRefusalReason;
    saveTravel['passport'] = passport;
    saveTravel['visa'] = visa;
  }

  Future fetchApplicationDeatils() async {
    final data = await ApiServices().getApi('/applicant/form');
    applicationFormData = applicantFormFromJson(data);

    print(data);
    isLoading = false;
    notifyListeners();
  }

  Future apiCallForSave(BuildContext context) async {
    // Map<String, dynamic> maps = {
    //   'fullName': 'Sanjeev',
    //   'email': 'dummy@gmail.com',
    //   'mobNum': '9986655517',
    //   'alternateMobNum': '',
    //   'nationality': 'Indian',
    //   'city': 'Bangalore',
    //   'gender': 'Male',
    //   'maritalStatus': 'Married'

    // };
    final response =
        await ApiServices().postApi('/applicant/personal/save', map);
    if (response != null) {
      // when response is successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data saved successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 10),
        ),
      );
    } else {
      //when response failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save data. Please try again.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
    isSaveButtonLoading = false;
    notifyListeners();
  }
 Future apiCallUniversitySave (BuildContext context)async{
final response =
        await ApiServices().postApi('/application/university', universityMap);
    if (response != null) {
      // when response is successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data saved successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 10),
        ),
      );
    } else {
      //when response failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save data. Please try again.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
    //isSaveButtonLoading = false;
    notifyListeners();
 }

  Future uploadCV(BuildContext context, XFile? file) async {
    String? loginToken = await SharedPrefs().getString('token');

    // Ensure a file is selected before uploading
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a file to upload.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final uri =
        Uri.parse('http://18.188.180.197:9000/v1/applicant/upload/docs');
    var request = http.MultipartRequest('POST', uri);

    // Add headers
    request.headers['Authorization'] = 'Bearer $loginToken';

    // Add form fields
    request.fields['docType'] = 'CV';
    request.fields['description'] = 'This is my CV .......';

    // Attach the file
    var multipartFile = await http.MultipartFile.fromPath('docs', file.path);
    request.files.add(multipartFile);

    // Send the request
    try {
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // Success case
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('CV uploaded successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        print(responseBody);
      } else {
        // Failure case
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to upload CV. Please try again.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        print('Failed to upload CV: ${response.statusCode}');
        print(responseBody);
      }
    } catch (e) {
      print('Error uploading CV: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred during upload.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

Future uploadProfile(BuildContext context, XFile? file) async {
    String? loginToken = await SharedPrefs().getString('token');

    // Ensure a file is selected before uploading
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a file to upload.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final uri =
        Uri.parse('http://18.188.180.197:9000/v1/applicant/upload/docs');
    var request = http.MultipartRequest('POST', uri);

    // Add headers
    request.headers['Authorization'] = 'Bearer $loginToken';

    // Add form fields
    request.fields['docType'] = 'PROFILE_IMAGE';
    request.fields['description'] = 'This is my Profile .......';

    // Attach the file
    var multipartFile = await http.MultipartFile.fromPath('docs', file.path);
    request.files.add(multipartFile);

    // Send the request
    try {
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // Success case
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile uploaded successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        print(responseBody);
      } else {
        // Failure case
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to upload CV. Please try again.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        print('Failed to upload CV: ${response.statusCode}');
        print(responseBody);
      }
    } catch (e) {
      print('Error uploading CV: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred during upload.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
  Future apiCallForEducation(context) async {
    String? logintoken = await SharedPrefs().getString('token');

    final uri =
        Uri.parse('http://18.188.180.197:9000/v1/applicant/education/save');
    var request = http.MultipartRequest('POST', uri);
    //add header
    request.headers['Authorization'] = 'Bearer $logintoken';
    // Add other form fields
    request.fields['degreeName'] = saveEducaion['degreeName'] ?? '';
    request.fields['degreeGapYears'] = saveEducaion['degreeGapYears'] ?? '';
    request.fields['degreeStartDate'] = saveEducaion['degreeStartDate'] ?? '';
    request.fields['degreeEndDate'] = saveEducaion['degreeEndDate'] ?? '';
    request.fields['gapPresent'] = saveEducaion['gapPresent'] ?? '';

    // Add the degree file
    if (saveEducaion['degreeFile'] != null) {
      var file = await http.MultipartFile.fromPath(
        'degreeFile',
        (saveEducaion['degreeFile'] as XFile).path,
      );
      request.files.add(file);
    }

    // Send the request
    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data saved successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 10),
        ),
      );
      print(responseBody);
    } else {
      print('Failed to save education details.');
    }
  }
   Future apiCallForWorkForm(context)async{
            final response =
        await ApiServices().postApi('/applicant/work-exp/save',
        //saveWork
        {
      'orgName': orgName,

      //saveWork['orgName'] ?? '',
      'referenceName':refName,
       //saveWork['referenceName'] ?? '',
      'referenceNum': refNumn,
      //saveWork['referenceNum']?.toString() ?? '',
      'workStartDate':start, 
     // saveWork['workStartDate'] ?? '',
      'workEndDate':end 
      //saveWork['workEndDate'] ?? '',
    },
    );
    if (response != null) {
      // when response is successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data saved successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 10),
        ),
      );
    } else {
      //when response failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save data. Please try again.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
    //isSaveButtonLoading = false;
    //notifyListeners();
   } 
  // Future apiCallForWork(context) async {
  //   String? logintoken = await SharedPrefs().getString('token');

  //   final uri =
  //       Uri.parse('http://18.188.180.197:9000/v1/applicant/work-exp/save');
  //   var request = http.MultipartRequest('POST', uri);
  //   //add header
  //   request.headers['Authorization'] = 'Bearer $logintoken';
  //   // Add other form fields
  //   request.fields['orgName'] = saveWork['orgName'] ?? '';
  //   request.fields['referenceName'] = saveWork['referenceName'] ?? '';
  //   request.fields['referenceNum'] = saveWork['referenceNum'] ?? '';
  //   request.fields['workStartDate'] = saveWork['workStartDate'] ?? '';
  //   request.fields['workEndDate'] = saveWork['workEndDate'] ?? '';

  //   // Add the degree file
  //   // if (saveWork['degreeFile'] != null) {
  //   //   var file = await http.MultipartFile.fromPath(
  //   //     'degreeFile',
  //   //     (saveWork['degreeFile'] as XFile).path,
  //   //   );
  //   //   request.files.add(file);
  //   // }

  //   // Send the request
  //   var response = await request.send();
  //   final responseBody = await response.stream.bytesToString();

  //   if (response.statusCode == 200) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Data saved successfully!'),
  //         backgroundColor: Colors.green,
  //         duration: Duration(seconds: 10),
  //       ),
  //     );
  //     print(responseBody);
  //   } else {
  //     print(responseBody);
  //     print('Failed to save work details.');
  //   }
  // }

  Future apiCallForTravel(context) async {
    String? logintoken = await SharedPrefs().getString('token');

    final uri =
        Uri.parse('http://18.188.180.197:9000/v1/applicant/travel/save');
    var request = http.MultipartRequest('POST', uri);
    //add header
    request.headers['Authorization'] = 'Bearer $logintoken';
    // Add other form fields
    request.fields['passportAvailable'] = saveTravel['passportAvailable'] ?? '';
    request.fields['visaAvailable'] = saveTravel['visaAvailable'] ?? '';
    request.fields['visaRefusal'] = saveTravel['visaRefusal'] ?? '';
    request.fields['passportNumber'] = saveTravel['passportNumber'] ?? '';
    request.fields['visaNumber'] = saveTravel['visaNumber'] ?? '';
    request.fields['visaRefusalReason'] = saveTravel['visaRefusalReason'] ?? '';

    // Add the degree file
    if (saveTravel['passport'] != null) {
      var file = await http.MultipartFile.fromPath(
        'passport',
        (saveTravel['passport'] as XFile).path,
      );
      request.files.add(file);
    }
    if (saveTravel['visa'] != null) {
      var file = await http.MultipartFile.fromPath(
        'visa',
        (saveTravel['visa'] as XFile).path,
      );
      request.files.add(file);
    }

    // Send the request
    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data saved successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 10),
        ),
      );
      print(responseBody);
    } else {
      print('Failed to save education details.');
    }
  }

  Future<void> deleteRecord(String id, String sectionName) async {
    String? logintoken = await SharedPrefs().getString('token');
    const String url = 'http://18.188.180.197:9000/v1/applicant/delete/record';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $logintoken';

      request.fields['id'] = id; // Add the `id` field
      request.fields['sectionName'] =
          sectionName; // Add the `sectionName` field

      // Send the request
      var response = await request.send();

      // Process the response
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print('Success: $responseBody');
      } else {
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
