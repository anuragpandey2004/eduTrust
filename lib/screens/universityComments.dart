import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Universitycomments extends StatefulWidget {
  const Universitycomments({super.key});

  @override
  State<Universitycomments> createState() => _UniversitycommentsState();
}

class _UniversitycommentsState extends State<Universitycomments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          leading: Icon(Icons.arrow_back,color: Colors.white,),
          backgroundColor: const Color(0xFF54962E),
          actions: [
            Image.asset('assets/images/bell.png'),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Image.asset('assets/images/person_icon.png'),
            ),
          ],
          centerTitle: true,
          title: Text(
            "University",
            style: GoogleFonts.nunitoSans(
                color: const Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: [
            Text('university page'),
                        Text('university page')


          ],
        ),
    );
  }
}