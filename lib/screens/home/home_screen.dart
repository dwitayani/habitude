import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: Icon(Icons.menu, size: 35, color: Colors.black,),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 15.0), // Jarak dari sisi kanan
            child: IconButton(
              icon: Icon(Icons.person, size: 35, color: Colors.black,),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          
          children: List.generate(20, (index) {
            return Container(
              margin: EdgeInsets.only(bottom: 15.0),
              width: 350,
              padding: const EdgeInsets.all(20.0),
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(251, 241, 186, 176),
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            );
          }),
        ),
      )
          //     Column(
          //       children: List.generate(10, (index) {return Container(
          //         width: 336,
          //         padding: const EdgeInsets.all(20.0),
          //         height: 80,
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(252, 235, 170, 158),
          //           borderRadius: BorderRadius.circular(60.0),
          //           border: Border.all(
          //             color: Colors.black,
          //             width: 1.0,
          //           ),
          //         ),
          //       )
          //       ;}
          //       ),
          // ),
          ),
      // SizedBox(
      //   // height: 20.0,
      //   width: MediaQuery.of(context).size.width,
      //   child: Column(children: [
      //     Text(
      //       'Good Morning',
      //       style: TextStyle(
      //         fontSize: 30,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 20.0,
      //     ),
      //     Column(
      //       children: List.generate(10, (index) {return Container(
      //         width: 336,
      //         padding: const EdgeInsets.all(20.0),
      //         height: 80,
      //         decoration: BoxDecoration(
      //           color: Color.fromARGB(252, 235, 170, 158),
      //           borderRadius: BorderRadius.circular(60.0),
      //           border: Border.all(
      //             color: Colors.black,
      //             width: 1.0,
      //           ),
      //         ),
      //       );
      //       }
      //       ),
      //     ),
      //     // Padding(
      //     //   padding: const EdgeInsets.all(.300),
      //       // child: Container(
      //       //   width: 336,
      //       //   padding: const EdgeInsets.all(20.0),
      //       //   height: 80,
      //       //   decoration: BoxDecoration(
      //       //     color: Color.fromARGB(252, 235, 170, 158),
      //       //     borderRadius: BorderRadius.circular(60.0),
      //       //     border: Border.all(
      //       //       color: Colors.black,
      //       //       width: 1.0,
      //       //     ),
      //       //   ),
      //     //     child: Text("contoh aja", style: TextStyle(fontSize: 25)),
      //     //   ),
      //     // ),
      //     SizedBox(
      //       height: 5.0,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(.300),
      //       child: Container(
      //         width: 336,
      //         padding: const EdgeInsets.all(20.0),
      //         height: 80,
      //         decoration: BoxDecoration(
      //           color: Color.fromARGB(252, 235, 170, 158),
      //           borderRadius: BorderRadius.circular(60.0),
      //           border: Border.all(
      //             color: Colors.black,
      //             width: 1.0,
      //           ),
      //         ),
      //         child: Text("contoh aja 2", style: TextStyle(fontSize: 25)),
      //       ),
      //     ),
      //     // Text('Good Morning', style: TextStyle(
      //     //   fontSize: 30,
      //     //   ),),
      //     // Container(
      //     //   color: Colors.amber,
      //     //   alignment: Alignment.center,
      //     //   padding: EdgeInsets.all(16.0),
      //     //   width: 200,
      //     //   height: 150,
      //     //   child: Text(
      //     //     'Ini adalah Card dengan Container',
      //     //     style: TextStyle(fontSize: 18.0),
      //     //     textAlign: TextAlign.center,
      //     //   ),
      //     // ),
      //     // Container(
      //     //   color: Colors.amberAccent,
      //     //   alignment: Alignment.center,
      //     //   padding: EdgeInsets.all(16.20), // Padding dalam container
      //     //   width: 300, // Lebar card
      //     //   height: 80, // Tinggi card
      //     //   child: Text(
      //     //     'Ini adalah Card dengan Container',
      //     //     style: TextStyle(fontSize: 18.0),
      //     //     textAlign: TextAlign.center,
      //     //   ),
      //     // ),
      //     // Container()
      //   ]),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tindakan saat tombol tambah diklik
          print('Tombol tambah diklik');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      
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
                icon: Icon(Icons.list_outlined, size: 35,),
                label: 'Task List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 35,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month, size: 35,),
                label: 'Mapping',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
