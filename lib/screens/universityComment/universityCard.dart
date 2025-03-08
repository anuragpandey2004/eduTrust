import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Universitycard extends StatefulWidget {
 final String universityName;
 final String universityAdd;
 final String universityLogo;
 final String description;
 final String universityimage;
 final String userlogo;
 final String userName;
 final String userdeatil;
  const Universitycard({
    super.key, 
    
    required this.universityLogo, 
    required this.universityName,
    required this.universityAdd,
    required this.universityimage,
    required this.userName,
    required this.userdeatil,
    required this.userlogo, 
    required this.description, 
    });

  @override
  State<Universitycard> createState() => _UniversitycardState();
}

class _UniversitycardState extends State<Universitycard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow:const  [
              BoxShadow(
                  color: Color(0x3300438E),
                  blurRadius: 20,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.0))
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //row for image,name and follow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //row for image,name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 2)),
                        child:  CircleAvatar(
                          backgroundImage:
                              AssetImage(widget.universityLogo),
                          radius: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.universityName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xff2A2A2A)),
                            ),
                            Text(
                              widget.universityAdd,
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/globe.png',
                                  color: const Color(0xff80869B),
                                ),
                                Text(
                                  '6h',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff80869B)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: screenHeight * 0.044,
                    width: screenWidth * 0.22,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF3FFEC),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Color(0xff54962E),
                          size: 12,
                        ),
                        Text(
                          'Follow',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff54962E)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff444D6E)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 56),
                    child: Text(
                      'see more',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF939EAA)),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: screenHeight * 0.25,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.universityimage,
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 9, right: 8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: screenWidth * 0.173,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage:
                                AssetImage('assets/images/comment1.png'),
                          ),
                          const Positioned(
                            left: 14,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  AssetImage('assets/images/comment2.png'),
                            ),
                          ),
                         const  Positioned(
                            left: 26,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  AssetImage('assets/images/comment3.png'),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Color(0xffFFFAD6),
                              child: Text(
                                '65+',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 10, fontWeight: FontWeight.w800),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 41),
                      child: Text(
                        '342 comments · 35 reposts',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color:const  Color(0xff747EA0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: SizedBox(
                        width: 39,
                        height: 22,
                        child: Stack(
                          children: [
                            Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xFFFFFFFF), width: 2)),
                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor: Color(0xff1977F3),
                                child: SizedBox(
                                  height: 7.8,
                                  width: 9,
                                  child: Image.asset(
                                    'assets/images/Group8.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 17,
                              child: Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xFFFFFFFF), width: 2)),
                                child: CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Color(0xffF31954),
                                  child: SizedBox(
                                    height: 8,
                                    width: 9,
                                    child: Image.asset(
                                      'assets/images/Group9.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9, top: 9, right: 53),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Path59593.png',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            'Like',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffA7AEC1)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Path59594.png',
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Comment',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffA7AEC1)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Path59592.png',
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.5),
                            child: Text(
                              'Share',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffA7AEC1)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Path59587.png',
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              'Save',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffA7AEC1)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 1, right: 1, top: 7),
              //   child: Container(
              //     height: 1,
              //     decoration: BoxDecoration(
              //       color: Color(0xff707070),
              //       // border: Border.all(width: 1,
              //       // //color: Color(0xff707070)
              //       // )
              //     ),
              //   ),
              // ),
              const Divider(
                color: Color(0xff707070),
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 9, bottom: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 17,
                      backgroundImage: AssetImage(widget.userlogo),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1B1B1B)),
                            ),
                            Text(
                              widget.userdeatil,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff7A8F86)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
