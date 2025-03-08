import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _EducationState();
}

class _EducationState extends State<WorkExperience> {
  List<String> experienceItem = [];
  List<String> previousStudyItem = [];
  TextEditingController orgNameController = TextEditingController();
  TextEditingController refNameController = TextEditingController();
  TextEditingController refNumberController = TextEditingController();

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

  void initState() {
    super.initState();
    context.read<ApplicationFormProvider>().initializeWorkForms();
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
                          'Work Experience',
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Provider.of<ApplicationFormProvider>(context,
                              listen: false)
                          .workForm
                          .length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.yellow, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        var provider = Provider.of<
                                                ApplicationFormProvider>(
                                            context,
                                            listen: false);
                                        var workHistoryId = provider
                                            .applicationFormData!
                                            .workExperiences![index]
                                            .workExpId;
                                        await provider.deleteRecord(
                                            '$workHistoryId',
                                            "Work Experience");
                                        print('rrrrook');
                                        provider.reemoveWorkForm(index);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.yellow,
                                        size: 30,
                                      ))
                                ],
                              ),
                              Provider.of<ApplicationFormProvider>(context,
                                      listen: true)
                                  .workForm[index]
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Higher Education
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 13, left: 8),
                                child: Text(
                                  'Organisation Name',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff54962E)),
                                ),
                              ),
                              TextFormField(
                                controller: orgNameController,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff343D3C)),
                                decoration: InputDecoration(
                                    hintText: 'Enter Organisation Name',
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

                              //References
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 13, left: 8),
                                child: Text(
                                  'Reference Name',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff54962E)),
                                ),
                              ),
                              TextFormField(
                                // keyboardType: TextInputType.number,
                                controller: refNameController,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff343D3C)),
                                decoration: InputDecoration(
                                    hintText: 'Enter Reference Name',
                                    contentPadding:
                                        const EdgeInsets.only(top: 14),
                                    prefixIcon: Image.asset(
                                        'assets/images/Group 175913.png'),
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
                                  'References Number',
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
                                    hintText: 'Enter Reference Number',
                                    contentPadding:
                                        const EdgeInsets.only(top: 14),
                                    prefixIcon: Image.asset(
                                        'assets/images/Group 175913.png'),
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
                                  'Work Start Date',
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
                                  'Work End Date',
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
                                        //     provider.setWorkData('rrr','rrr', 'rrrr', 'rrrrr', 'rrrrr',);
                                        // provider.setWorkData(

                                        //     // degreeNameController.text,
                                        //     // refNameController.text,
                                        //     // refNumberController.text,
                                        //     // startDateController.toString(),
                                        //     // endDateController.text,
                                        //     //_degree
                                        //     );
                                        await provider.setWorkData(
                                            orgNameController.text,
                                            refNameController.text,
                                            refNumberController.text,
                                            startDateController.text,
                                            endDateController.text);
                                        await provider
                                            .apiCallForWorkForm(context);
                                        await provider
                                            .fetchApplicationDeatils();

                                        provider.addworkForm();
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Save Work Experience',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
