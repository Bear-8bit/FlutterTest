import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onIndexChanged;
  const BottomNavBar({super.key, required this.onIndexChanged});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50,
      index: _currentIndex,
      color: Colors.black,
      buttonBackgroundColor: Colors.black,
      backgroundColor: Colors.white,
      
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
        widget.onIndexChanged(_currentIndex);
      },
      items: const [
        Icon(Iconsax.home, color:Colors.white),
        Icon(Iconsax.shop, color:Colors.white),
        Icon(Iconsax.heart, color:Colors.white),
        Icon(Iconsax.user, color:Colors.white),
      ],
    );
  }
}