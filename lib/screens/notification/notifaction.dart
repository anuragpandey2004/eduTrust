import 'package:flutter/material.dart';
import 'package:flutter_list_view/screens/notification/component/notificatioCard.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifaction extends StatefulWidget {
  const Notifaction({super.key});

  @override
  State<Notifaction> createState() => _NotifactionState();
}

class _NotifactionState extends State<Notifaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon( Icons.arrow_back_rounded,
          color: Colors.white,
          size: 25,)),
        backgroundColor: const Color(0xFF54962E),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Image.asset('assets/images/bell.png'),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Notification",
          style: GoogleFonts.nunitoSans(
              color: const Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 20),
            child: Text(
                'Today',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121)),
              ),
          ),

          Notificatiocard(),
         Notificatiocard(),
        ],
      ),
    );
  }
}   