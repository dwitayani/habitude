// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:habitude_aplication/screens/account/account_screen.dart';
import 'package:habitude_aplication/screens/setting/setting_screen.dart';
import 'package:habitude_aplication/screens/tasklist/tasklist_screen.dart';
import '../habbit/habbit_screen.dart';
import '../mapping/mapping_screen.dart';
// import '../setting/setting_screen.dart';
// import '../tasklist/tasklist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((value) async {
      if (value != null) {
        user = value;
      } else {
        await FirebaseAuth.instance.signInAnonymously();
      }
      setState(() {});
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        body: Text('loading'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        // actions: [
        //   if (user?.isAnonymous == false)
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       // child: Image.network(user!.photoURL ?? ''),
        //     ),
        // ],
        title: Row(
          children: [
            if (user?.isAnonymous == false)
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 52,
                  // width: 52,
                  decoration: BoxDecoration(),
                  child: Image.network(user!.photoURL ?? '')),
            // SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  user?.displayName ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'TitiliumWeb',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  user?.email ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'TitiliumWeb',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),

        // leading: IconButton(
        //   icon: Icon(
        //     Icons.person,
        //     color: Colors.black,
        //     size: 35,
        //   ),
        //   onPressed: () async {
        //     final GoogleSignInAccount? googleUser =
        //         await GoogleSignIn().signIn();
        //     final GoogleSignInAuthentication? googleAuth =
        //         await googleUser?.authentication;
        //     final credential = GoogleAuthProvider.credential(
        //       accessToken: googleAuth?.accessToken,
        //       idToken: googleAuth?.idToken,
        //     );
        //     await FirebaseAuth.instance.signInWithCredential(credential);
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text('you have successfully signed in'),
        //         duration: Duration(seconds: 2),
        //       ),
        //     );
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      // backgroundColor: Colors.white.withAlpha(0),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          habbitScreen(),
          MappingScreen(),
          TasklistScreen(),
          SettingScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Mapping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Task List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest),
            label: 'Setting',
          ),
        ],
        currentIndex: currentPageIndex,
        selectedItemColor: Color.fromARGB(255, 246, 171, 124),
        unselectedItemColor: Color.fromARGB(255, 179, 179, 179),
        onTap: _onItemTapped,
        selectedFontSize: 16.0,
        unselectedFontSize: 20.0,
      ),

      // bottomNavigationBar: NavigationBar(
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       currentPageIndex = index;
      //     });
      //   },
      //   indicatorColor: Color.fromARGB(255, 244, 154, 98),
      //   selectedIndex: currentPageIndex,
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.home),
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.calendar_month),
      //       icon: Icon(Icons.calendar_month_outlined),
      //       label: 'Mappig',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.list),
      //       icon: Icon(Icons.list_outlined),
      //       label: 'Tasklist',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.person),
      //       icon: Icon(Icons.person_2_outlined),
      //       label: 'Account',
      //     ),
      //   ],
      // ),
      // SizedBox(
      //   height: 80,
      //   width: 356,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: Color.fromARGB(255, 170, 170, 170),
      //       borderRadius: BorderRadius.circular(30),
      //       border: Border.all(
      //         color: Colors.black,
      //       ),
      //     ),
      //     child: TabBar(
      //       tabs: [
      //         Tab(
      //           icon: Icon(
      //             Icons.list_rounded,
      //             size: 35,
      //           ),
      //         ),
      //         Tab(
      //           icon: Icon(
      //             Icons.home,
      //             size: 35,
      //           ),
      //         ),
      //         Tab(
      //           icon: Icon(
      //             Icons.calendar_month,
      //             size: 35,
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
