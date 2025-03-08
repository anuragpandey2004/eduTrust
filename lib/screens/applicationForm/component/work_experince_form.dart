import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WorkExperinceForm extends StatefulWidget {
  String? orgName;
  String ? refName;
  String? refNumber;
  String? startDate;
  String? endDate;
   WorkExperinceForm({
    required this.refName,
    required this.orgName,
    required this.refNumber,
    required this.startDate,
    required this.endDate,
    super.key});

  @override
  State<WorkExperinceForm> createState() => _WorkExperinceFormState();
}

class _WorkExperinceFormState extends State<WorkExperinceForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Higher Education
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 8),
            child: Row(
              children: [
                Text(
                  'Organisation Name',
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff54962E)),
                ),
            //     const Spacer(),
            //  //   if (formWidgets.length > 1 && index != formWidgets.length - 1)
            //       IconButton(
            //           onPressed: () => (),
            //           //removeForm(index),
            //           icon: const Icon(
            //             Icons.cancel,
            //             color: Colors.green,
            //             size: 35,
            //           ))
              ],
            ),
          ),
          // TextFormField(
          //  // controller: degreeNameController,
          //   style: GoogleFonts.poppins(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: const Color(0xff343D3C)),
          //   decoration: InputDecoration(
          //       hintText: 'Enter Organisation Name',
          //       contentPadding: const EdgeInsets.only(top: 14),
          //       prefixIcon: Image.asset('assets/images/Group 175920.png'),
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
                Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175920.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.orgName ?? 'jjj',
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
          //References
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 8),
            child: Text(
              'Reference Name',
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff54962E)),
            ),
          ),
          // TextFormField(
          //   // keyboardType: TextInputType.number,
          //   //controller: refNameController,
          //   style: GoogleFonts.poppins(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: const Color(0xff343D3C)),
          //   decoration: InputDecoration(
          //       hintText: 'Enter Reference Name',
          //       contentPadding: const EdgeInsets.only(top: 14),
          //       prefixIcon: Image.asset('assets/images/Group 175913.png'),
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
           Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175913.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.refName ?? 'jjj',
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
            padding: const EdgeInsets.only(top: 13, left: 8),
            child: Text(
              'References Number',
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff54962E)),
            ),
          ),
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   style: GoogleFonts.poppins(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: const Color(0xff343D3C)),
          //   decoration: InputDecoration(
          //       hintText: 'Enter Reference Number',
          //       contentPadding: const EdgeInsets.only(top: 14),
          //       prefixIcon: Image.asset('assets/images/Group 175913.png'),
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
           Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175913.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.refName ?? 'jjj',
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
            padding: const EdgeInsets.only(top: 13, left: 8),
            child: Text(
              'Work Start Date',
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff54962E)),
            ),
          ),
          // TextFormField(
          //  // controller: startDateController,
          //   onTap: () {
          //    // selectDate(startDateController);
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
           Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175908.png',
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
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 8),
            child: Text(
              'Work End Date',
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff54962E)),
            ),
          ),
          // TextFormField(
          //  // controller: endDateController,
          //   onTap: () {
          //   //  selectDate(endDateController);
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
    
         Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 175908.png',
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.endDate?? 'jjj',
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
          //
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 8),
            child: Text(
              'Upload Degree',
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff54962E)),
            ),
          ),
          TextFormField(
          //  controller: uploadDocumentController,
            onTap: () {
             // getDegree();
            },
            readOnly: true,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff343D3C)),
            decoration: InputDecoration(
                hintText: 'Upload Degree',
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: Image.asset('assets/images/Group 175908.png'),
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
          const SizedBox(
            height: 13,
          ),
        ],
      ),
    );
  }

  }
