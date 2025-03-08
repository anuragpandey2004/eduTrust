import 'package:flutter/material.dart';
import 'package:flutter_list_view/provider/specific_applied_uni_provider.dart';
import 'package:flutter_list_view/screens/universityDeatilsSecond/component/universityDeatialsSecondBottombar.dart';
import 'package:flutter_list_view/screens/universityDeatilsSecond/component/universityDetailsSecondCard.dart';
import 'package:provider/provider.dart';

class Universitydeatilssecond extends StatefulWidget {
  
  const Universitydeatilssecond({super.key});

  @override
  State<Universitydeatilssecond> createState() => 
      _UniversitycomentssecondState();
}
class _UniversitycomentssecondState extends State<Universitydeatilssecond> {
  @override
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SpecificAppliedUniProvider>(context,listen: false).fetchSpecificUni();
  }
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      // appBar: AppBar(
      //   surfaceTintColor: Colors.transparent,
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //       onPressed: () => (),
      //       icon: Icon(
      //         Icons.arrow_back_outlined,
      //         color: Colors.white,
      //       )),

      // ),
      //extendBodyBehindAppBar: true,
      body:Provider.of<SpecificAppliedUniProvider>(context,listen: true). isLoading ==true
          ? Center(
              child: CircularProgressIndicator(), // Loader displayed while data is loading
            )
      :SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.45,
              width: screenWidth,
             //  constraints: BoxConstraints.expand(width: screenWidth),
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage(
                  //       'assets/images/universitySearc.png',
                  //     ),
                  //     fit: BoxFit.cover)
                  ),
              child: Image.network(
                Provider.of<SpecificAppliedUniProvider>(context,listen: false).specificAppliedUniversity!.universityLogo.toString(),
                fit: BoxFit.fill,
                width: screenWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.04,        
                    ),
                    IconButton(
                        onPressed: () {Navigator.pop(context);},
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.3,
                ),
                Universitydetailssecondcard(),
                Universitydeatialssecondbottombar()
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: Universitydeatialssecondbottombar(),
    );
  }
}
