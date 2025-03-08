import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:flutter_list_view/screens/applicationForm/component/Education.dart';
import 'package:flutter_list_view/screens/applicationForm/component/personalInformation.dart';
import 'package:flutter_list_view/screens/applicationForm/component/profileImage.dart';
import 'package:flutter_list_view/screens/applicationForm/component/studentTravel.dart';
import 'package:flutter_list_view/screens/applicationForm/component/uploadDocument.dart';
import 'package:flutter_list_view/screens/applicationForm/component/work_experience.dart';
//import 'package:flutter_list_view/screens/applicationForm/component/work_experince_form.dart';
import 'package:flutter_list_view/screens/applications/applications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Applicationform extends StatefulWidget {
  String uId;
   Applicationform({
    required this.uId,
    super.key});

  @override
  State<Applicationform> createState() => _ApplicationformState();
}

class _ApplicationformState extends State<Applicationform> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(){ Provider.of<ApplicationFormProvider>(context, listen: false)
        .fetchApplicationDeatils();
        };
    // Provider.of<ApplicationFormProvider>(context, listen: false)
    //     .fetchApplicationDeatils();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 25,
            )),
        backgroundColor: const Color(0xFF54962E),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Image.asset('assets/images/bell.png'),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Application Form",
          style: GoogleFonts.nunitoSans(
              color: const Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Profileimage()),
            const Personalinformation(),
            const Uploaddocument(),
            const Education(),
             const WorkExperience(),
             //WorkExperinceForm(refName: 'ee', orgName: 'ee', refNumber: 'ss', startDate:'ss', endDate: 'ss'),
            const Studenttravel(),
           
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 19),
                child: SizedBox(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54962E)),
                    onPressed: () async{
                     
                    var provider = Provider.of<ApplicationFormProvider>(context,listen: false);
                       provider.universityMap[ 'universityId']= widget.uId;
                   await provider.apiCallUniversitySave(context);
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Applications()));
                    },
                    child: const Text(
                      "Save Details",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
