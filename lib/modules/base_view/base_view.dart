import 'package:bkmc/modules/home/pages/home_screen.dart';
import 'package:flutter/material.dart';

import '../profile/profile_screen.dart';

class BaseView extends StatefulWidget {
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    AddRoomPage(),
    ProfileScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.add_box_outlined,
    Icons.person_outline,
  ];

  final List<String> _labels = ['Home', 'Add Room', 'Profile'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-1.1, 0.0),
          radius: 2.1,
          colors: [
            Color(0xFFC637E5),
            Color(0xFF161616),
            Color(0xFF161616),
          ],
          stops: [0.0, 0.75, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8), // semi-transparent black
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.purpleAccent, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_icons.length, (index) {
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _icons[index],
                      color: Colors.white,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _labels[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: _selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class AddRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(child: Text("➕ Add Room Page"));
}

