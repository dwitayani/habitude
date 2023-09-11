import 'package:flutter/material.dart';
import 'package:habitude_aplication/screens/account/account_screen.dart';
import '../habbit/habbit_screen.dart';
import '../mapping/mapping_screen.dart';
import '../setting/setting_screen.dart';
import '../tasklist/tasklist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          // backgroundColor: Colors.white.withAlpha(0),
          appBar: AppBar(
            toolbarHeight: 70,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: SizedBox(
              height: 55,
              width: 55,
              child: Image.asset('assets/splash.png'),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              TasklistScreen(),
              habbitScreen(),
              MappingScreen(),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            width: 356,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF9BABB8),
              ),
              child: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.list_rounded,
                      size: 35,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.home,
                      size: 35,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.calendar_month,
                      size: 35,
                    ),
                  )
                ],
                // backgroundColor: Color(0xFF9BABB8),
                // selectedItemColor: Color(0xFFD1E7FA),
                // unselectedItemColor: Color(0xFF5F6469),
                // ignore: prefer_const_literals_to_create_immutables

                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.list_outlined,
                //     size: 35,
                //   ),
                //   label: 'Task List',
                // ),

                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.home,
                //     size: 35,
                //   ),
                //   label: 'Home',
                // ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.calendar_month,
                //     size: 35,
                //   ),
                //   label: 'Mapping',
                // ),
              ),
            ),
          ),
        ));
  }
}
