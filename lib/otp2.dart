import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_list_view/provider/otp_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
//import 'home.dart';

class Otp2 extends StatefulWidget {
  final String mobileNumber;
  Otp2({required this.mobileNumber, super.key});

  @override
  State<Otp2> createState() => _Otp2State();
}

class _Otp2State extends State<Otp2> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  String otpCodes = '';
  //******************************************/

  // final controlles1 = TextEditingController();
  // final controlles2 = TextEditingController();
  // final controlles3 = TextEditingController();
  // final controlles4 = TextEditingController();

  // final focusNode1 = FocusNode();
  // final focusNode2 = FocusNode();
  // final focusNode3 = FocusNode();
  // final focusNode4 = FocusNode();

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
  }

  // void handleInputChange(String value, int index) {
  //   if (value.isNotEmpty) {
  //     if (index < 3) {
  //       focusNodes[index + 1].requestFocus();
  //     } else {
  //       focusNodes[index].unfocus();
  //     }
  //   } else if (value.isEmpty && index > 0) {
  //     focusNodes[index - 1].requestFocus();
  //   }

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your app name',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
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
          child: SingleChildScrollView(
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
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Enter the 4-digit code sent at',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff303030)),
                  ),
                ),
                Text(
                  widget.mobileNumber,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff303030)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Edit Number ?',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffE4D900)),
                    )),
                //Padding(
                //padding: const EdgeInsets.only(top: 20),

                // child:
                // Column(
                //   children: [
                //     Form(
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           ...List.generate(4, (index) {
                //             return Container(
                //               width: 64,
                //               height: 68,
                //               decoration: BoxDecoration(
                //                   color: controllers[index].text.length == 0
                //                       ? Colors.white
                //                       : Colors.green,
                //                   borderRadius: BorderRadius.circular(20),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color:
                //                           const Color.fromARGB(255, 0, 0, 0)
                //                               .withOpacity(0.1),
                //                       spreadRadius: 3,
                //                       blurRadius: 5,
                //                       offset: const Offset(2, 2),
                //                     )
                //                   ]),
                //               child: Center(
                //                 child: TextField(
                //                     controller: controllers[index],
                //                     focusNode: focusNodes[index],
                //                     keyboardType: TextInputType.number,
                //                     textAlign: TextAlign.center,
                //                     inputFormatters: [
                //                       LengthLimitingTextInputFormatter(1)
                //                     ],
                //                     style: const TextStyle(
                //                         color: Colors.white,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.w500),
                //                     decoration: const InputDecoration(
                //                       border: InputBorder.none,
                //                     ),
                //                     cursorColor: Colors.green,
                //                     onChanged: (value) =>
                //                         handleInputChange(value, index)),
                //               ),
                //             );
                //           })
                //         ],
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(top: 18, right: 140),
                //       child: Text(
                //         "Resend Code in 120 seconds",
                //         style: GoogleFonts.nunitoSans(
                //             fontSize: 15, fontWeight: FontWeight.w400),
                //       ),
                //     )
                //   ],
                // ),

                //     ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(200, 0, 0, 0)
                              .withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(2, 2),
                        )
                      ],
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.number,
                      textStyle: const TextStyle(  color: Colors.white,
                                       fontSize: 20,
                                       fontWeight: FontWeight.w500),
                      enableActiveFill: true,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 69,
                        fieldWidth: 69,
                        borderRadius: BorderRadius.circular(20),
                        //borderWidth: 20,
                        activeColor: Colors.green,
                        activeFillColor: Colors.green,
                        selectedColor: Colors.green,
                        selectedFillColor: Colors.grey,
                        inactiveColor: Colors.white,
                        inactiveFillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          otpCodes = value;
                        });
                      },
                      onCompleted: (value) {
                        Provider.of<OtpProvider>(context,listen: false).getotp(otpCodes);
                        Provider.of<OtpProvider>(context,listen: false).postRequestLogin(context);
                      },
                    ),
                  ),
                ),

                //buttton fof next page

                // Padding(
                //   padding: const EdgeInsets.only(top: 152),
                //   child: SizedBox(
                //     height: 65,
                //     width: 330,
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor: Color(0xFF54962E)),
                //       onPressed: () async {
                //         Provider.of<OtpProvider>(context,listen: false).getotp(otpCodes);
                //          Provider.of<OtpProvider>(context,listen: false).postRequestLogin(context);

                //       },
                //       child: const Text(
                //         "Verify OTP",
                //         style: TextStyle(
                //             color: Color.fromARGB(255, 255, 255, 255),
                //             fontSize: 18,
                //             fontWeight: FontWeight.w600),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
