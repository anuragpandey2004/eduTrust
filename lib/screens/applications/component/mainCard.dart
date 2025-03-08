import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/specific_applied_uni_provider.dart';
import 'package:flutter_list_view/screens/applicationForm/applicationForm.dart';
import 'package:flutter_list_view/screens/universityDeatilsSecond/universityDeatilsSecond.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:provider/provider.dart';

class Maincard extends StatefulWidget {
  final String nameOfUniversity;
  final String imageurl;
  final String universitydis;
  final String applicationDate;
  final String applicationId;
  const Maincard(
      {required this.applicationDate,
      required this.universitydis,
      required this.nameOfUniversity,
      required this.imageurl,
      required this.applicationId,
      super.key});

  @override
  State<Maincard> createState() => _MaincardState();
}

class _MaincardState extends State<Maincard> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
      child: InkWell(
        onTap: () {
          Provider.of<SpecificAppliedUniProvider>(context,listen: false).applicationId = widget.applicationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Universitydeatilssecond()
                        
                      ));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffE3EBF2)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color(0x1A205072),
                    blurRadius: 6,
                    spreadRadius: 0,
                    offset: Offset(0, 0)),
              ]),
          child: Stack(
            children: [
              // Positioned(
              //   top: 0,
              //   left: screenHeight * 0.25,
              //   child: Container(
              //     decoration: const BoxDecoration(
              //         color: Color(0xffE8CD1A),
              //         borderRadius: BorderRadius.only(
              //             bottomLeft: Radius.circular(18),
              //             bottomRight: Radius.circular(18))),
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           top: 5, bottom: 5, left: 12, right: 10),
              //       child: Text(
              //         'Application Date: ${widget.applicationDate}',
              //         style: GoogleFonts.nunitoSans(
              //             fontSize: 10,
              //             fontWeight: FontWeight.w600,
              //             color: Color(0xff2A2A2A)),
              //       ),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(width: screenWidth*0.4973,),
                  Container(
                    // width: 138,
                    //  width: screenWidth*0.368,
                    decoration: const BoxDecoration(
                        color: Color(0xffE8CD1A),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 12, right: 10),
                      child: Text(
                        'Application Date: ${widget.applicationDate}',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2A2A2A)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9.5,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight * 0.080,
                          width: screenWidth * 0.173,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: Color(0xffE3EBF2)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    color: Color(0xff2050721A),
                                    offset: Offset(0, 0),
                                    spreadRadius: 0)
                              ],
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: screenWidth * 0.086,
                            child: Image.network(
                              widget.imageurl,
                              fit: BoxFit.fill,
                            ),
                            // backgroundImage:
                            // NetworkImage(widget.imageurl,),
                            //     //AssetImage('${widget.imageurl}'
                            //     //),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/Group 175561.png'),
                                Text(
                                  " ${widget.nameOfUniversity}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff222222)),
                                ),
                                Text(
                                  '${widget.universitydis}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff939EAA)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Color(0xffD4DDFF),
                                child:
                                    Image.asset('assets/images/Iconcolor.png'),
                              ),
                              Text(
                                'Submitted \n ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff222222)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: SizedBox(
                            width: screenWidth * 0.048,
                            child: const DottedLine(
                              direction: Axis.horizontal,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xff2E5BFF),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffDBFFD9),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Color(0xff9BDD74))),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff54962E)),
                                  ),
                                ),
                              ),
                              Text(
                                'Review or Pending',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff222222)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: SizedBox(
                            width: screenWidth * 0.048,
                            child: const DottedLine(
                              direction: Axis.horizontal,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffDBFFD9),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Color(0xff9BDD74))),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff54962E)),
                                  ),
                                ),
                              ),
                              Text(
                                'Documentation',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff222222)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: SizedBox(
                            width: screenWidth * 0.048,
                            child: const DottedLine(
                              direction: Axis.horizontal,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffDBFFD9),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Color(0xff9BDD74))),
                                child: Center(
                                  child: Text(
                                    '4',
                                    style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff54962E)),
                                  ),
                                ),
                              ),
                              Text(
                                'University Shortlisting ?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff222222)),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom:screenWidth*0.08),
                        //   child: SizedBox(
                        //     width: screenWidth * 0.048,
                        //     child: const DottedLine(
                        //       direction: Axis.horizontal,
                        //       dashLength: 4,
                        //       dashGapLength: 4,
                        //       lineThickness: 2,
                        //       dashColor: Color(0xffC8ECC7),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
