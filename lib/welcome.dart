import 'package:flutter/material.dart';

import 'otp1.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return MaterialApp(
        title: 'login',
        home: Scaffold(
          body: Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.white,
            child: Column(children: [
              Stack(
                children: [

                  Image(
                    image: const AssetImage('assets/images/Login (2)2.png'),
                    fit: BoxFit.fill,
                    width: screenWidth,
                    height: screenHeight,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.096,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "GET A NEW EXPERIENCE",
                          style: GoogleFonts.nunitoSans(
                              color: Color(0xFF191919),
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.121,
                      ),
                      const Center(
                        child: Image(
                          image: AssetImage('assets/images/Group.png'),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.288,
                      ),
                      Center(
                        child: SizedBox(
                          height: screenHeight * 0.08,
                          width: screenWidth * 0.88,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF54962E)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Otp1()));
                            },
                            child: Text(
                              "Login with Phone",
                              style: GoogleFonts.nunitoSans(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.0529,
                      ),
                      Center(
                        child: Text(
                          "Privacy Legal",
                          style: GoogleFonts.nunitoSans(
                              color: Color(0xff24272B),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            "Copyright 2004 Secure it. All rights reserved.",
                            style: GoogleFonts.nunitoSans(
                                color: Color(0xff78797A),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // SizedBox(height: screenHeight*0.115,),
              // SizedBox(height: screenHeight*0.0529,),
            ]),
          ),
        ));
  }
}
