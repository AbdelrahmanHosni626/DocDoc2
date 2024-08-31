import 'package:docdoc2/features/Appointment/ui/appointment_screen.dart';
import 'package:docdoc2/features/Chat/ui/chat_screen.dart';
import 'package:docdoc2/features/profile/ui/profile_screen.dart';
import 'package:docdoc2/features/search/ui/search_screen.dart';
import 'package:docdoc2/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../home/ui/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const SearchScreen(),
    const AppointmentScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        SolarIconsOutline.home2,
      ),
      label: 'Home',
      activeIcon: Icon(
        SolarIconsBold.home2,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        SolarIconsOutline.chatLine,
      ),
      label: 'Messages',
      activeIcon: Icon(SolarIconsBold.chatLine),
    ),
    const BottomNavigationBarItem(
      icon: Icon(null),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        SolarIconsOutline.calendar,
      ),
      label: 'Calender',
      activeIcon: Icon(SolarIconsBold.calendar),
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 20.r,
        child: ClipOval(
          child: SvgPicture.asset(
            Assets.svgDocDocLogo,
            fit: BoxFit.cover,
            height: 28.h,
          ),
        ),
      ),
      label: 'Profile',
      activeIcon: CircleAvatar(
        radius: 20.r,
        child: ClipOval(
          child: SvgPicture.asset(
            Assets.svgDocDocLogo,
            fit: BoxFit.cover,
            height: 28.h,
          ),
        ),
      ),
    ),
  ];

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    if (index != 2) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 10.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          iconSize: 24.sp,
          type: BottomNavigationBarType.values[0],
          currentIndex: currentIndex,
          onTap: (index) {
            changeBottomNavBar(index);
          },
          items: List<BottomNavigationBarItem>.generate(
            5,
            (index) => bottomNavBarItems[index],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: () {
            setState(() {
              currentIndex = 2; // Index of the Search Screen
            });
          },
          child: const Icon(
            SolarIconsOutline.magnifier,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}

// bottomNavigationBar: BottomNavigationBar(
//   showSelectedLabels: false,
//   showUnselectedLabels: false,
//   iconSize: 24.sp,
//   type: BottomNavigationBarType.fixed,
//   currentIndex: currentIndex,
//   onTap: (index) {
//     changeBottomNavBar(index);
//   },
//   items: [
//     const BottomNavigationBarItem(
//       icon: Icon(
//         SolarIconsOutline.home2,
//       ),
//       label: 'Home',
//       activeIcon: Icon(
//         SolarIconsBold.home2,
//       ),
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(
//         SolarIconsOutline.chatLine,
//       ),
//       label: 'Messages',
//       activeIcon: Icon(SolarIconsBold.chatLine),
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(
//         SolarIconsOutline.magnifier,
//       ),
//       label: 'Search',
//       activeIcon: Icon(SolarIconsBold.magnifier),
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(
//         SolarIconsOutline.calendar,
//       ),
//       label: 'Calender',
//       activeIcon: Icon(SolarIconsBold.calendar),
//     ),
//     BottomNavigationBarItem(
//       icon: CircleAvatar(
//         radius: 20.r,
//         child: ClipOval(
//           child: SvgPicture.asset(
//             Assets.svgDocDocLogo,
//             fit: BoxFit.cover,
//             height: 28.h,
//           ),
//         ),
//       ),
//       label: 'Profile',
//       activeIcon: const Icon(SolarIconsBold.mentionCircle),
//     ),
//   ],
// ),
