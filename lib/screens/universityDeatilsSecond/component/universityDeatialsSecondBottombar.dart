import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/specific_applied_uni_modal.dart';
import 'package:flutter_list_view/provider/specific_applied_uni_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Universitydeatialssecondbottombar extends StatefulWidget {
  Universitydeatialssecondbottombar({super.key});

  @override
  State<Universitydeatialssecondbottombar> createState() => _UniversitydeatialssecondbottombarState();
}

class _UniversitydeatialssecondbottombarState extends State<Universitydeatialssecondbottombar> {
  SpecificAppliedUniversity? data ;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<SpecificAppliedUniProvider>(context,listen: false);
    data = provider.specificAppliedUniversity;

  }
  @override
  Widget build(BuildContext context) {
   // Size screenSize = MediaQuery.of(context).size;
    //double screenWidth = screenSize.width;
  //  double screenHeight = screenSize.height;
    return Padding(
      padding: const EdgeInsets.only(top: 49,),
      child: Container(
       // height: screenHeight*0.185,
        decoration: const BoxDecoration(
          color: Colors.white,
           boxShadow: [
          BoxShadow(
              color: Color(0x29000000),
               blurRadius: 15, offset: Offset(0, 3))
        ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 19,left: 23,right: 25,bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( data?.universityName.toString()??
                'University Of Lorem Ipsum',
                style: GoogleFonts.nunitoSans(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2E2E2E)),
              ),
              Image.asset('assets/images/starwithtext.png'),
              const SizedBox(height: 7,),
              Text(
                data?.description.toString()??
                'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text ofof Lorem Ipsum is simply dummy text ofthe printing and typesetting industry. Lorem Ipsum has been the industry typesetting industry. Lorem Ipsum has been the industry',
                style: GoogleFonts.nunitoSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff5B5B5B)),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
