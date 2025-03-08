import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_list_view/UniversityDetails.dart';
import 'package:flutter_list_view/botom_navigatorbar.dart';
import 'package:flutter_list_view/model/country_group_model.dart';
import 'package:flutter_list_view/model/university_name_search.dart';
import 'package:flutter_list_view/otp1.dart';
import 'package:flutter_list_view/provider/dashbord_provider.dart';
import 'package:flutter_list_view/provider/home_screen_provider.dart';
import 'package:flutter_list_view/provider/university_details_provider.dart';
import 'package:flutter_list_view/utils/shared_prefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchUniversityScreen extends StatefulWidget {
  const SearchUniversityScreen({super.key});

  @override
  State<SearchUniversityScreen> createState() => _SearchUniversityScreenState();
}

class _SearchUniversityScreenState extends State<SearchUniversityScreen> {
  List<UnivertyNameForSearch> UnivresityNameFoRSearch = [];
  bool isTopcity = false;
  TextEditingController searchController = TextEditingController();
 String? phoneNumber; 
  @override
  void initState() {
     // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
    resetData();
    
  });
    Provider.of<DashbordProvider>(context, listen: false)
        .getUnivresityNameFoRSearch();
    
    Provider.of<DashbordProvider>(context, listen: false).getCourses();
    
  }

   void resetData () {
    print("reset");
    Provider.of<HomeScreenProvider>(context,listen: false).reset();
    print('data');
  }
  Future setPhone()async{
     String? fetchedPhoneNumber = await SharedPrefs().getString('phone');
     setState(() {
    phoneNumber = fetchedPhoneNumber; 
    });
  
  }
  

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return MaterialApp(
      title: 'Your app name',
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                "assets/images/Group_logo.png",
              ),
            ),
            backgroundColor: const Color(0xFF54962E),
          //   actions: [
          //     // Image.asset('assets/images/person_icon.png'),
          //     // const SizedBox(
          //     //   width: 17,
          //    // )
          //    IconButton(
          //   icon: Icon(Icons.menu, color: Colors.yellow), // Custom icon color
          //   onPressed: () {
          //     Scaffold.of(context).openEndDrawer(); // Opens the end drawer
          //   }, 
          // )],
            centerTitle: true,
            title: Text(
              "EduTrust",
              style: GoogleFonts.nunitoSans(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ),
          endDrawer: Drawer(
        width: screenWidth * 0.7,
        backgroundColor: const Color(0xff65A30D),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 65,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0x33000000),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 29,
                          backgroundColor: Colors.white,
                        ),
                        // const SizedBox(width: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffFFFFFF)),
                              ),
                              Text(
                                '$phoneNumber',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFFFFFF)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0554,
              ),
              SizedBox(
                height: 50,
                //width: screenHeight*0.23,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/comment1.png'),
                        Text(
                          'User Profile',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff365314)),
                        )
                      ],
                    )),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () async{
                   SharedPreferences shairedPrif = await SharedPreferences.getInstance();
                   await shairedPrif.clear();

                    showDialog(
                        context: context,
                         barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('logout'),
                            content: const Text('Successfully logged out'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Otp1()),(route) => false,);
                                  },
                                  child: const Text('ok'))
                            ],
                          );
                        });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        color: Color(0xffD9F99D),
                      ),
                      Text(
                        'User Logout',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffD9F99D)),
                      ),
                      const Spacer(),
                      SizedBox(height: screenHeight * 0.131)
                    ],
                  ))
            ],
          ),
        ),
      ),
          body: 
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: screenHeight * 0.224,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      color: Color(0xffE9FFDC),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Search University",
                          style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          //height: 55,
                          //width: 335,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x17005642),
                                offset: Offset(0, 13),
                                blurRadius: 31,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  UnivresityNameFoRSearch = [];
                                } else {
                                  UnivresityNameFoRSearch =
                                      Provider.of<DashbordProvider>(context,
                                              listen: false)
                                          .allUniversittyForSearch
                                          .where((e) => e.universityName!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                          .toList();
                                }
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.028),
                                border: InputBorder.none,
                                hintText: ("Search university"),
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                                prefixIcon: IconButton(
                                    onPressed: () => (),
                                    icon: const Icon(Icons.search_rounded)),
                                suffix: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: Image.asset(
                                    'assets/images/mic.png',
                                    width: 14,
                                    height: 20,
                                  ),
                                )),
                          ),
                        ),
                      ),
                      //SizedBox(height:screenHeight*0.07266,)
                    ],
                  ),
                ),
                Column(
                  //  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.1921),
                    ...List.generate(
                      UnivresityNameFoRSearch.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: Container(
                                decoration:const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //Image.network(UnivresityNameFoRSearch[index].universityLogo.toString(),width: 10,height: 10,),
                                    InkWell(
                                      onTap: () {
                                        Provider.of<UniversityDetailsProvider>(
                                                context,
                                                listen: false)
                                            .getuniversityId(
                                                UnivresityNameFoRSearch[index]
                                                    .universityId
                                                    .toString());
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                   const  Universitydetails()));
                                      },
                                      child: Text(
                                        UnivresityNameFoRSearch[index]
                                            .universityName
                                            .toString(),
                                        maxLines: 2,
                                      ),
                                    ),
                                    //Spacer(),
                                    //Text(UnivresityNameFoRSearch[index].country.toString()),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                    Container(
                      //  height: screenHeight * 0.595,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 43
                                //screenHeight*0.053,
                                ),
                           const Padding(
                              padding:  EdgeInsets.symmetric(vertical: 16),
                              child: CountryCard(),
                            ),
                            Text(
                              'Top Courses',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff939EAA)),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const TopCourses(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'More',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff00A85A)),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xff00A85A),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class CountryCard extends StatefulWidget {
  const CountryCard({super.key});

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  List<GroupedByCountry> countryListWithImg = [];
  List<GroupedByCity> cityListWithImg = [];
  bool isTopcity = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DashbordProvider>(context, listen: false).getUniversityCountryGroup();
    storeLocationInfo();
    // print(cityListWithImg.length);
  }

  Future storeLocationInfo() async {
    final dashbordProvider =
        Provider.of<DashbordProvider>(context, listen: false);
    await dashbordProvider.getUniversityCountryGroup();
    setState(() {
      countryListWithImg =
          dashbordProvider.universityCountryGroup.groupedByCountry!.toList();
      cityListWithImg =
          dashbordProvider.universityCountryGroup.groupedByCity!.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    //  Size screenSize = MediaQuery.of(context).size;
    // double screenWidth = screenSize.width;
    // double screenHeight = screenSize.height;
    return Container(
        //height: 40,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        isTopcity = false;
                      });
                    },
                    child: Text('Top Countries')),
                SizedBox(
                    width: 112,
                    child: Divider(
                        thickness: 2,
                        color: isTopcity == false
                            ? Colors.black
                            : Colors.transparent))
              ],
            ),
            Column(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        isTopcity = true;
                      });
                    },
                    child: const Text('Top Cities')),
                SizedBox(
                    width: 112,
                    child: Divider(
                        thickness: 2,
                        color: isTopcity == true
                            ? Colors.black
                            : Colors.transparent))
              ],
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15),
          itemCount: countryListWithImg.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () { 
                 final provider =  Provider.of<HomeScreenProvider>(context, listen: false);
                provider.getTopCity(isTopcity);
                if (provider.topCity == true) {
                  provider
                      .getCityID(cityListWithImg[index].locationId.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNevigaterHome()));
                } else {
                  provider
                      .getCountryName(
                          countryListWithImg[index].country.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>const BottomNevigaterHome()));
                }
              },
              child: Container(
                // height: 200,
                // width: 200,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(width: 1, color: Color(0xffEEF2F6)),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                isTopcity == false
                                    ? countryListWithImg[index]
                                        .countryFlagUrl
                                        .toString()
                                    : cityListWithImg[index]
                                        .countryFlagUrl
                                        .toString(),
                                // countryListWithImg[index].flagImageUrl.toString(),
                              ),
                              fit: BoxFit.fill,
                            )),
                        
                      ),

                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          isTopcity == false
                              ? countryListWithImg[index].country.toString()
                              : cityListWithImg[index].city.toString(),
                          maxLines: 1,
                          //overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff222222)),
                        ),
                      ),
                      //const Spacer(),
                      Text(
                        isTopcity == false
                            ? countryListWithImg[index]
                                .universityCount
                                .toString()
                            : cityListWithImg[index].universityCount.toString(),
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}

class TopCourses extends StatefulWidget {
  const TopCourses({super.key});

  @override
  State<TopCourses> createState() => _TopCoursesState();
}

class _TopCoursesState extends State<TopCourses> {
  List<GroupedByCourse> topCoursesList = [];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Provider.of<DashbordProvider>(context, listen: false)
        .getUniversityCountryGroup();
         storeCoursesInfo();
  }

  Future<void> storeCoursesInfo() async {
    final coursesProvider =
        Provider.of<DashbordProvider>(context, listen: false);
    await coursesProvider.getUniversityCountryGroup();
    setState(() {
      topCoursesList =
          coursesProvider.universityCountryGroup.groupedByCourse!.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          topCoursesList.length,
          (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 1,
                  color: Color(0xffEEF2F6),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  child: InkWell(
                    onTap: () {
                      Provider.of<HomeScreenProvider>(context, listen: false)
                          .getTopCity(null);
                      Provider.of<HomeScreenProvider>(context, listen: false)
                          .getCourseId(
                              topCoursesList[index].courseId.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNevigaterHome()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff54962E)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          topCoursesList[index].courseName.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff222222)),
                        ),
                        const Spacer(),
                        Text(
                          topCoursesList[index].universityCount.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff939EAA)),
                        ),
                        Text(
                          ' University',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff939EAA)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
