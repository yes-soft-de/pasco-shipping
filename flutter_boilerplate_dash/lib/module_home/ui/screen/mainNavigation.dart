// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pasco_shipping/module_home/ui/screen/home_screen.dart';
// import 'package:pasco_shipping/module_notifications/ui/notification_screen.dart';
// import 'package:pasco_shipping/module_profile/service/price_service.dart';
// import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
//
// @injectable
// class MainNavigationScreen extends StatefulWidget {
//   final ProfileService _profileService;
//
//   MainNavigationScreen(this._profileService);
//
//   @override
//   _MainNavigationScreenState createState() => _MainNavigationScreenState();
// }
//
// class _MainNavigationScreenState extends State<MainNavigationScreen> {
//   late int currentIndex;
//   late List<Widget> _pages;
//  late PageController _pageController;
//   DateTime currentBackPressTime = DateTime.now();
//
//   @override
//   void initState() {
//     super.initState();
//     currentIndex = 0;
//     _pages = [
//       HomeScreen(widget._profileService),
//       NotificationScreen()
//     ];
//
//     _pageController = PageController(initialPage: 0);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//
//   void _selectPage(int selectedPageIndex) {
//     setState(() {
//       currentIndex = selectedPageIndex;
//       _pageController.jumpToPage(selectedPageIndex);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: SafeArea(
//         child: PageView(
//           controller: _pageController,
//           physics: NeverScrollableScrollPhysics(),
//           children: _pages,
//         ),
//       ),
//       bottomNavigationBar: FloatingNavbar(
//         selectedBackgroundColor: AppThemeDataService.AccentColor,
//         onTap: (int val) {
//         _selectPage(currentIndex);
//         },
//         currentIndex: currentIndex,
//
//         items: [
//           FloatingNavbarItem(icon: Icons.home, title: 'Home'),
//           FloatingNavbarItem(icon: Icons.notifications_active_outlined, title: 'Notification'),
//           // FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
//           // FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
//         ],
//       ),
//     );
//   }
//
// }
