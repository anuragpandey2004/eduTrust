import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/specific_applied_uni_modal.dart';
import 'package:flutter_list_view/provider/specific_applied_uni_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
//import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Universitydetailssecondcard extends StatefulWidget {
  const Universitydetailssecondcard({super.key});

  @override
  State<Universitydetailssecondcard> createState() =>
      _UniversitydetailssecondcardState();
}

class _UniversitydetailssecondcardState
    extends State<Universitydetailssecondcard> {
      SpecificAppliedUniversity? data;
      String? date;

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<SpecificAppliedUniProvider>(context,listen: false);
    data = provider.specificAppliedUniversity;
    //date = data!.lastUpdatedOn?.DateFormat('yyyy-MM-dd');
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    //double screenHeight = screenSize.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                    color: Color(0xffF3FFEC),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 23, bottom: 18),
                  child: Text(
                    'Lorem Ipsum',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff2E2E2E)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17, left: 23, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Simply Dummy Text',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff4A4A4A)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data!.lastUpdatedOn!.day.toString(),
                            style: GoogleFonts.nunitoSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff5B5B5B)),
                          ),
                          Text(
                            'Av 345.00',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff1B1E28)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'LOR: 25 MIN',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff1B1E28)),
                    ),
                   const  SizedBox(height: 14,),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: const Color(0xff54962E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29205800),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                        ),
                       const  SizedBox(width: 16,),
                        Image.asset('assets/images/Group 175961.png'),
                      const   SizedBox(width: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Submitted',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2E2E2E)),
                            ),
                            Text(
                              'Lorem Ipsum is simply',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B5B5B)),
                            )
                          ],
                        ),
                        const  Spacer(),
                        Text(
                          '11.00',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A4A4A)),
                        )
                      ],
                    ),
                    const  Padding(
                       padding: EdgeInsets.only(left: 6),
                       child: SizedBox(
                            height: 34,
                            child:  DottedLine(
                              direction: Axis.vertical,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                     ),
                    //2
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: const Color(0xff54962E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29205800),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                        ),
                       const  SizedBox(width: 16,),
                        Image.asset('assets/images/Group 175962.png'),
                      const   SizedBox(width: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Review or Pending',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2E2E2E)),
                            ),
                            Text(
                              'Lorem Ipsum is simply',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B5B5B)),
                            )
                          ],
                        ),
                        const  Spacer(),
                        Text(
                          '11.00',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A4A4A)),
                        )
                      ],
                    ),
                    const  Padding(
                       padding: const EdgeInsets.only(left: 6),
                       child: SizedBox(
                            height: 34,
                            child:  DottedLine(
                              direction: Axis.vertical,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                     ),
                     //3
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: const Color(0xff54962E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29205800),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                        ),
                       const  SizedBox(width: 16,),
                        Image.asset('assets/images/Group 175963.png'),
                      const   SizedBox(width: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Documentation',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2E2E2E)),
                            ),
                            Text(
                              'Lorem Ipsum is simply',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B5B5B)),
                            )
                          ],
                        ),
                        const  Spacer(),
                        Text(
                          '11.00',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A4A4A)),
                        )
                      ],
                    ),
                    const  Padding(
                       padding: const EdgeInsets.only(left: 6),
                       child: SizedBox(
                            height: 34,
                            child:  DottedLine(
                              direction: Axis.vertical,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                     ),
                     //4
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: const Color(0xff54962E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29205800),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                        ),
                       const  SizedBox(width: 16,),
                        Image.asset('assets/images/Group 175964.png'),
                      const   SizedBox(width: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'University Shortlisting ?',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2E2E2E)),
                            ),
                            Text(
                              'Lorem Ipsum is simply',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B5B5B)),
                            )
                          ],
                        ),
                        const  Spacer(),
                        Text(
                          '11.00',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A4A4A)),
                        )
                      ],
                    ),
                    const  Padding(
                       padding: const EdgeInsets.only(left: 6),
                       child: SizedBox(
                            height: 34,
                            child:  DottedLine(
                              direction: Axis.vertical,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                     ),
                     //5
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: const Color(0xff54962E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29205800),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                        ),
                       const  SizedBox(width: 16,),
                        Image.asset('assets/images/Group 175964.png'),
                      const   SizedBox(width: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Decision',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2E2E2E)),
                            ),
                            Text(
                              'Lorem Ipsum is simply',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B5B5B)),
                            )
                          ],
                        ),
                        const  Spacer(),
                        Text(
                          '11.00',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A4A4A)),
                        )
                      ],
                    ),
                    const  Padding(
                       padding: const EdgeInsets.only(left: 6),
                       child: SizedBox(
                            height: 34,
                            child:  DottedLine(
                              direction: Axis.vertical,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                     ),
                     //6
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: const Color(0xff54962E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29205800),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                        ),
                       const  SizedBox(width: 16,),
                        Image.asset('assets/images/Group 175964.png'),
                      const   SizedBox(width: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'I20 Form',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2E2E2E)),
                            ),
                            Text(
                              'Lorem Ipsum is simply',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B5B5B)),
                            )
                          ],
                        ),
                        const  Spacer(),
                        Text(
                          '11.00',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A4A4A)),
                        )
                      ],
                    ),
                    const  Padding(
                       padding: const EdgeInsets.only(left: 6),
                       child: SizedBox(
                            height: 34,
                            child:  DottedLine(
                              direction: Axis.vertical,
                              dashLength: 4,
                              dashGapLength: 4,
                              lineThickness: 2,
                              dashColor: Color(0xffC8ECC7),
                            ),
                          ),
                     ),
                     //7
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: const Color(0xff54962E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29205800),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                        ),
                       const  SizedBox(width: 16,),
                        Image.asset('assets/images/Group 175964.png'),
                      const   SizedBox(width: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VISA Status (Approved?)',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2E2E2E)),
                            ),
                            Text(
                              'Lorem Ipsum is simply',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B5B5B)),
                            )
                          ],
                        ),
                        const  Spacer(),
                        Text(
                          '11.00',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A4A4A)),
                        )
                      ],
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
