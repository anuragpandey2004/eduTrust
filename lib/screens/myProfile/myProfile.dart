import 'package:flutter/material.dart';
import 'package:flutter_list_view/screens/myProfile/componet/formValidater.dart';
import 'package:flutter_list_view/screens/myProfile/componet/myprofile_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

//import 'package:flutter_list_view/home.dart';
class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  // ignore: unused_field
  XFile? _profileImage;
  String? _selectedGender; //for Gender

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    //double screenHeight = screenSize.height;
   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
        backgroundColor: const Color(0xFF54962E),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Image.asset('assets/images/Group 159350.png'),
          ),
        ],
        centerTitle: true,
        title: Text(
          "MY PROFILE",
          style: GoogleFonts.nunitoSans(
              color: const Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
         body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            width: screenWidth,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 10),
                    blurRadius: 30,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 35,),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                              height: screenWidth * 0.288,
                              width: screenWidth * 0.288,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x66015440),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 48,
                                  backgroundColor: Colors.grey,
                                ),
                              )),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: InkWell(
                              onTap: getProfileImage,
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: const Color(0xff54962E),
                                        width: 2),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Group 164829.png')),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Center(
                      child: Text(
                        'LOREM IPSUM',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff444657)),
                      ),
                    ),
                    Center(
                      child: Text('Lorem Ipsum@gmail.com',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff87879D))),
                    ),

                    Text(
                      'Full Name',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff87879D)),
                    ),
                    MyprofileTextField(
                      controllers: nameController,
                      hintText: 'Full Name',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Email Address',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff87879D)),
                    ),
                    MyprofileTextField(
                      controllers: emailController,
                      hintText: 'Email@gamil.com',
                      keyboardType: TextInputType.emailAddress,
                      validator: Formvalidater.validateEmail,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Phone Number',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff87879D)),
                    ),
                    MyprofileTextField(
                      controllers: phoneController,
                      hintText: '+123 5324 4216',
                      keyboardType: TextInputType.phone,
                    ),
                    //  ElevatedButton(onPressed: (){
                    //   if (Form.of(context)?.validate() ?? false) {
                    //     print('Form is valid');
                    //   }
                    //  }, child: Text('save'))
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Gender',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff87879D)),
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'male',
                            groupValue: _selectedGender,
                            activeColor: Colors.yellow,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            }),
                        Text(
                          'Male',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1B1E28)),
                        ),
                        Radio(
                            value: 'female',
                            groupValue: _selectedGender,
                            activeColor: Colors.yellow,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            }),
                        Text(
                          'Female',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1B1E28)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'User Address',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff87879D)),
                    ),
                    SizedBox(
                      height: 100,
                      child: TextFormField(

                          /// controller: widget.controllers,

                          maxLines: null,
                          expands: true,
                          //validator: widget.validator,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1F2937)),
                          decoration: InputDecoration(
                            // hintText: widget.hintText,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Date of Birthday',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff87879D)),
                    ),
                    TextFormField(
                      controller: dobController,
                      onTap: () {
                        selectDate();
                      },
                      readOnly: true,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff343D3C)),
                      decoration: InputDecoration(
                        enabledBorder: null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 5),
                        suffixIcon:
                            Image.asset('assets/images/Group 175908.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getProfileImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _profileImage = image;
    });
  }

  Future selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context, firstDate: DateTime(1924), lastDate: DateTime.now());
    if (_picked != null) {
      setState(() {
        dobController.text = DateFormat('yyyy-MM-dd').format(_picked);
      });
    }
  }
}
