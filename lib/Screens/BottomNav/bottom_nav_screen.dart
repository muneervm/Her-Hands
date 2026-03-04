import 'package:flutter/material.dart';
import 'package:service_application/Screens/CartScreen/cart_screen.dart';
import 'package:service_application/Screens/Homescreen/home_screen.dart';
import 'package:service_application/Screens/MessageScreen/message_screen.dart';
import 'package:service_application/Screens/ProfileScreen/profile.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = const [
      HomeScreen(),
      MessageScreen(),
      CartScreen(),
      ProfileScreen()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(
      int index, String label, String assetPath) {
    final bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: '',
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFC107) : Colors.transparent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
        child: ImageIcon(
          AssetImage(assetPath),
          size: 28,
          color: isSelected
              ? Color.fromARGB(255, 4, 36, 90)
              : Color.fromARGB(255, 4, 36, 90),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: _onItemTapped,
              items: [
                _buildNavItem(0, 'Home', 'assets/Icons/home.png'),
                _buildNavItem(1, 'Category', 'assets/Icons/message.png'),
                _buildNavItem(2, 'Cart', 'assets/Icons/cart.png'),
                _buildNavItem(3, 'Profile', 'assets/Icons/user.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
