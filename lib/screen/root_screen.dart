import 'package:flutter/material.dart';
import 'package:justduit/screen/home_screen.dart';
import 'package:justduit/screen/transaction_screen.dart';
import 'package:justduit/screen/profile_screen.dart';

class rootScreen extends StatefulWidget {
  const rootScreen({super.key});

  @override
  State<rootScreen> createState() => _rootScreenState();
}

class _rootScreenState extends State<rootScreen> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    TransactionScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.description_outlined), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_outlined), label: "QR Code"),
          BottomNavigationBarItem(icon: Icon(Icons.redeem_outlined), label: "Redeem"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Profile"),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}