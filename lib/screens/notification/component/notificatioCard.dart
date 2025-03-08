import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class Notificatiocard extends StatefulWidget {
  const Notificatiocard({super.key});

  @override
  State<Notificatiocard> createState() => _NotificatiocardState();
}

class _NotificatiocardState extends State<Notificatiocard> {
  DateTime? notificationTime;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    // Start the timer to update the screen every second
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (notificationTime != null) {
        setState(() {});
      }
    });
    addNotification();
  }

  void addNotification() {
    setState(() {
      notificationTime = DateTime.now();
    });
  }

  String? getTimeDifference(DateTime notificationTime) {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(notificationTime);
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} mins';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours';
    } else {
      return '${difference.inDays} days';
    }
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF8F9FB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 11, right: 13),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/Group 173959.png'),
                  const SizedBox(
                    width: 3.4,
                  ),
                  notificationTime == null
                      ? const Text('time is not found')
                      : Text('${getTimeDifference(notificationTime!)}')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 12, right: 18, bottom: 18),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xffE0FFCE),
                    child: Image.asset(
                      'assets/images/Group 173973.png',
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem Ipsum is simply',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1B1E28)),
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff939EAA)),
                      )
                    ],
                  )
                ],
              ),
            ),
            // ElevatedButton(onPressed:addNotification, child: Text('add notification'))
          ],
        ),
      ),
    );
  }
}
