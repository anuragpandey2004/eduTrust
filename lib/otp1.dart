import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/otp_provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'otp2.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp1 extends StatefulWidget {
   
  const Otp1 ({super.key});
  @override
  State<Otp1> createState() => _Otp1State();
}

class _Otp1State extends State<Otp1> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers.addListener(() => controllers,);
  }
   final controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {

      Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return MaterialApp(
      title: 'Your app name',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF54962E),
          ),
          body: Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight*0.0566,

                  ),
                  const Image(
                    image: AssetImage('assets/images/Group.png'),
                    height: 116,
                    width: 116,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      "Let Your Dream Take Wing",
                      style: TextStyle(
                          color: Color(0xff2A2A2A),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 104),
                    child: Container(
                      height: 56,
                      width: screenWidth*0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color:Color(0x1A303030),
                                  offset: Offset(0, 5), 
                                   blurRadius: 15,
                            )
                          ]),
                      child: Center(
                        child: IntlPhoneField(
                        style: GoogleFonts.nunitoSans(fontSize: 15,fontWeight: FontWeight.w400),
                          //textInputAction: TextInputAction.done,
                          //textAlignVertical: ,
                          
                          showDropdownIcon: false,
                          controller: controllers,
                          cursorColor: Color(0xFF54962E),
                          decoration:  InputDecoration(
                            
                            counterText: " ",
                          contentPadding:  const EdgeInsets.symmetric(vertical:14),
                            border: const OutlineInputBorder(
                            
                              borderSide: BorderSide.none,
                            ),
                            
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.check_circle,
                                color: controllers.text.length ==10

                                ? Colors.yellow
                                :Colors.white
                                
                              ),
                            ),
                          ),
                          initialCountryCode: 'IN'
                          ,
                          flagsButtonPadding: EdgeInsets.only(top: 5),
                        
                          onChanged: (phone) {
                           //print(phone.completeNumber);
                           setState(() {
                           });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.187,),
                  SizedBox(
                    height:  screenHeight*0.08,
                    width: screenWidth*0.88,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF54962E)),
                      onPressed: () {
                         String mobileNumber = controllers.text;
                        
                         if(mobileNumber.length ==10) {
                         
                          //  Navigator.push(context, MaterialPageRoute(
                          // builder: (context)=>Otp2(mobileNumber: mobileNumber)));
                        Provider.of<OtpProvider>(context,listen: false).getphoneNumber(controllers.text.toString());
                        Provider.of<OtpProvider>(context,listen: false).printnumber();
                        Provider.of<OtpProvider>(context,listen: false).postRequestOtp();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Otp2(mobileNumber: mobileNumber)) );
                         }
                      },
                      child: const Text(
                        "Generate OTP",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 49),
                    child: Text(
                      "Privacy Legal",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Copyright 2004 Secure it. All rights reserved.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
