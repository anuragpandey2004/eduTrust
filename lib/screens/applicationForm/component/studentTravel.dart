//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Studenttravel extends StatefulWidget {
  const Studenttravel({super.key});

  @override
  State<Studenttravel> createState() => _StudenttravelState();
}

class _StudenttravelState extends State<Studenttravel> {
  final ImagePicker _picker = ImagePicker();
  XFile? _degreee;
  XFile? _visaFile;
  List<String> visaItem = [];
  bool isOpen = false;
  String? passportSelect;
  String? visaRefusalSelect;
  String? visaSelect;
  FilePickerResult? result;
  TextEditingController passportController = TextEditingController();
  TextEditingController passportNumController = TextEditingController();
  TextEditingController visaNumController = TextEditingController();
  TextEditingController visaRefController = TextEditingController();

  String passportImg = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
                color: Color(0x26000000),
                blurRadius: 14,
                offset: Offset(0, 0),
                spreadRadius: 0)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Color(0xffF9FFF5)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 12, left: 26, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Student Travel        ',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff212121)),
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff939EAA)),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color(0xffD9F99D),
                        child: isOpen
                            ? const Icon(Icons.arrow_drop_up)
                            : const Icon(Icons.arrow_drop_down),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (isOpen == true)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              'Do you have any Passport ?',
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff343D3C)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  passportSelect = "Yes";
                                });
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color: passportSelect == 'Yes'
                                        ? Colors.green
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4,
                                        color: passportSelect == 'Yes'
                                            ? const Color(0xffD1F3BC)
                                            : const Color(0xffCCD7E2))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Yes',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  passportSelect = 'no';
                                });
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color: passportSelect == 'no'
                                        ? Colors.green
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4,
                                        color: passportSelect == 'no'
                                            ? const Color(0xffD1F3BC)
                                            : const Color(0xffCCD7E2))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'No',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //References
                    if (passportSelect == "Yes")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 8),
                            child: Text(
                              'Passport Number',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff54962E)),
                            ),
                          ),
                          TextFormField(
                            controller: passportNumController,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff343D3C)),
                            decoration: InputDecoration(
                                hintText: 'Enter Passport Number',
                                contentPadding: const EdgeInsets.only(top: 14),
                                prefixIcon: Image.asset(
                                    'assets/images/Group 175902.png'),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffDBE6F3),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff54962E),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 8),
                            child: Text(
                              'Upload Passport',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff54962E)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 10, top: 8),
                            child: InkWell(
                              onTap: () async {
                                // result = await FilePicker.platform.pickFiles();
                                // if (result != null) {
                                //   File file = File(result!.files.single.path!);
                                //   print(file);
                                // } else {
                                //   print('');
                                // }
                                // getDegree(_degreee,);
                                uploadDocument((file) => _degreee = file);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Group 175923.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(_degreee?.name ?? 'Default Name'),
                                    ],
                                  ),
                                  Image.asset('assets/images/Group 175760.png')
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Divider(
                              height: 1,
                              color: Color(0xffDBE6F3),
                            ),
                          ),
                        ],
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              'Do you have any visa?',
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff343D3C)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  visaSelect = "Yes";
                                });
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color: visaSelect == 'Yes'
                                        ? Colors.green
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4,
                                        color: visaSelect == 'Yes'
                                            ? const Color(0xffD1F3BC)
                                            : const Color(0xffCCD7E2))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Yes',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  visaSelect = 'no';
                                });
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color: visaSelect == 'no'
                                        ? Colors.green
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4,
                                        color: visaSelect == 'no'
                                            ? const Color(0xffD1F3BC)
                                            : const Color(0xffCCD7E2))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'No',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //References
                    if (visaSelect == "Yes")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 8),
                            child: Text(
                              'Visa Number',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff54962E)),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff343D3C)),
                            decoration: InputDecoration(
                                hintText: 'Enter Visa Number',
                                contentPadding: const EdgeInsets.only(top: 14),
                                prefixIcon: Image.asset(
                                    'assets/images/Group 175902.png'),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffDBE6F3),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff54962E),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 8),
                            child: Text(
                              'Upload Visa',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff54962E)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 10, top: 8),
                            child: InkWell(
                              onTap: () async {
                              // result = await FilePicker.platform.pickFiles();
                                // if (result != null) {
                                //   File file = File(result!.files.single.path!);
                                //   print(file);
                                // } else {
                                //   print('');
                                // }
                                uploadDocument((file) => _visaFile = file);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Group 175923.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Text(_visaFile?.name ?? 'Default Name'),
                                    ],
                                  ),
                                  Image.asset('assets/images/Group 175760.png')
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Divider(
                              height: 1,
                              color: Color(0xffDBE6F3),
                            ),
                          ),
                        ],
                      ),

                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              'Do you have any visa refusal ?',
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff343D3C)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  visaRefusalSelect = "Yes";
                                });
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color: visaRefusalSelect == 'Yes'
                                        ? Colors.green
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4,
                                        color: visaRefusalSelect == 'Yes'
                                            ? const Color(0xffD1F3BC)
                                            : const Color(0xffCCD7E2))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Yes',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  visaRefusalSelect = 'no';
                                });
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color: visaRefusalSelect == 'no'
                                        ? Colors.green
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4,
                                        color: visaRefusalSelect == 'no'
                                            ? const Color(0xffD1F3BC)
                                            : const Color(0xffCCD7E2))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'No',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //References
                    if (visaRefusalSelect == "Yes")
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Visa Refusal Reason',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            TextFormField(
                              controller: visaRefController,
                              // keyboardType: TextInputType.number,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff343D3C)),
                              decoration: InputDecoration(
                                  hintText: 'Enter Visa Refusal Reason',
                                  contentPadding:
                                      const EdgeInsets.only(top: 14),
                                  prefixIcon: Image.asset(
                                      'assets/images/Group 175896.png'),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffDBE6F3),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff54962E),
                                    ),
                                  )),
                            ),
                          ]),

                    const SizedBox(
                      height: 13,
                    ),
                    Center(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF54962E)),
                            onPressed: () {
                              var provider =
                                  Provider.of<ApplicationFormProvider>(context,
                                      listen: false);
                              provider.setTravelData(
                                  passportSelect.toString(),
                                  visaSelect.toString(),
                                  visaRefusalSelect.toString(),
                                  passportNumController.text,
                                  visaNumController.text,
                                  visaRefController.text,
                                  _degreee,
                                  _visaFile);
                              provider.apiCallForTravel(context);
                            },
                            child: Text(
                              'Save Education deatils',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

//    Future getDegree(  XFile? degree,
// ) async {
//     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       degree = image;
//      // passportImg = _degree!.name.toString();
//       //print(controller);
//     });
//   }
  Future<void> uploadDocument(Function(XFile?) updateCallback) async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        updateCallback(file);
      });
    }
  }
}
