import 'package:flutter/material.dart';
import 'package:flutter_list_view/UniversityDetails.dart';
import 'package:flutter_list_view/home.dart';
import 'package:flutter_list_view/screens/applications/applications.dart';
import 'package:flutter_list_view/screens/myProfile/myProfile.dart';

class BottomNevigaterHome extends StatefulWidget {
  const BottomNevigaterHome({super.key});

  @override
  State<BottomNevigaterHome> createState() => _NevigaterState();
}

class _NevigaterState extends State<BottomNevigaterHome> {
  int currentIndexs = 0;
  final List<Widget> pages = [
   const HomeScreen(),
    const Applications(),
    //SearchUniversityScreen(),
   const  Universitydetails(),
   const Myprofile(),
  ];

  void onItemTapped(int index) {
    if (currentIndexs != index) {
      setState(() {
        currentIndexs = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0; //for not visibale the floaing action button (search button) when keybord open
    return Scaffold(
      body: pages[currentIndexs],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !isKeyboardVisible,
        child: Container(
          height: 55,
          width: 55,
          child: FloatingActionButton(
            onPressed: () => (),
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 3, color: Colors.white),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.search_outlined,
              color: Colors.green,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33005642),
              offset: Offset(0, 0),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent, // Disable ripple effect
              highlightColor: Colors.transparent, // Disable highlight effect
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/home.png',
                    height: 20,
                    width: 18,
                    color: currentIndexs == 0 ? Colors.green : Colors.grey,
                  ),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/forms.png',
                    color: currentIndexs == 1 ? Colors.green : Colors.grey,
                  ),
                  label: 'Forms',
                ),
                const BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 20,
                  ),
                  label: "Search",
                  backgroundColor: Colors.green,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/message_1_fill.png',
                    color: currentIndexs == 3 ? Colors.green : Colors.grey,
                  ),
                  label: 'MESSAGE',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/account.png',
                    color: currentIndexs == 4 ? Colors.green : Colors.grey,
                  ),
                  label: 'Account',
                ),
              ],
              currentIndex: currentIndexs,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              onTap: onItemTapped,
              showUnselectedLabels: true,
            ),
          ),
        ),
      ),
    );
  }
}
