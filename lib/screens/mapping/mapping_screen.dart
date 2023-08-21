import 'package:flutter/material.dart';

class MappingScreen extends StatelessWidget {
  const MappingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 55,
          width: 55,
          child: Image.asset('assets/splash.png'),
        ),
        leading: const Icon(
          Icons.menu,
          size: 35,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 15.0), // Jarak dari sisi kanan
            child: IconButton(
              icon: const Icon(
                Icons.person,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        width: 356,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF9BABB8),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF9BABB8),
            selectedItemColor: Color(0xFFD1E7FA),
            unselectedItemColor: Color(0xFF5F6469),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_outlined,
                  size: 35,
                ),
                label: 'Task List',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 35,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                  size: 35,
                ),
                label: 'Mapping',
              ),
            ],
          ),
        ),
      ),
    );
  }
}