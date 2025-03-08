

import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Uploaddocument extends StatefulWidget {
  const Uploaddocument({super.key});

  @override
  State<Uploaddocument> createState() => _UploaddocumentState();
}

class _UploaddocumentState extends State<Uploaddocument> {
  FilePickerResult? result;
     final ImagePicker _picker = ImagePicker();

  bool isOpen = false;
  String? selectedFileName;
  XFile? _cv;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //var provider = Provider.of<ApplicationFormProvider>(context,listen: false);
    setState(() {
    // selectedFileName= provider.applicationFormData!.uploadedDocs;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
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
                          'Upload Documents ',
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13, left: 8),
                      child: Text(
                        'Curriculum Vitae (CV)',
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff54962E)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 10, top: 8),
                      child: InkWell(
                        onTap: () async {
                          // result = await FilePicker.platform.pickFiles();
                          // if (result != null) {
                          //   File file = File(result!.files.single.path!);
                          //   setState(() {
                          //     selectedFileName = result!.files.single.name;
                          //   });
                          //   print(file);
                          // } else {
                          //   setState(() {
                          //     selectedFileName = '';
                          //   });
                          //   print('');
                          // }
                          uploadDocument();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/Group 175924.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 13,), 

                                Text(
                                  selectedFileName ?? 'Upload Document'),
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
                    // if (selectedFileName != null)
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 8),
                    //     child: Text(
                    //       'Selected File: $selectedFileName',
                    //       style: GoogleFonts.poppins(
                    //           fontSize: 13,
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xff212121)),
                    //     ),
                    //   ),
                   const SizedBox(height: 10,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF54962E)),
                              onPressed: () {
                                var provider = Provider.of<ApplicationFormProvider>(context,listen: false);
                                provider.uploadCV(context, _cv);
                              },
                              child: Text(
                                'Upload Document',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Text(${file})
          ],
        ),
      ),
    );
  }

Future<void> uploadDocument() async {
  XFile? file = await _picker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    setState(() {
    _cv = file;
    selectedFileName = file.name; 
    });
  }
}
}
