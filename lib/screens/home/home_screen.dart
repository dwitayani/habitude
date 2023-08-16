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
        leading: Icon(
          Icons.menu,
          size: 35,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 15.0), // Jarak dari sisi kanan
            child: IconButton(
              icon: Icon(
                Icons.person,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // height: 20.0,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Good Morning',
              style: TextStyle(fontSize: 32, fontFamily: 'TitanOne'),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: List.generate(20, (index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8.0, top: 8.0),
                    width: 320,
                    padding: const EdgeInsets.all(24.0),
                    height: 240,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text('judul habbit',
                                    style: TextStyle(
                                        fontSize: 24, fontFamily: 'TitanOne')),
                                Text('waktu pengulangan',
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'TitanOne',
                                        color: Colors.grey
                                        ))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 8.0,right: 4.0),
                                  padding: EdgeInsets.all(5),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    'S',
                                    style: TextStyle(fontSize: 16, fontFamily: 'TitanOne', color:Color.fromARGB(255, 255, 181, 181)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0,right: 4.0),
                                  padding: EdgeInsets.all(5),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    'M',
                                    style: TextStyle(fontSize: 16, fontFamily: 'TitanOne', color:Color.fromARGB(255, 255, 181, 181)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0,right: 4.0),
                                  padding: EdgeInsets.all(5),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    'T',
                                    style: TextStyle(fontSize: 16, fontFamily: 'TitanOne', color:Color.fromARGB(255, 255, 181, 181)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0,right: 4.0),
                                  padding: EdgeInsets.all(5),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    'W',
                                    style: TextStyle(fontSize: 16, fontFamily: 'TitanOne',color:Color.fromARGB(255, 255, 181, 181)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0,right: 4.0),
                                  padding: EdgeInsets.all(5),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    'T',
                                    style: TextStyle(fontSize: 16, fontFamily: 'TitanOne', color:Color.fromARGB(255, 255, 181, 181)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0,right: 4.0),
                                  padding: EdgeInsets.all(5),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    'F',
                                    style: TextStyle(fontSize: 16, fontFamily: 'TitanOne', color:Color.fromARGB(255, 255, 181, 181)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0,right: 4.0),
                                  padding: EdgeInsets.all(5),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    'S',
                                    style: TextStyle(fontSize: 16, fontFamily: 'TitanOne', color:Color.fromARGB(255, 255, 181, 181)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Reminder', style: TextStyle(fontSize: 12, fontFamily: 'TitilliumWeb', color:Colors.grey)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (index) {
                              return Container(
                                
                                 margin: EdgeInsets.only(top: 4.0,right: 4.0),
                                width: 80,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.0)),
                              );
                            })),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.close, color: Colors.red),
                                      SizedBox(width: 8),
                                      Text(
                                        'missed',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.green),
                                    SizedBox(width: 8),
                                    Text(
                                      'I do it',
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ])
                          ],
                        ),
                      ],
                    ),
                    
                    decoration: BoxDecoration(
                      color: Color.fromARGB(250, 255, 209, 201),
                      borderRadius: BorderRadius.circular(48.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  );
                }),
              ),
            )
          ]),
        ),
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
