import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/applicant_form_model.dart';
import 'package:flutter_list_view/provider/application_form_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profileimage extends StatefulWidget {
  const Profileimage({super.key});

  @override
  State<Profileimage> createState() => _ProfileimageState();
}

class _ProfileimageState extends State<Profileimage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
 String? profileImageUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//  final applicationData = Provider.of<ApplicationFormProvider>(context, listen: false).applicationFormData;
//     final profileImageDoc = applicationData!.uploadedDocs?.firstWhere(
//       (doc) => doc.docType == "PROFILE_IMAGE",
//       orElse: () => null,
//     );
//     profileImageUrl = profileImageDoc?.docUrl; 
    }
  @override
  
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Stack(
        children: [
          Container(
            // height: screenHeight*0.167,
            //width: screenWidth*0.362,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Color(0xffE8CD1A))),
            child: CircleAvatar(
                radius: screenWidth * 0.165,
                // backgroundImage: Image.file(_image!),
                //backgroundImage: AssetImage('assets/images/universityimage.png'),
                backgroundImage: _image != null
                    ? FileImage(File(_image!.path))
                    :const  AssetImage('assets/images/universityimage.png')),
          ),
          Positioned(
            top: screenWidth * 0.255,
            left: screenWidth * 0.245,
            child: InkWell(
              onTap: () async{
                await getImage();
                Provider.of<ApplicationFormProvider>(context,listen: false).uploadProfile(context, _image);
              },
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/Group 164829.png')),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.6, color: Color(0xff54962E))),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
}
