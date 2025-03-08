import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  List<String> experienceItem = [];
  List<String> previousStudyItem = [];
  TextEditingController degreeNameController = TextEditingController();
  TextEditingController educationGapController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController previousStudyController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController uploadDocumentController = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    context.read<ApplicationFormProvider>().initializeForms();
  }

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
                          'Education Information',
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
            if (isOpen == !false)
              Padding(
                padding: const EdgeInsets.all(00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Provider.of<ApplicationFormProvider>(context,
                              listen: false)
                          .form
                          .length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      var provider =
                                          Provider.of<ApplicationFormProvider>(
                                              context,
                                              listen: false);
                                      var educationHistoryId = provider
                                          .applicationFormData!
                                          .educationHistories![index]
                                          .educationHistoryId;
                                      await provider.deleteRecord(
                                          '$educationHistoryId',
                                          "Education Details");
                                      print('rrrrook');
                                      provider.reemoveForm(index);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.yellow,
                                    ))
                              ],
                            ),
                            Provider.of<ApplicationFormProvider>(context,
                                    listen: true)
                                .form[index]
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, bottom: 50, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Higher Education
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 13, left: 8),
                                child: Text(
                                  'Degree Name ',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff54962E)),
                                ),
                              ),
                              TextFormField(
                                controller: degreeNameController,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff343D3C)),
                                decoration: InputDecoration(
                                    hintText: 'Enter Degree Name ',
                                    contentPadding:
                                        const EdgeInsets.only(top: 14),
                                    prefixIcon: Image.asset(
                                        'assets/images/Group 175920.png'),
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
                                padding: const EdgeInsets.only(top: 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
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
                                              color: selectedValueForStudyGap ==
                                                      'Yes'
                                                  ? Colors.green
                                                  : Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 4,
                                                  color:
                                                      selectedValueForStudyGap ==
                                                              'Yes'
                                                          ? const Color(
                                                              0xffD1F3BC)
                                                          : const Color(
                                                              0xffCCD7E2))),
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
                                              color: selectedValueForStudyGap ==
                                                      'no'
                                                  ? Colors.green
                                                  : Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 4,
                                                  color:
                                                      selectedValueForStudyGap ==
                                                              'no'
                                                          ? const Color(
                                                              0xffD1F3BC)
                                                          : const Color(
                                                              0xffCCD7E2))),
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
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 13, left: 8),
                                        child: Text(
                                          'Study Gap',
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff54962E)),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: educationGapController,
                                        keyboardType: TextInputType.number,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff343D3C)),
                                        decoration: InputDecoration(
                                            hintText: 'Enter Gap Years',
                                            contentPadding:
                                                const EdgeInsets.only(top: 14),
                                            prefixIcon: Image.asset(
                                                'assets/images/Group 175921.png'),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffDBE6F3),
                                              ),
                                            ),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xff54962E),
                                              ),
                                            )),
                                      ),
                                    ]),
                              ////

                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 13, left: 8),
                                child: Text(
                                  'Degree Start Date',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff54962E)),
                                ),
                              ),
                              TextFormField(
                                controller: startDateController,
                                onTap: () {
                                  selectDate(startDateController);
                                },
                                readOnly: true,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff343D3C)),
                                decoration: InputDecoration(
                                    hintText: 'Enter Start Date',
                                    contentPadding:
                                        const EdgeInsets.only(top: 14),
                                    prefixIcon: Image.asset(
                                        'assets/images/Group 175908.png'),
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
                                padding:
                                    const EdgeInsets.only(top: 13, left: 8),
                                child: Text(
                                  'Degree End Date',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff54962E)),
                                ),
                              ),
                              TextFormField(
                                controller: endDateController,
                                onTap: () {
                                  selectDate(endDateController);
                                },
                                readOnly: true,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff343D3C)),
                                decoration: InputDecoration(
                                    hintText: 'Enter End Date',
                                    contentPadding:
                                        const EdgeInsets.only(top: 14),
                                    prefixIcon: Image.asset(
                                        'assets/images/Group 175908.png'),
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
                              //
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 13, left: 8),
                                child: Text(
                                  'Upload Degree',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff54962E)),
                                ),
                              ),
                              TextFormField(
                                controller: uploadDocumentController,
                                onTap: () {
                                  getDegree();
                                },
                                readOnly: true,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff343D3C)),
                                decoration: InputDecoration(
                                    hintText: 'Upload Degree',
                                    contentPadding:
                                        const EdgeInsets.only(top: 14),
                                    prefixIcon: Image.asset(
                                        'assets/images/Group 175908.png'),
                                    // suffix: IconButton(onPressed: (){
                                    //   _degree =
                                    // }, icon:Icon(Icons.cancel_sharp)),
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
                              if (_degree != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    'Selected File: ${_degree?.name.toString()}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff212121)),
                                  ),
                                ),
                              const SizedBox(
                                height: 13,
                              ),
                              Center(
                                child: SizedBox(
                                  height: 56,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF54962E)),
                                      onPressed: () async {
                                        var provider = Provider.of<
                                                ApplicationFormProvider>(
                                            context,
                                            listen: false);
                                        await provider.setEducationData(
                                            degreeNameController.text,
                                            educationGapController.text,
                                            startDateController.text,
                                            endDateController.text,
                                            selectedValueForStudyGap.toString(),
                                            _degree);
                                        await provider
                                            .apiCallForEducation(context);
                                       // provider.fetchApplicationDeatils();
                                        await provider
                                            .fetchApplicationDeatils();
                                        provider.addForm();
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Save Education deatils',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                              // ElevatedButton(onPressed: (){
                              //  // _reemoveForm();
                              // }, child: Text('add'))
                            ],
                          ),
                        ),
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

  Future getDegree() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _degree = image;
      uploadDocumentController.text = _degree!.name;
    });
  }
}
