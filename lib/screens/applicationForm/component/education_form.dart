import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationForm extends StatefulWidget {
  String? name;
  String? startDate;
  String ? endDate;
  String ? id;
  //  final TextEditingController degreeNameController;
  // final TextEditingController educationGapController;
  // final TextEditingController startDateController;
  // final TextEditingController endDateController;
  // final XFile? degree;

  EducationForm(
      {required this.name,
      required this.startDate,
      required this.endDate,
      required this.id,
      // required this.degreeNameController,
      // required this.educationGapController,
      // required this.startDateController,
      // required this.endDateController,
      // this.degree,
      super.key});

  @override
  State<EducationForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EducationForm> {
  List<String> experienceItem = [];
  List<String> previousStudyItem = [];
  TextEditingController savedegreeNameController = TextEditingController();
  TextEditingController saveeducationGapController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController previousStudyController = TextEditingController();
  TextEditingController savestartDateController = TextEditingController();
  TextEditingController saveendDateController = TextEditingController();
  TextEditingController saveuploadDocumentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _degree;
  String? selectedValueforFuding;
  String? selectedValueforSelfFuding;
  String? selectedValueforStudentQuality;
  bool isOpen = false;
  FilePickerResult? result;
  String? selectedValueForStudyGap;
  String? workExperienceSelectet;
  String? referencesSelect;

  Future selectDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(1924), lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  void onPressedFun() {}
 // void addData() {
   // var provider = Provider.of<ApplicationFormProvider>(context, listen: false);
 //   var data = provider.applicationFormData!.educationHistories!.length;
  //}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.cancel,size: 30,color: Colors.grey,))
              ],),
              //Higher Education
              Padding(
                padding: const EdgeInsets.only(top:0, left: 8),
                child: Text(
                  'Degree Name ',
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff54962E)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175910.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.name ?? 'jjj',
                            // selectedValueforCountry == null
                            //     ? 'Select Country'
                            //     : selectedValueforCountry
                            //         .toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff343D3C)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Divider(
                  height: 1,
                  color: Color(0xffDBE6F3),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Do you have any study gap?',
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
                            selectedValueForStudyGap = "Yes";
                          });
                        },
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                              color: selectedValueForStudyGap == 'Yes'
                                  ? Colors.green
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: selectedValueForStudyGap == 'Yes'
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
                            selectedValueForStudyGap = 'no';
                          });
                        },
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                              color: selectedValueForStudyGap == 'no'
                                  ? Colors.green
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: selectedValueForStudyGap == 'no'
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
              if (selectedValueForStudyGap == 'Yes')
                //Study gap
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 8),
                    child: Text(
                      'Study Gap',
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff54962E)),
                    ),
                  ),
                  TextFormField(
                    controller: savedegreeNameController,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff343D3C)),
                    decoration: InputDecoration(
                        hintText: 'Enter Gap Years',
                        contentPadding: const EdgeInsets.only(top: 14),
                        prefixIcon: Image.asset('assets/images/Group 175921.png'),
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
              ////
              ///
               Padding(
                padding: const EdgeInsets.only(top: 13, left: 8),
                child: Text(
                  'Degree Start Date ',
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff54962E)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175910.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.startDate ?? 'jjj',
                            // selectedValueforCountry == null
                            //     ? 'Select Country'
                            //     : selectedValueforCountry
                            //         .toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff343D3C)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Divider(
                  height: 1,
                  color: Color(0xffDBE6F3),
                ),
              ),
          //???
           Padding(
                padding: const EdgeInsets.only(top: 13, left: 8),
                child: Text(
                  'Degree End Date ',
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff54962E)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175910.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.endDate ?? 'jjj',
                            // selectedValueforCountry == null
                            //     ? 'Select Country'
                            //     : selectedValueforCountry
                            //         .toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff343D3C)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Divider(
                  height: 1,
                  color: Color(0xffDBE6F3),
                ),
              ),
              // ?????????
               Padding(
                padding: const EdgeInsets.only(top: 13, left: 8),
                child: Text(
                  'upload Documents',
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff54962E)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175910.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.name ?? 'jjj',
                            // selectedValueforCountry == null
                            //     ? 'Select Country'
                            //     : selectedValueforCountry
                            //         .toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff343D3C)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Divider(
                  height: 1,
                  color: Color(0xffDBE6F3),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 13, left: 8),
              //   child: Text(
              //     'Degree Start Date',
              //     style: GoogleFonts.poppins(
              //         fontSize: 13,
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xff54962E)),
              //   ),
              // ),
              // TextFormField(
              //   controller: savestartDateController,
              //   onTap: () {
              //     selectDate(savestartDateController);
              //   },
              //   readOnly: true,
              //   style: GoogleFonts.poppins(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w400,
              //       color: const Color(0xff343D3C)),
              //   decoration: InputDecoration(
              //       hintText: 'Enter Start Date',
              //       contentPadding: const EdgeInsets.only(top: 14),
              //       prefixIcon: Image.asset('assets/images/Group 175908.png'),
              //       enabledBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xffDBE6F3),
              //         ),
              //       ),
              //       focusedBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xff54962E),
              //         ),
              //       )),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 13, left: 8),
              //   child: Text(
              //     'Degree End Date',
              //     style: GoogleFonts.poppins(
              //         fontSize: 13,
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xff54962E)),
              //   ),
              // ),
              // TextFormField(
              //   controller: saveendDateController,
              //   onTap: () {
              //     selectDate(saveendDateController);
              //   },
              //   readOnly: true,
              //   style: GoogleFonts.poppins(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w400,
              //       color: const Color(0xff343D3C)),
              //   decoration: InputDecoration(
              //       hintText: 'Enter End Date',
              //       contentPadding: const EdgeInsets.only(top: 14),
              //       prefixIcon: Image.asset('assets/images/Group 175908.png'),
              //       enabledBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xffDBE6F3),
              //         ),
              //       ),
              //       focusedBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xff54962E),
              //         ),
              //       )),
              // ),
              // //
              // Padding(
              //   padding: const EdgeInsets.only(top: 13, left: 8),
              //   child: Text(
              //     'Upload Degree',
              //     style: GoogleFonts.poppins(
              //         fontSize: 13,
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xff54962E)),
              //   ),
              // ),
              // TextFormField(
              //   controller: saveuploadDocumentController,
              //   onTap: () {
              //     getDegree();
              //   },
              //   readOnly: true,
              //   style: GoogleFonts.poppins(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w400,
              //       color: const Color(0xff343D3C)),
              //   decoration: InputDecoration(
              //       hintText: 'Upload Degree',
              //       contentPadding: const EdgeInsets.only(top: 14),
              //       prefixIcon: Image.asset('assets/images/Group 175908.png'),
              //       // suffix: IconButton(onPressed: (){
              //       //   _degree =
              //       // }, icon:Icon(Icons.cancel_sharp)),
              //       enabledBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xffDBE6F3),
              //         ),
              //       ),
              //       focusedBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xff54962E),
              //         ),
              //       )),
              // ),
              // if (_degree != null)
              //   Padding(
              //     padding: const EdgeInsets.only(top: 8),
              //     child: Text(
              //       'Selected File: ${_degree?.name.toString()}',
              //       style: GoogleFonts.poppins(
              //           fontSize: 13,
              //           fontWeight: FontWeight.w400,
              //           color: const Color(0xff212121)),
              //     ),
              //   ),
              //   index != forms.length - 1)
              //  if(index ==Provider.of<ApplicationFormProvider>(context,listen:false).form.length-1)
              // const SizedBox(height: 13,),
              // Center(
              //   child: SizedBox(
              //     height: 56,
              //     child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: const Color(0xFF54962E)),
              //         onPressed: () {
              //           var provider =
              //               Provider.of<ApplicationFormProvider>(
              //                   context,
              //                   listen: false);
              //           provider.setEducationData(
              //               savedegreeNameController.text,
              //               saveeducationGapController.text,
              //               savestartDateController.text,
              //               saveendDateController.text,
              //               selectedValueForStudyGap.toString(),
              //               _degree
          
              //               );
              //           provider.apiCallForEducation(context);
              //         },
              //         child: Text(
              //           'Save Education deatils',
              //           style: GoogleFonts.poppins(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white),
              //         )),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void onn() {}
  Future getDegree() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _degree = image;
      saveuploadDocumentController.text = _degree!.name;
    });
  }
}
