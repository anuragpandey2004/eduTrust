import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_list_view/model/all_location_model';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:flutter_list_view/provider/dashbord_provider.dart';
import 'package:flutter_list_view/screens/myProfile/componet/formValidater.dart';
import 'package:flutter_list_view/utils/shared_prefs.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';

class Personalinformation extends StatefulWidget {
  const Personalinformation({super.key});

  @override
  State<Personalinformation> createState() => _PersonalinformationState();
}

class _PersonalinformationState extends State<Personalinformation> {
  //String? gender;
  bool isopen = false; //for Personal information
  final dobController = TextEditingController(); //for DOB controller
  String? genderSelected; //for Gender
  TextEditingController nameController =   TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController alternateMobileNumberController =
      TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? selectedValueforCountry;
  String? selectedValueforCity;
  String? selectedValueforGender;
  String? selectedValueforMarital;
  final formKeyForPersonalInfo = GlobalKey<FormState>();
  List<GetAllLocation> countryList = [];
  List<GetAllLocation> cityList = [];

  @override
  initState() {
    super.initState();
    
   //var provider = Provider.of<ApplicationFormProvider>(context, listen: false);
      fetchApplicationDeatils();
    setMobile();
    storeDataInCountry();
   // nameController.text = provider.applicationFormData!.fullName.toString();
    
    setState(() {
      
    });
    // StoreDataInCity();
  }
  

  Future setMobile() async {
    mobileController.text = (await SharedPrefs().getString('phone'))!;
  }

  Future fetchApplicationDeatils() async {
    // await Future.delayed(const Durationsetz(seconds: 5), () {
    //   Provider.of<ApplicationFormProvider>(context, listen: false)
    //       .fetchApplicationDeatils();
    // }
   // );
  var provider = Provider.of<ApplicationFormProvider>(context,listen: false);
  await provider.fetchApplicationDeatils();
  setState(() {
    
      nameController.text= provider.applicationFormData!.fullName.toString();
      alternateMobileNumberController.text= provider.applicationFormData!.alternateMobileNumber.toString();
      emailController.text= provider.applicationFormData!.email.toString();
      selectedValueforCountry = provider.applicationFormData!.nationality.toString();
      selectedValueforCity = provider.applicationFormData!.city.toString();
      selectedValueforMarital =provider.applicationFormData!.maritalStatus.toString();


  });

  }

  void storeDataInCountry() {
    final provider = Provider.of<DashbordProvider>(context, listen: false);
    final uniqueCountry = <String>{};
    countryList = provider.allLocation.where((value) {
      final isUnique = uniqueCountry.add(value.country.toString());
      return isUnique;
    }).toList();
    // print(countryList);
  }

  void storeDataInCity() {
    final provider = Provider.of<DashbordProvider>(context, listen: false);
    //final uniqueCountry = <String>{};
    cityList = provider.allLocation.where((value) {
      final Set countryCitiey = {};
      if (value.country == selectedValueforCountry.toString()) {
        return countryCitiey.add(value.country.toString());
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String countryCode = '+91';

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    //var screenHeight = screenSize.height;
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 14,
                  offset: Offset(0, 0),
                  spreadRadius: 0)
            ]),
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
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Personal Information',
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
                          isopen = !isopen;
                        });
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color(0xffD9F99D),
                        child: isopen
                            ? const Icon(Icons.arrow_drop_up)
                            : const Icon(Icons.arrow_drop_down),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (isopen == !false)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Provider.of<ApplicationFormProvider>(context,
                                listen: false)
                            .isLoading ==
                        true
                    ? const Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                        color: Colors.white,
                      ))
                    : Form(
                        key: formKeyForPersonalInfo,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Name
                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Full Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            TextFormField(
                              controller: nameController,
                              validator: (value) =>
                                  Formvalidater.validateFullName(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff343D3C)),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(top: 14),
                                  prefixIcon: Image.asset(
                                      'assets/images/Group 175656.png'),
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
                            //mobile number

                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Mobile Number',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            TextFormField(
                              controller: mobileController,
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff343D3C)),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(20),

                                  //contentPadding: EdgeInsets.only(top: 20),

                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                            'assets/images/Group 175676.png'),
                                        CountryCodePicker(
                                          onChanged: (code) {
                                            setState(() {
                                              countryCode =
                                                  code.dialCode ?? '+91';
                                            });
                                          },
                                          initialSelection: 'IN',
                                          //favorite: ['+91', 'US'],
                                          showCountryOnly: false,
                                          showFlag: false,
                                          showDropDownButton: true,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: false,
                                        ),
                                      ],
                                    ),
                                  ),
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

                            // alternate mobile Number
                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Alternate Mobile Number',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            TextFormField(
                              controller: alternateMobileNumberController,
                              validator: (value) =>
                                  Formvalidater.validatePhoneNumber(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,

                              keyboardType: TextInputType.number,
                              //maxLength: 10,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],

                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff343D3C)),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: 20),
                                prefixIcon: Image.asset(
                                    'assets/images/Group 175676.png'),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffDBE6F3),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff54962E),
                                  ),
                                ),
                              ),
                            ),

                            //Gmail

                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Email ID',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (value) =>
                                  Formvalidater.validateEmail(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff343D3C)),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(top: 14),
                                  prefixIcon: Image.asset(
                                    'assets/images/Path 52043.png',height: 10,width: 10,
                                  ),
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

                            //Nationaliy
                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Nationaliy',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 10, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Group 175910.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text(
                                          selectedValueforCountry == null
                                              ? 'Select Country'
                                              : selectedValueforCountry
                                                  .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff343D3C)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton<GetAllLocation>(
                                        iconEnabledColor: const Color(0xff939EAA),
                                        menuWidth: double.maxFinite,

                                        //  value: selectedValuefor,
                                        items: countryList.map((value) {
                                          return DropdownMenuItem<
                                              GetAllLocation>(
                                            value: value,
                                            child:
                                                Text(value.country.toString()),
                                          );
                                        }).toList(),
                                        // const [

                                        //   DropdownMenuItem(
                                        //       value: ' yes', child: Text('yes')),
                                        //   DropdownMenuItem(
                                        //       value: 'no', child: Text('no')),
                                        // ]

                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedValueforCountry =
                                                newValue!.country.toString();
                                            storeDataInCity();
                                          });
                                        }),
                                  )
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
                            // TextFormField(
                            //   style: GoogleFonts.poppins(
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w400,
                            //       color: Color(0xff343D3C)),
                            //   decoration: InputDecoration(
                            //       contentPadding: EdgeInsets.only(top: 14),
                            //       prefixIcon: Image.asset(
                            //           'assets/images/Path 63155.png'),
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
                            if (selectedValueforCountry != null)
                              //current Location
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 8),
                                      child: Text(
                                        'Current City',
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff54962E)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 10, top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/Group 175910.png',
                                                height: 24,
                                                width: 24,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12),
                                                child: Text(
                                                  selectedValueforCity == null
                                                      ? 'Select City'
                                                      : selectedValueforCity
                                                          .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xff343D3C)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<
                                                    GetAllLocation>(
                                                iconEnabledColor:
                                                    const Color(0xff939EAA),
                                                menuWidth: double.maxFinite,
                                                //  value: selectedValuefor,
                                                items: cityList.map((value) {
                                                  return DropdownMenuItem<
                                                      GetAllLocation>(
                                                    value: value,
                                                    child: Text(
                                                        value.city.toString()),
                                                  );
                                                }).toList(),
                                                // const [

                                                //   DropdownMenuItem(
                                                //       value: ' yes', child: Text('yes')),
                                                //   DropdownMenuItem(
                                                //       value: 'no', child: Text('no')),
                                                // ]

                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectedValueforCity =
                                                        newValue!.city
                                                            .toString();
                                                  });
                                                }),
                                          )
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
                                  ]),
                            //Gender

                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Gender',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset('assets/images/Group 175679.png'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          genderSelected = 'male';
                                        });
                                      },
                                      child: Container(
                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                            color: genderSelected == 'male'
                                                ? Colors.green
                                                : Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 4,
                                                color: genderSelected == 'male'
                                                    ? const Color(0xffD1F3BC)
                                                    : const Color(0xffCCD7E2))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    'Male',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff939EAA)),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        genderSelected = 'Female';
                                      });
                                    },
                                    child: Container(
                                      height: 28,
                                      width: 28,
                                      decoration: BoxDecoration(
                                          color: genderSelected == 'Female'
                                              ? Colors.green
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 4,
                                              color: genderSelected == 'Female'
                                                  ? const Color(0xffD1F3BC)
                                                  : const Color(0xffCCD7E2))),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    'Female',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff939EAA)),
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

                            //DOB
                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Date of Birth',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
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
                            //Marital Status

                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 8),
                              child: Text(
                                'Marital Status',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff54962E)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 10, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Group 175910.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text(
                                          selectedValueforMarital == null
                                              ? 'Select Marital Status'
                                              : selectedValueforMarital
                                                  .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff343D3C)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        iconEnabledColor: const Color(0xff939EAA),
                                        menuWidth: double.maxFinite,

                                        //  value: selectedValuefor,
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'married',
                                            child: Text('Married'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'unmarried',
                                            child: Text('Unmarried'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'devorced',
                                            child: Text('Devorced'),
                                          )
                                        ],
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedValueforMarital = newValue;
                                          });
                                        }),
                                  )
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

                            // TextFormField(
                            //   style: GoogleFonts.poppins(
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w400,
                            //       color: Color(0xff343D3C)),
                            //   decoration: InputDecoration(
                            //       contentPadding: EdgeInsets.only(top: 14),
                            //       prefixIcon: Image.asset(
                            //           'assets/images/Group 175909.png'),
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
                                    onPressed: () {
                                      formKeyForPersonalInfo.currentState!
                                          .validate();
                              
                                      var provider = Provider.of<
                                              ApplicationFormProvider>(
                                          context,
                                          listen: false);
                                      provider.setApplicantData(
                                          nameController.text,
                                          mobileController.text,
                                          emailController.text,
                                          alternateMobileNumberController.text,
                                          selectedValueforCountry.toString(),
                                          selectedValueforCity.toString(),
                                          selectedValueforGender.toString(),
                                          selectedValueforMarital.toString()
                                          );
                                      provider.apiCallForSave(context);
                                    },
                                    child: Text(
                                      'Save Details',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        )),
              )
          ],
        ),
      ),
    );
  }

  Future selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(1924), lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
