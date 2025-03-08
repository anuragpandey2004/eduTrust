//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/university_details_model.dart';
import 'package:flutter_list_view/provider/university_details_provider.dart';
import 'package:flutter_list_view/screens/applicationForm/applicationForm.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Universitydetails extends StatefulWidget {
  const Universitydetails({super.key});

  @override
  State<Universitydetails> createState() => _UniversitydetailsState();
}

class _UniversitydetailsState extends State<Universitydetails> {
  UniversityDetailsById? universityDetails;
  bool isExpanded = false;
  String linetext =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it toLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to Lorem Ipsum is simply dummy text of the printing and type";

  @override
  initState() {
    super.initState();

    Provider.of<UniversityDetailsProvider>(context, listen: false)
        .getUniversityDetailsByUniversityID();
    storeDataInUniversityDetails();
    //print(universityDetails!.country.toString());
  }

  Future storeDataInUniversityDetails() async {
    UniversityDetailsProvider provider =
        Provider.of<UniversityDetailsProvider>(context, listen: false);
    await provider.getUniversityDetailsByUniversityID();
    var fetchedDetails = provider.universityDetailsById;

    setState(() {
      universityDetails = fetchedDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () => (),
              icon: Image.asset(
                'assets/images/appBar2.png',
              )),
          IconButton(
              onPressed: () => (),
              icon: Image.asset(
                'assets/images/appBarLike.png',
              )),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: universityDetails == null
          ? const Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              color: Colors.green,
            ))
          : Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 0.45,
                    width: screenWidth,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: NetworkImage(
                    //           universityDetails!.logoUrl.toString(),
                    //         ),
                    //         fit: BoxFit.fill)),
                    child: CachedNetworkImage(imageUrl: universityDetails!.logoUrl.toString(),
                    fit: BoxFit.fill,
                     placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.435,
                        ),
                        Container(
                          width: screenWidth,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40)),
                              boxShadow: [
                                // BoxShadow(
                                //   color: Color(0x29000000),
                                //   offset: Offset(0, 10),
                                //   blurRadius: 30,
                                //   spreadRadius: 0,
                                // )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 27, left: 23, right: 23),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  universityDetails == null
                                      ? "University Name"
                                      : universityDetails!.universityName
                                          .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff2E2E2E)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  //   mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...List.generate(
                                        universityDetails == null
                                            ? 0
                                            : universityDetails!.rating!
                                                .toInt(),
                                        (index) => const Icon(
                                              Icons.star,
                                              color: Color(0xffFFA928),
                                              size: 14,
                                            )),
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Color.fromARGB(255, 240, 232, 162),
                                    ),
                                    Text(
                                      universityDetails == null
                                          ? '0'
                                          : universityDetails!.rating
                                              .toString(),
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffFFA928)),
                                    )
                                  ],
                                ),
                                Text(
                                  'Price From \$65,458',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    // ignore: dead_code
                                    // isExpanded
                                    //     ? linetext
                                    //     : '${linetext.substring(0, 500)}',
                                    // universityDetails == null
                                    //     ? "University Details"
                                         universityDetails!.description
                                            .toString(),
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        color: const Color(0xff5B5B5B)),
                                  ),
                                ),
                                // TextButton(
                                //     onPressed: () {
                                //       setState(() {
                                //         isExpanded = !isExpanded;
                                //       });
                                //     },
                                //     child: Row(
                                //       children: [
                                //         // ignore: dead_code
                                //         Text(
                                //           isExpanded ? 'Show Less' : 'Read More',
                                //         ),
                                //         Icon(Icons.arrow_drop_down_circle)
                                //       ],
                                //     )),
                                if (isExpanded == false)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            child: Text(
                                              'Read More',
                                              style: GoogleFonts.nunitoSans(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff54962E)),
                                            )),
                                        const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: Color(0xff54962E),
                                        )
                                      ],
                                    ),
                                  ),
                                if (isExpanded == true)
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175853.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Establishment',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '2456',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //2
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Path2.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'University Type',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Public',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //3
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175867.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Intakes',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Sep',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //4
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group 175859.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'All Students',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '27427',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //5
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175866.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'International Students',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '12474',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //6
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175865.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Avg Living Cost',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'USD 19766.45',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //7
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175854.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Avg Tuition / Year',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'USD 39766.47',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //8
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175863.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Scholarship',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'No',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //9
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175864.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Internships',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'No',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //10
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175858.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Accommodation (On-Campus)',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                            fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'No',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //11
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: screenHeight * 0.064,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffEFEFF6))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group175857.png',
                                                      height: 21,
                                                      width: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        'Accommodation (Off-Campus)',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff4A4A4A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Yes',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: const Color(
                                                          0xff1B1E28)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      if (isExpanded == true) //optional logic
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 14),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isExpanded = !isExpanded;
                                                    });
                                                  },
                                                  child: Text(
                                                    'Read less',
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xff54962E)),
                                                  )),
                                              const Icon(
                                                Icons.arrow_drop_up_rounded,
                                                color: Color(0xff54962E),
                                              )
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 13, bottom: 33),
                                  child: Container(
                                    height: screenHeight * 0.064,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffEFEFF6))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/cardlogo.png',
                                                height: 21,
                                                width: 24,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                child: Text(
                                                  'For Students',
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff4A4A4A)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Image.asset(
                                              'assets/images/Path 59160.png')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.1,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 15, offset: Offset(0, 3), color: Color(0x29000000))
        ]),
        child: BottomAppBar(
          //  height: screenHeight*0.093,
          color: Colors.transparent,
          //elevation: 10,
          //shadowColor: Color(0x29000000),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Image.asset('assets/images/clock.png'),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(universityDetails == null
                          ?''
                          :universityDetails!.applicationDeadline.toString(),
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff4A4A4A)),
                        )
                      ]),
                      Text(
                        'Application Deadline',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffBDBDD2)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Applicationform(uId: universityDetails!.universityId.toString())));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54962E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      'Send Application',
                      style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
