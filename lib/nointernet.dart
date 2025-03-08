import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nointernet extends StatelessWidget {
  const Nointernet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/images/no_internet.png',
            color: Colors.red,
            height: 100,
          )),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child:  Text(
              "No Internet connection",
              style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text("Check your connection, then refresh the page."),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Color(0xff54962E)),
            ),
            onPressed: () {},
            child: Text(
              "Refresh",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xfffffffff)),
            ),
          ),
        ],
      ),
    );
  }
}
