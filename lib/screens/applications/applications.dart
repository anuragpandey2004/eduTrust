import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/applied_university_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Applications extends StatefulWidget {
  const Applications({super.key});

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  void initState() {
    super.initState();
    // Fetch data during initialization
    final provider = Provider.of<AppliedUniversityProvider>(context, listen: false);
    provider.fetchApplicationDeatils();
    provider.initializeForms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
        backgroundColor: const Color(0xFF54962E),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Image.asset('assets/images/bell.png'),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Application",
          style: GoogleFonts.nunitoSans(
            color: const Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<AppliedUniversityProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.universityCards.isEmpty) {
            return const Center(
              child: Text("No applications found."),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: provider.universityCards,
            ),
          );
        },
      ),
    );
  }
}
