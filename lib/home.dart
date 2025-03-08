import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_view/UniversityDetails.dart';
import 'package:flutter_list_view/model/all_location_model';
import 'package:flutter_list_view/model/country_group_model.dart';
import 'package:flutter_list_view/provider/dashbord_provider.dart';
import 'package:flutter_list_view/provider/home_screen_provider.dart';
import 'package:flutter_list_view/provider/university_details_provider.dart';
import 'package:flutter_list_view/screens/myProfile/myProfile.dart';
import 'package:flutter_list_view/screens/notification/notifaction.dart';
//import 'package:flutter_list_view/flash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bool isGridView = false;
  bool isTopCityLoder = true;
  // List<GroupedByCountry> dropDownList = [];
  // GroupedByCountry? selectedItem;
  List<GroupedByCountry> dropDownList = [];
  List<GetAllLocation> topcityList = [];
  String selectedItemForDropDown = 'Select Country';
  // List cityImagesList = [
  //   'assets/images/Sydney.png',
  //   "assets/images/Brisbane.png",
  //   'assets/images/Perth.png'
  // ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // resetData();
    // dataStoreInDropDown();
    // fetchdata();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeScreenProvider>(context, listen: false);
      provider.fatchData();
      dataStoreInTopCityList();
    });
  }

  void resetData() {
    Provider.of<HomeScreenProvider>(context, listen: false).reset();
  }

  Future<void> dataStoreInTopCityList() async {
    setState(() {
      isTopCityLoder = true;
    });
    await Provider.of<DashbordProvider>(context, listen: false).getLocations();

    setState(() {
      topcityList =
          Provider.of<DashbordProvider>(context, listen: false).allLocation;
      isTopCityLoder = false;
    });
  }

  // Future dataStoreInDropDown() async {
  //   final provider =
  //       await Provider.of<DashbordProvider>(context, listen: false);
  //   dropDownList = provider.universityCountryGroup.groupedByCountry!.toList();
  //

  Future fetchdata() async {
    Provider.of<HomeScreenProvider>(context, listen: false).fatchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              resetData();
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/Group_logo.png",
            ),
          ),
          backgroundColor: const Color(0xFF54962E),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifaction()));
                },
                child: Image.asset('assets/images/bell.png')),
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Myprofile()));
                  },
                  child: Image.asset('assets/images/person_icon.png')),
            ),
          ],
          centerTitle: true,
          title: Text(
            "EduTrust",
            style: GoogleFonts.nunitoSans(
                color: const Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 65,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE9FFDC),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Text(selectedItemForDropDown,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Expanded(
                              child: Consumer2<DashbordProvider,
                                  HomeScreenProvider>(
                                builder: (context, dashbordProvider,
                                    homeScreenProvider, child) {
                                  dropDownList = dashbordProvider
                                      .universityCountryGroup.groupedByCountry!
                                      .toList();

                                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                                  //   dropDownList = dashbordProvider
                                  //       .universityCountryGroup.groupedByCountry!
                                  //       .toSet()
                                  //       .toList();
                                  // });

                                  // if (dashbordProvider.selectedItemForDropDown ==
                                  //         null &&
                                  //     dropDownList.isNotEmpty) {
                                  //   dashbordProvider
                                  //       .getSelectedItem(dropDownList.first);
                                  // }
                                  //dataStoreInDropDown();
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton<GroupedByCountry>(
                                      isExpanded: true,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      // value: Provider.of<DashbordProvider>(context)
                                      //.selectedItemForDropDown,
                                      items: dropDownList
                                          .map((GroupedByCountry value) {
                                        return DropdownMenuItem<
                                                GroupedByCountry>(
                                            value: value,
                                            child: Text(
                                              value.country.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ));
                                      }).toList(),
                                      onChanged: (GroupedByCountry? newValue) {
                                        selectedItemForDropDown =
                                            newValue!.country.toString();
                                        homeScreenProvider.getTopCity(false);
                                        homeScreenProvider.fatchData();
                                        setState(() {
                                          dashbordProvider
                                              .getSelectedItem(newValue);
                                          homeScreenProvider.getCountryName(
                                              newValue.country.toString());
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ))),

                //text container
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 18, right: 18),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<HomeScreenProvider>(
                              builder: (context, provider, child) {
                                //provider.fatchData();
                                String? length =
                                    provider.universityList.length.toString();
                                return Text(
                                  'Found $length Result',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.black),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Scroll down for more",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Consumer<HomeScreenProvider>(
                              builder: (context, provider, child) {
                                return Container(
                                  width: 92,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF5F4F8),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          width: 2,
                                          color: const Color(0xff7bE498))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 38,
                                        decoration: BoxDecoration(
                                            color: provider.isGridView
                                                ? Colors.white
                                                : const Color(0xffF5F4F8),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: IconButton(
                                          iconSize: 15,
                                          onPressed: () {
                                            // setState(() {
                                            //   isGridView = true;
                                            // });
                                            provider.getisGridView(true);
                                          },
                                          icon: const Icon(
                                              Icons.grid_view_rounded),
                                          color: provider.isGridView
                                              ? const Color(0xff205075)
                                              : const Color(0xffA1A5C1),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 38,
                                        decoration: BoxDecoration(
                                            color: provider.isGridView
                                                ? const Color(0xffF5F4F8)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: IconButton(
                                          iconSize: 15,
                                          onPressed: () {
                                            // setState(() {
                                            //   isGridView = false;
                                            // });
                                            provider.getisGridView(false);
                                          },
                                          icon: const Icon(
                                              Icons.view_day_rounded),
                                          color: provider.isGridView
                                              ? const Color(0xffA1A5C1)
                                              : const Color(0xff205075),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 170,
                    width: double.infinity,
                    color: const Color(0xff54962E),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top locations',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFFF8F8F8),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                              TextButton(
                                onPressed: () => (),
                                //buttonRow
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Explore',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Consumer<HomeScreenProvider>(
                          builder: (context, provider, child) {
                            return isTopCityLoder == true
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    color: Colors.black,
                                  ))
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                          topcityList.length,
                                          (index) => Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  left: 20,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    provider.getCityID(
                                                        topcityList[index]
                                                            .locationId
                                                            .toString());
                                                    provider.getTopCity(true);
                                                    provider.fatchData();
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    // height: 60,
                                                    // width: 130,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        NetworkImage(
                                                                      topcityList[
                                                                              index]
                                                                          .flagImageUrl
                                                                          .toString(),
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                          // child: Image.network(
                                                          //   topcityList[index].flagImageUrl.toString(),
                                                          //   height: 40,
                                                          //   width: 40,

                                                          // ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5),
                                                          child: Text(
                                                            topcityList[index]
                                                                .city
                                                                .toString(),
                                                            style: GoogleFonts.poppins(
                                                                color: const Color(
                                                                    0xff54962E),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                    ),
                                  );
                          },
                        )
                        // CityRow
                      ],
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: CardGanarater(),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 36, left: 10, right: 10, bottom: 33),
                  child: UniversityGroupCard(),
                ),
              ],
            ),
          ),
        ));
  }
}

class HeroCard extends StatefulWidget {
  final String nameOfUniversity;
  final String descriptionOfUniversity;
  final String locationOfUniversity;
  final String applicationDeadline;
  final String imageUrl;
  final String rating;
  final String likeCount;
  final String commentCount;
  final String universityId;
  // final String ? applicationDeadl;

  const HeroCard(
      {super.key,
      required this.nameOfUniversity,
      required this.descriptionOfUniversity,
      required this.locationOfUniversity,
      required this.applicationDeadline,
      required this.imageUrl,
      required this.rating,
      required this.likeCount,
      required this.commentCount,
      required this.universityId
      //this.applicationDeadl
      });

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  // String nameOfUniversity = "University Of Southern Australia";
  // String descriptionOfUniversity =
  //     "Lorem Ipsum is simply dummy text of the printing and typesetting industr";
  // String locationOfUniversity = "Panchsheel Park, Southern Australia";
  // String applicationDeadline = "Aug 30 ";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return InkWell(
      onTap: () {
        Provider.of<UniversityDetailsProvider>(context, listen: false)
            .getuniversityId(widget.universityId.toString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Universitydetails()));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        // padding: EdgeInsets.symmetric(horizontal: 20),
        //height: 380,
        //width: 335,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x26005642),
                  offset: Offset(0, 0),
                  blurRadius: 20)
            ]),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 7, right: 7),
              child: Container(
                height: screenHeight * 0.246,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //       widget.imageUrl,
                  //     ),
                  //     fit: BoxFit.fill)
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.scaleDown,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                    color: Colors.white,
                  )),
                ),
              ),
            ),
            // ImageSlider(),
            //star likres comment row
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Row(
                      //row for star button
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(widget.rating,
                            style: const TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Icon(Icons.heart_broken, color: Colors.grey,size: 20,),
                            const Image(
                              image: AssetImage('assets/images/like.png'),
                              color: Colors.grey,
                            ),
                            Text(
                              " ${widget.likeCount} likes",
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.comment,
                              color: Colors.grey,
                              size: 15,
                            ),
                            Text(" ${widget.commentCount} comment",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 23, right: 20),
              child: Text(
                widget.nameOfUniversity,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 23, right: 20),
              child: Text(
                widget.descriptionOfUniversity,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF939EAA)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 25),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFF939EAA),
                  ),
                  Text(
                    widget.locationOfUniversity,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF939EAA)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, left: 23, bottom: 18),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Color(0xFF939EAA),
                  ),
                  Text(
                    ' Application Deadline is ${widget.applicationDeadline}',
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF939EAA)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List imageSliderList = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            items: imageSliderList.map((url) {
              return SizedBox(
                //height: 200,
                width: double.infinity,
                // width: 400,
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            )),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliderList.asMap().entries.map((entry) {
                return GestureDetector(
                    onTap: () => setState(() {
                          currentIndex == entry.key;
                        }),
                    child: currentIndex == entry.key
                        ? Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: currentIndex == entry.key
                                    ? Border.all(
                                        color: Colors.white, width: 2.0)
                                    : null),
                            child: currentIndex == entry.key
                                ? Center(
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                    ),
                                  )
                                : null,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ));
              }).toList()),
        ),
        Positioned(
            right: 10,
            top: 5,
            child: Container(
                height: 26,
                width: 26,
                decoration: const BoxDecoration(
                    color: Colors.white54, shape: BoxShape.circle),
                child: Center(
                  child: IconButton(
                      onPressed: () => (),
                      icon: const Icon(
                        size: 11,
                        Icons.share_rounded,
                        color: Colors.white,
                        weight: 10,
                      )),
                )))
      ],
    );
  }
}

class CardGanarater extends StatefulWidget {
  const CardGanarater({super.key});

  @override
  State<CardGanarater> createState() => _CardGanaraterState();
}

class _CardGanaraterState extends State<CardGanarater> {
  late int initialNumberOfCards;

  int numberOfCardShowing = 2;

  // bool isLoding = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeScreenProvider>(context, listen: false);
      provider.fatchData();
    });
  }

// void didPopNext() {
//   super.didPopNext();
//   // Call the function that will fetch or update data when coming back from dashboard
//   Provider.of<HomeScreenProvider>(context, listen: false).fetchData();
// }
  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    super.dispose();
  }
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   // Ensuring data is reloaded each time you return to the Home Screen from Search Screen
  //   if (ModalRoute.of(context)?.isCurrent ?? false) {
  //     // Trigger data reload only when the screen is active (current route)
  //   final provider = Provider.of<HomeScreenProvider>(context, listen: false);
  //   provider.fatchData();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, provider, child) {
      if (provider.isLoading == true) {
        return const Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.green,
          color: Colors.white,
        ));
      }

      return Column(children: [
        ...List.generate(
            provider.universityList.length,
            (index) => provider.isGridView
                ? NewGrid(
                    applicationDeadline: provider
                        .universityList[index].applicationDeadline
                        .toString(),
                    commentCount: provider
                        .universityList[index].reviewCommentsCount
                        .toString(),
                    descriptionOfUniversity:
                        provider.universityList[index].description.toString(),
                    imageUrl: provider.universityList[index].logoUrl.toString(),
                    likeCount: provider.universityList[index].likeDislikeCount
                        .toString(),
                    locationOfUniversity: '',
                    rating: provider.universityList[index].rating.toString(),
                    nameOfUniversity: provider
                        .universityList[index].universityName
                        .toString(),
                    universityId:
                        provider.universityList[index].universityId.toString())
                : HeroCard(
                    universityId:
                        provider.universityList[index].universityId.toString(),
                    imageUrl: provider.universityList[index].logoUrl.toString(),
                    nameOfUniversity: provider
                        .universityList[index].universityName
                        .toString(),
                    descriptionOfUniversity:
                        provider.universityList[index].description.toString(),
                    locationOfUniversity: "",
                    applicationDeadline: provider
                        .universityList[index].applicationDeadline
                        .toString(),
                    commentCount: provider
                        .universityList[index].reviewCommentsCount
                        .toString(),
                    likeCount: provider.universityList[index].likeDislikeCount
                        .toString(),
                    rating: '',
                  )),
      ]);
    });
  }
}

class UniversityGroupCard extends StatefulWidget {
  const UniversityGroupCard({super.key});

  @override
  State<UniversityGroupCard> createState() => _UniversityGroupCardState();
}

class _UniversityGroupCardState extends State<UniversityGroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 23,left: 10,right: 10),
      // height: 255,
      // width: 335,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x26005642),
              blurRadius: 20.0,
              spreadRadius: 0.0,
              offset: Offset(0, 0),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular University \n Group',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(
                        0xff212121,
                      )),
                ),
                Row(
                  children: [
                    Text(
                      'View all',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffE8CD1A)),
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: Color(0xffE8CD1A),
                    )
                  ],
                )
              ],
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                LastCard(
                    imageUrl: 'assets/images/avatar5.png',
                    groupName: 'Lorem Ipsum is simply dummy text ',
                    year: "2024",
                    location: 'sydney',
                    members: '22222'),
                LastCard(
                    imageUrl: 'assets/images/avatar5.png',
                    groupName: 'Lorem Ipsum is simply dummy text ',
                    year: "2024",
                    location: 'sydney',
                    members: '22222'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LastCard extends StatelessWidget {
  final String imageUrl;
  final String groupName;
  final String year;
  final String location;
  final String members;
  const LastCard(
      {required this.imageUrl,
      required this.groupName,
      required this.year,
      required this.location,
      required this.members,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, bottom: 25),
      child: Container(
        width: screenWidth * 0.75,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE3EBF2), width: 1),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1A205072),
                  blurRadius: 6.0,
                  offset: Offset(0, 0))
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 12, right: 14.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imageUrl),
                      radius: 32,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            groupName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                year,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA),
                                ),
                              ),
                              const Text(
                                ' | ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffC3D5E6)),
                              ),
                              Text(
                                location,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939EAA),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85),
                child: Text('$members members',
                    style: GoogleFonts.poppins(
                        color: const Color(0xffE8CD1A),
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 18),
                  child: SizedBox(
                    height: 30,
                    width: 122,
                    child: ElevatedButton(
                      onPressed: () => (),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          side: const BorderSide(
                              color: Color(0x336A7380), width: 1)),
                      child: Text(
                        'Join Now',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff939EAA),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridviewCard extends StatefulWidget {
  const GridviewCard({super.key});

  @override
  State<GridviewCard> createState() => _GridviewCardState();
}

class _GridviewCardState extends State<GridviewCard> {
  final ScrollController _scrollController =
      ScrollController(); //for scrolled  grid view
  final List listOfCards = [
    {
      'name': "University Of Southern Australia",
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industr',
      'location': 'Panchsheel Park, Southern Australia',
      'Deadline': "Aug 30 "
    },
    {
      'name': "University Of Southern Australia",
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industr',
      'location': 'Panchsheel Park, Southern Australia',
      'Deadline': "Aug 31 "
    },
    {
      'name': "University Of Southern Australia",
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industr',
      'location': 'Panchsheel Park, Southern Australia',
      'Deadline': "Aug 32 "
    },
    {
      'name': "University Of Southern Australia",
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industr',
      'location': 'Panchsheel Park, Southern Australia',
      'Deadline': "Aug 33 "
    },
    {
      'name': "University Of Southern Australia",
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industr',
      'location': 'Panchsheel Park, Southern Australia',
      'Deadline': "Aug 34 "
    },
  ];
  late int initialNumberOfCards;
  int numberOfCardShowing = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          controller: _scrollController, //for scrolled  grid view
          shrinkWrap: true, // Only take the space needed by items

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 0.5,
          ),
          itemCount: numberOfCardShowing,
          itemBuilder: (context, index) {
            return GridviewHeroCard(
              nameOfUniversity: listOfCards[index]["name"]!,
              descriptionOfUniversity: listOfCards[index]['description']!,
              locationOfUniversity: listOfCards[index]["location"]!,
              applicationDeadline: listOfCards[index]['Deadline']!,
            );
          },
        ),
        if (numberOfCardShowing < listOfCards.length)
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: (TextButton(
              onPressed: () => {
                setState(() {
                  numberOfCardShowing = listOfCards.length;
                })
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2a2a2a)),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Color(0xff2a2a2a),
                  )
                ],
              ),
            )),
          ),
        if (numberOfCardShowing == listOfCards.length)
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: (TextButton(
              onPressed: () => {
                setState(() {
                  numberOfCardShowing = 2;
                })
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View less',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2a2a2a)),
                  ),
                  const Icon(
                    Icons.arrow_drop_up_outlined,
                    color: Color(0xff2a2a2a),
                  )
                ],
              ),
            )),
          ),
      ],
    );
  }
}

class GridviewHeroCard extends StatefulWidget {
  final String nameOfUniversity;
  final String descriptionOfUniversity;
  final String locationOfUniversity;
  final String applicationDeadline;

  const GridviewHeroCard({
    super.key,
    required this.nameOfUniversity,
    required this.descriptionOfUniversity,
    required this.locationOfUniversity,
    required this.applicationDeadline,
  });

  @override
  State<GridviewHeroCard> createState() => _GridviewHeroCardState();
}

class _GridviewHeroCardState extends State<GridviewHeroCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Color(0x26005642), offset: Offset(0, 0), blurRadius: 20)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 7, right: 7),
            child: ImageSlider(),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    "4.0",
                    style: TextStyle(color: Colors.yellow),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.comment_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    "comments",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6, right: 8),
            child: Text(
              widget.nameOfUniversity,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            child: Text(widget.descriptionOfUniversity,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      widget.locationOfUniversity,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6, bottom: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      'Application deadline:${widget.applicationDeadline}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Home2Card extends StatelessWidget {
  final String nameOfUniversity;
  final String logoOfUniversity;
  final String descriptionOfUniversity;
  final String locationOfUniversity;
  final String deadline;
  const Home2Card(
      {required this.nameOfUniversity,
      required this.deadline,
      required this.descriptionOfUniversity,
      required this.locationOfUniversity,
      required this.logoOfUniversity,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x26005642),
                  offset: Offset(0, 0),
                  blurRadius: 20)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Stack(children: [
                Image.asset(
                  logoOfUniversity,
                ),
                Positioned(
                    right: 10,
                    top: 5,
                    child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[200],
                            shape: BoxShape.circle),
                        child: Center(
                          child: IconButton(
                              onPressed: () => (),
                              icon: const Icon(
                                size: 11,
                                Icons.share_rounded,
                                color: Colors.white,
                                weight: 10,
                              )),
                        )))
              ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 10, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          //row for star button
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Text("4.0",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage('assets/images/like.png'),
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      " 34 likes",
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.comment,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                  Text(" 2 comments",
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      nameOfUniversity,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff222222)),
                    ),
                    Text(
                      descriptionOfUniversity,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF939EAA)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFF939EAA),
                            size: 15,
                          ),
                          Text(
                            locationOfUniversity,
                            style: GoogleFonts.poppins(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF939EAA)),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 13,
                          color: Color(0xFF939EAA),
                        ),
                        Text(
                          ' Application Deadline is $deadline',
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF939EAA)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Home2cardGanarater extends StatefulWidget {
  const Home2cardGanarater({super.key});

  @override
  State<Home2cardGanarater> createState() => _Home2cardGanaraterState();
}

class _Home2cardGanaraterState extends State<Home2cardGanarater> {
  int numberOfCardShowing = 2;
  int numberOfCard = 8;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            numberOfCardShowing,
            (index) => const Home2Card(
                nameOfUniversity: 'University Of Southern Australia',
                deadline: 'Aug 30',
                descriptionOfUniversity:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting',
                locationOfUniversity: 'Panchsheel Park, Southern Australia',
                logoOfUniversity: 'assets/images/image1.png')),
        if (numberOfCardShowing < numberOfCard)
          TextButton(
              onPressed: () {
                setState(() {
                  numberOfCardShowing = numberOfCard;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2A2A2A)),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Color(0xff2A2A2A),
                  )
                ],
              )),
        if (numberOfCardShowing == numberOfCard)
          TextButton(
              onPressed: () {
                setState(() {
                  numberOfCardShowing = 2;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View Less',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF2A2A2A)),
                  ),
                  const Icon(
                    Icons.arrow_drop_up_outlined,
                    color: Color(0XFF2A2A2A),
                  )
                ],
              ))
      ],
    );
  }
}

class NewGrid extends StatefulWidget {
  final String nameOfUniversity;
  final String descriptionOfUniversity;
  final String locationOfUniversity;
  final String applicationDeadline;
  final String imageUrl;
  final String rating;
  final String likeCount;
  final String commentCount;
  final String universityId;
  const NewGrid(
      {required this.applicationDeadline,
      required this.commentCount,
      required this.descriptionOfUniversity,
      required this.imageUrl,
      required this.likeCount,
      required this.locationOfUniversity,
      required this.rating,
      required this.nameOfUniversity,
      required this.universityId,
      super.key});

  @override
  State<NewGrid> createState() => _NewGridState();
}

class _NewGridState extends State<NewGrid> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return InkWell(
      onTap: () {
        Provider.of<UniversityDetailsProvider>(context, listen: false)
            .getuniversityId(widget.universityId.toString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Universitydetails()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x26005642),
                  offset: Offset(0, 0),
                  blurRadius: 20)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.1477,
                width: screenWidth * 0.341,
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.scaleDown,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                    color: Colors.white,
                  )),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 1,
                                color: Colors.yellow,
                              ),
                              Text(
                                widget.rating,
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0XFF939EAA)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Path59593.png',
                                color: Colors.grey,
                                height: 13,
                                width: 13,
                              ),
                              Text(
                                '${widget.likeCount}Likes',
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff939EAA)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Path59594.png',
                                height: 13,
                                width: 13,
                              ),
                              Text(
                                '${widget.commentCount}Comments',
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff939EAA)),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        widget.nameOfUniversity,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff222222)),
                      ),
                      const SizedBox(
                        height: .2,
                      ),
                      Text(
                        widget.descriptionOfUniversity,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 9,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff939EAA)),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xff939EAA),
                            size: 15,
                          ),
                          Text(
                            widget.locationOfUniversity,
                            style: GoogleFonts.poppins(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff939EAA)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Color(0xff939EAA),
                            size: 13,
                          ),
                          Text(
                            'Application deadline: ${widget.applicationDeadline}',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff939EAA)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
