import 'package:flutter/material.dart';
import 'package:flutter_list_view/botom_navigatorbar.dart';
import 'package:flutter_list_view/screens/universityComment/universityCard.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_list_view/home.dart';

class Univesitycomments extends StatefulWidget {
  const Univesitycomments({super.key});

  @override
  State<Univesitycomments> createState() => _UnivesitycommentsState();
}

class _UnivesitycommentsState extends State<Univesitycomments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor: const Color(0xFF54962E),
          actions: [
            Image.asset('assets/images/bell.png'),
            Padding(
              padding: const EdgeInsets.only(right: 15),
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
       bottomNavigationBar: const BottomNevigaterHome(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 55,
          width: 55,
          child: FloatingActionButton(
            onPressed: () => (),
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 3, color: Colors.white),
                borderRadius: BorderRadius.circular(100)),
            child:const Icon(
              Icons.search_outlined,
              color: Colors.green,
            ),
          ),
        ),

      body:const SingleChildScrollView(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 8),
               child: Universitycard(universityLogo: 'assets/images/universityAvatar.png', 
               universityName: 'University Name', 
               universityAdd: 'Lorem Ipsum is simply dummy', 
               universityimage: 'assets/images/universityimage.png', 
               userName: 'Lorem Ipsum', 
               userdeatil: 'Lorem Ipsum is simply dummy text of the printing', 
               userlogo: 'assets/images/usre1.png', 
               description: 'Lorem Ipsum is simply dummy text... see more'),
             ),
             Universitycard(universityLogo: 'assets/images/university2.png', 
               universityName: 'University Name', 
               universityAdd: 'Lorem Ipsum is simply dummy', 
               universityimage: 'assets/images/university2.png', 
               userName: 'Lorem Ipsum', 
               userdeatil: 'Lorem Ipsum is simply dummy text of the printing', 
               userlogo: 'assets/images/usre1.png', 
               description: 'Lorem Ipsum is simply dummy text... see more'),
          ],
        ),
      )
    );
  }
} 