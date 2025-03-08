import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your app name',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => (),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: const Color(0xFF54962E),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child:SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Verify Your Mobile Number",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF303030),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "Enter OTP Code",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF303030),
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Image(
                    image: AssetImage('assets/images/Group.png'),
                    height: 116,
                    width: 116,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Image(image: AssetImage("assets/images/Group_17.png")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Form(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 64,
                            height: 68,
                            decoration: BoxDecoration(color: const Color(0xFF54962E),
                            borderRadius: BorderRadius.circular(20)
                            ,boxShadow: [
                              BoxShadow(
                                color:
                                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(2, 2),
                              )
                            ]),
                            child: Center(
                              child: TextField(
                               
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                style: const TextStyle(color: Colors.white,
                                fontSize: 20,fontWeight: FontWeight.w500),
                                decoration: const InputDecoration(
                                border: InputBorder.none,
                                    //  filled: true,
                                
                                    //  fillColor: Color(0xFF54962E),
                                    // enabledBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white)),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white))
                                    ),
                              ),
                            ),
                          ),
                          
                        
                      Container(
                            width: 64,
                            height: 68,
                            decoration: BoxDecoration(color: const Color(0xFF54962E),
                            borderRadius: BorderRadius.circular(20)
                            ,boxShadow: [
                              BoxShadow(
                                color:
                                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(2, 2),
                              )
                            ]),
                            child: Center(
                              child: TextField(
                               
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                style: const TextStyle(color: Colors.white,
                                fontSize: 20,fontWeight: FontWeight.w500),
                                decoration: const InputDecoration(
                                border: InputBorder.none,
                                    //  filled: true,
                                
                                    //  fillColor: Color(0xFF54962E),
                                    // enabledBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white)),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white))
                                    ),
                              ),
                            ),
                          ),
                      
                              Container(
                            width: 64,
                            height: 68,
                            decoration: BoxDecoration(color: const Color(0xFF54962E),
                            borderRadius: BorderRadius.circular(20)
                            ,boxShadow: [
                              BoxShadow(
                                color:
                                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(2, 2),
                              )
                            ]),
                            child: Center(
                              child: TextField(
                               
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                style: const TextStyle(color: Colors.white,
                                fontSize: 20,fontWeight: FontWeight.w500),
                                decoration:const  InputDecoration(
                                border: InputBorder.none,
                                    //  filled: true,
                                
                                    //  fillColor: Color(0xFF54962E),
                                    // enabledBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white)),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white))
                                    ),
                              ),
                            ),
                          ),
                              
                          Container(
                            width: 64,
                            height: 68,
                            decoration: BoxDecoration(color: const Color(0xFF54962E),
                            borderRadius: BorderRadius.circular(20)
                            ,boxShadow: [
                              BoxShadow(
                                color:
                                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(2, 2),
                              )
                            ]),
                            child: Center(
                              child: TextField(
                               
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                style: const TextStyle(color: Colors.white,
                                fontSize: 20,fontWeight: FontWeight.w500),
                                decoration: const InputDecoration(
                                border: InputBorder.none,
                                    //  filled: true,
                                
                                    //  fillColor: Color(0xFF54962E),
                                    // enabledBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white)),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     borderSide: BorderSide(color: Colors.white))
                                    ),
                              ),
                            ),
                          ),
                              
                        
                        ],
                      )),
                   
                   Padding(
                     padding: const EdgeInsets.only(top: 18,right:140),
                     child: Text("Resend Code in 120 seconds",style: GoogleFonts.nunitoSans(fontSize: 15,fontWeight: FontWeight.w400),),
                   )],
                  ),
                ),
            const Padding(
                      padding: EdgeInsets.only(top: 280),
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
        ),
      ),
    );
  }
}
