import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habitude_aplication/widgets/habit_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Container(
        color: Colors.blue[50],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // Judul Halaman Home
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Selamat datang",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Disini habit mu dimulai",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Habbit body
            // HabitWidget(),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection("habits").snapshots(),
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return Text('loading data...');
                }
                List<DocumentSnapshot<Map<String, dynamic>>> docs =
                    snapshot.data!.docs;
                return Column(
                  children: List.generate(docs.length, (index) {
                    return HabitWidget(
                      id: docs[index].id,
                      judul: docs[index].data()!['nama'],
                      jadwalHari: List<String>.from(
                          docs[index].data()!['hari_mengulang']),
                      jamPengingat: List<String>.from(
                          docs[index].data()!['jam_pengingat']),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: SizedBox(
      //     // height: 20.0,
      //     width: MediaQuery.of(context).size.width,
      //     child: Column(children: [
      //       const SizedBox(
      //         height: 20.0,
      //       ),
      //       Text(
      //         'Good Morning',
      //         style: TextStyle(fontSize: 32, fontFamily: 'TitanOne'),
      //       ),
      //       SizedBox(
      //         height: 20.0,
      //       ),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         child: Column(
      //           children: List.generate(20, (index) {

      //           }),
      //         ),
      //       )
      //     ]),
      //   ),
      // ),
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
        backgroundColor: Color(0xFF7EBB94),
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
