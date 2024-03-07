import 'package:flutter/material.dart';
import 'package:test_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:test_app/pages/home_page.dart';
import 'package:test_app/pages/discover_page.dart';
import 'package:test_app/pages/add_videos_page.dart';
import 'package:test_app/pages/inbox_page.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    DiscoverPage(),
    AddVideoPage(),
    InboxPage()
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedPageIndex: _selectedPageIndex, onIconTap: _onIconTapped),
    );
  }
}
