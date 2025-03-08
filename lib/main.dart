//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:flutter_list_view/provider/applied_university_provider.dart';
import 'package:flutter_list_view/provider/dashbord_provider.dart';
import 'package:flutter_list_view/provider/home_screen_provider.dart';
//import 'package:flutter_list_view/otp2.dart';
import 'package:flutter_list_view/provider/otp_provider.dart';
import 'package:flutter_list_view/provider/specific_applied_uni_provider.dart';
import 'package:flutter_list_view/provider/university_details_provider.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_list_view/nointernet.dart';
//import 'package:flutter_list_view/screens/applicationForm/applicationForm.dart';
//import 'package:flutter_list_view/screens/myProfile/myProfile.dart';
//import 'package:flutter_list_view/screens/appDrawer/appDrawer.dart';
//import 'package:flutter_list_view/screens/notification/notifaction.dart';
//import 'package:flutter_list_view/screens/applications/applications.dart';
//import 'package:flutter_list_view/screens/universityDeatilsSecond/universityDeatilsSecond.dart';
//import 'package:flutter_list_view/UniversityDetails.dart';
// import 'package:flutter_list_view/otp3.dart';
// import 'welcome.dart';
// import 'otp1.dart';
//import 'otp2.dart';
// import 'otp3.dart';
// import 'search_university.dart';
 //import 'home.dart';
import 'flash.dart';
//import 'screens/universityComment/univesityComments.dart';
//import 'screens/applicationForm/applicationForm.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {runApp(MyApp());});}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
 ChangeNotifierProvider<OtpProvider>(create: (context)=>OtpProvider()),
 ChangeNotifierProvider<DashbordProvider>(create: (context)=>DashbordProvider ()),
 ChangeNotifierProvider<HomeScreenProvider>(create: (context)=>HomeScreenProvider()),
 ChangeNotifierProvider<UniversityDetailsProvider>(create: (context)=>UniversityDetailsProvider()),
 ChangeNotifierProvider<ApplicationFormProvider>(create: (context)=>ApplicationFormProvider()),
 ChangeNotifierProvider<AppliedUniversityProvider>(create: (context)=>AppliedUniversityProvider()),
  ChangeNotifierProvider<SpecificAppliedUniProvider>(create: (context)=>SpecificAppliedUniProvider()),

    ],
  
   child:  MaterialApp(
      debugShowCheckedModeBanner: false,

      //debugShowCheckedModeBanner: false,
      title: 'Your app name',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
        unselectedWidgetColor: Color(0xff939EAA)
        

      ),
      home: 
     // Nointernet()
       Flash()
          //Otp1()
      //  Otp2(mobileNumber: '')
         // Otp3()
         // Search_University()
         // HomeScreen()
        // Universitydetails()
        //Univesitycomments()
        //Applicationform()
        // Applications()
       // Universitydeatilssecond()
      // Appdrawer()
    // Notifaction()
   // Myprofile()
    ));
    
  }
}
