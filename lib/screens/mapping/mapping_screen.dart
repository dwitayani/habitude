import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import '../../widgets/habit_widget.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:habitude_aplication/widgets/mapping_widget.dart';

class MappingScreen extends StatefulWidget {
  const MappingScreen({super.key});

  @override
  State<MappingScreen> createState() => _MappingScreenState();
}

class _MappingScreenState extends State<MappingScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((value) async {
      if (value != null) {
        user = value;
      }
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        body: Text('loading'),
      );
    }
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  // horizontal: 16,
                  vertical: 16,
                ),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      alignment: Alignment.center,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mapping',
                            style: TextStyle(
                              fontFamily: 'Cocogoose',
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection("habits")
                            .where('uid', isEqualTo: user?.uid)
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (!snapshot.hasData) {
                            return Text('loading data...');
                          }
                          List<DocumentSnapshot<Map<String, dynamic>>> docs =
                              snapshot.data!.docs;
                          return CarouselSlider(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height,
                              viewportFraction: 0.75,
                              enlargeCenterPage: true,
                              // width: MediaQuery.of(context).size.width,
                              // aspectRatio: MediaQuery.of(context).size.width /
                              // MediaQuery.of(context).size.height,
                            ),
                            items: docs.map((doc) {
                              Map<String, dynamic> data = doc.data()!;
                              int success = 0;
                              int failed = 0;
                              int pending = 0;
                              for (int i = 0;
                                  i <
                                      List<Map<String, dynamic>>.from(
                                              data['mappings'])
                                          .length;
                                  i++) {
                                Map<String, dynamic> d = data['mappings'][i];
                                switch (d['value']) {
                                  case true:
                                    success++;
                                    break;
                                  case false:
                                    failed++;
                                    break;
                                  default:
                                    if (int.parse(DateFormat("yyyyMMdd")
                                            .format(DateTime.now())) >
                                        int.parse(d['key'])) {
                                      failed++;
                                    } else {
                                      pending++;
                                    }
                                }
                              }

                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 248, 188, 150),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0,
                                              3), // Arah bayangan (horizontal, vertical)
                                          blurRadius: 3.0, // Ketajaman bayangan
                                          spreadRadius: 1.5, // Sebaran bayangan
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          data['nama'] ?? "-",
                                          style: const TextStyle(
                                              fontSize: 32.0,
                                              fontFamily: 'TitanOne'),
                                        ),
                                        const SizedBox(
                                          height: 32,
                                        ),
                                        AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              // color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width),
                                            ),
                                            alignment: Alignment.center,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SfCircularChart(
                                                  series: <DoughnutSeries<
                                                      Map<String, dynamic>,
                                                      String>>[
                                                    DoughnutSeries<
                                                        Map<String, dynamic>,
                                                        String>(
                                                      dataSource: <Map<String,
                                                          dynamic>>[
                                                        {
                                                          'key': 'Complete',
                                                          'value': success,
                                                          'color': Colors.green,
                                                        },
                                                        {
                                                          'key': 'Missed',
                                                          'value': failed,
                                                          'color': Colors.red,
                                                        },
                                                        {
                                                          'key': 'Pending',
                                                          'value': pending,
                                                          'color':
                                                              Colors.grey[100],
                                                        },
                                                      ],
                                                      xValueMapper:
                                                          (Map<String, dynamic>
                                                                      data,
                                                                  _) =>
                                                              data['key'],
                                                      yValueMapper:
                                                          (Map<String, dynamic>
                                                                      data,
                                                                  _) =>
                                                              data['value'],
                                                      pointColorMapper:
                                                          (Map<String, dynamic>
                                                                      data,
                                                                  _) =>
                                                              data['color'],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 76,
                                                  width: 76,
                                                  child: Image.asset(
                                                    'assets/splash.png',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   children: [
                                        //     Row(
                                        //       children: [
                                        //         Icon(
                                        //           Icons.donut_large,
                                        //           color: Colors.green,
                                        //         ),
                                        //         Text('Completed')
                                        //       ],
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         Icon(
                                        //           Icons.donut_large,
                                        //           color: Colors.red,
                                        //         ),
                                        //         Text('Missed')
                                        //       ],
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         Icon(
                                        //           Icons.donut_large,
                                        //           color: Colors.grey[100],
                                        //         ),
                                        //         Text('Remaining')
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 246, 220),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.black,
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('Completed',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.green,
                                                          fontFamily:
                                                              'TitanOne')),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    "${success}",
                                                    style: TextStyle(
                                                      fontSize: 28,
                                                      fontFamily: 'TitanOne',
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              VerticalDivider(),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Missed',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                        fontFamily: 'TitanOne'),
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    "${failed}",
                                                    style: TextStyle(
                                                      fontSize: 28,
                                                      fontFamily: 'TitanOne',
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              VerticalDivider(),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Remaining',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey,
                                                        fontFamily: 'TitanOne'),
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    "${pending}",
                                                    style: TextStyle(
                                                      fontSize: 28,
                                                      fontFamily: 'TitanOne',
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// // import '../../widgets/habit_widget.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:habitude_aplication/widgets/mapping_widget.dart';

// class MappingScreen extends StatefulWidget {
//   const MappingScreen({super.key});

//   @override
//   State<MappingScreen> createState() => _MappingScreenState();
// }

// class _MappingScreenState extends State<MappingScreen> {
//   User? user;
//   @override
//   void initState() {
//     super.initState();
//     FirebaseAuth.instance.authStateChanges().listen((value) async {
//       if (value != null) {
//         user = value;
//       }
//       setState(() {});
//     });
//   }

//   Widget build(BuildContext context) {
//     if (user == null) {
//       return Scaffold(
//         body: Text('loading'),
//       );
//     }
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         padding: EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mapping',
//                 style: TextStyle(
//                   fontFamily: 'Cocogoose',
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.symmetric(
//                     // horizontal: 16,
//                     vertical: 16,
//                   ),
//                   height: MediaQuery.of(context).size.height,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                           stream: FirebaseFirestore.instance
//                               .collection("habits")
//                               .where('uid', isEqualTo: user?.uid)
//                               .snapshots(),
//                           builder: (_, snapshot) {
//                             if (!snapshot.hasData) {
//                               return Text('loading data...');
//                             }
//                             List<DocumentSnapshot<Map<String, dynamic>>> docs =
//                                 snapshot.data!.docs;
//                             return CarouselSlider(
//                               options: CarouselOptions(
//                                 height: MediaQuery.of(context).size.height,
//                                 viewportFraction: 0.75,
//                                 enlargeCenterPage: true,
//                                 // width: MediaQuery.of(context).size.width,
//                                 // aspectRatio: MediaQuery.of(context).size.width /
//                                 // MediaQuery.of(context).size.height,
//                               ),
//                               items: docs.map((doc) {
//                                 Map<String, dynamic> data = doc.data()!;
//                                 int success = 0;
//                                 int failed = 0;
//                                 int pending = 0;
//                                 for (int i = 0;
//                                     i <
//                                         List<Map<String, dynamic>>.from(
//                                                 data['mappings'])
//                                             .length;
//                                     i++) {
//                                   Map<String, dynamic> d = data['mappings'][i];
//                                   switch (d['value']) {
//                                     case true:
//                                       success++;
//                                       break;
//                                     case false:
//                                       failed++;
//                                       break;
//                                     default:
//                                       if (int.parse(DateFormat("yyyyMMdd")
//                                               .format(DateTime.now())) >
//                                           int.parse(d['key'])) {
//                                         failed++;
//                                       } else {
//                                         pending++;
//                                       }
//                                   }
//                                 }
        
//                                 return Builder(
//                                   builder: (BuildContext context) {
//                                     return Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       margin: const EdgeInsets.symmetric(
//                                         horizontal: 2,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Color.fromARGB(255, 239, 212, 172),
//                                         borderRadius: BorderRadius.circular(12),
//                                         border: Border.all(color: Colors.black),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey,
//                                             offset: Offset(0,
//                                                 3), // Arah bayangan (horizontal, vertical)
//                                             blurRadius: 3.0, // Ketajaman bayangan
//                                             spreadRadius: 1.5, // Sebaran bayangan
//                                           ),
//                                         ],
//                                       ),
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 16,
//                                         vertical: 16,
//                                       ),
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             data['nama'] ?? "-",
//                                             style: const TextStyle(
//                                                 fontSize: 32.0,
//                                                 fontFamily: 'TitanOne'),
//                                           ),
//                                           const SizedBox(
//                                             height: 32,
//                                           ),
//                                           AspectRatio(
//                                             aspectRatio: 1 / 1,
//                                             child: Container(
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               decoration: BoxDecoration(
//                                                 // color: Colors.blue,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width),
//                                               ),
//                                               alignment: Alignment.center,
//                                               child: Stack(
//                                                 alignment: Alignment.center,
//                                                 children: [
//                                                   SfCircularChart(
//                                                     series: <DoughnutSeries<
//                                                         Map<String, dynamic>,
//                                                         String>>[
//                                                       DoughnutSeries<
//                                                           Map<String, dynamic>,
//                                                           String>(
//                                                         dataSource: <Map<String,
//                                                             dynamic>>[
//                                                           {
//                                                             'key': 'Complete',
//                                                             'value': success,
//                                                             'color': Colors.green,
//                                                           },
//                                                           {
//                                                             'key': 'Missed',
//                                                             'value': failed,
//                                                             'color': Colors.red,
//                                                           },
//                                                           {
//                                                             'key': 'Pending',
//                                                             'value': pending,
//                                                             'color':
//                                                                 Colors.grey[100],
//                                                           },
//                                                         ],
//                                                         xValueMapper:
//                                                             (Map<String, dynamic>
//                                                                         data,
//                                                                     _) =>
//                                                                 data['key'],
//                                                         yValueMapper:
//                                                             (Map<String, dynamic>
//                                                                         data,
//                                                                     _) =>
//                                                                 data['value'],
//                                                         pointColorMapper:
//                                                             (Map<String, dynamic>
//                                                                         data,
//                                                                     _) =>
//                                                                 data['color'],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   SizedBox(
//                                                     height: 76,
//                                                     width: 76,
//                                                     child: Image.asset(
//                                                       'assets/splash.png',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 8,
//                                           ),
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.donut_large,
//                                                     color: Colors.green,
//                                                   ),
//                                                   Text('Completed')
//                                                 ],
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.donut_large,
//                                                     color: Colors.red,
//                                                   ),
//                                                   Text('Missed')
//                                                 ],
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.donut_large,
//                                                     color: Colors.grey[100],
//                                                   ),
//                                                   Text('Remaining')
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 8,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.all(16),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 120,
//                                             decoration: BoxDecoration(
//                                                 color: Color.fromARGB(
//                                                     255, 255, 246, 220),
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                                 border: Border.all(
//                                                   color: Colors.black,
//                                                 )),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Text('Completed',
//                                                         style: TextStyle(
//                                                             fontSize: 10,
//                                                             color: Colors.green,
//                                                             fontFamily:
//                                                                 'TitanOne')),
//                                                     SizedBox(
//                                                       height: 16,
//                                                     ),
//                                                     Text(
//                                                       "${success}",
//                                                       style: TextStyle(
//                                                         fontSize: 28,
//                                                         fontFamily: 'TitanOne',
//                                                         color: Colors.green,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 VerticalDivider(),
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Text(
//                                                       'Missed',
//                                                       style: TextStyle(
//                                                           fontSize: 10,
//                                                           color: Colors.red,
//                                                           fontFamily: 'TitanOne'),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 16,
//                                                     ),
//                                                     Text(
//                                                       "${failed}",
//                                                       style: TextStyle(
//                                                         fontSize: 28,
//                                                         fontFamily: 'TitanOne',
//                                                         color: Colors.red,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 VerticalDivider(),
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Text(
//                                                       'Remaining',
//                                                       style: TextStyle(
//                                                           fontSize: 10,
//                                                           color: Colors.grey,
//                                                           fontFamily: 'TitanOne'),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 16,
//                                                     ),
//                                                     Text(
//                                                       "${pending}",
//                                                       style: TextStyle(
//                                                         fontSize: 28,
//                                                         fontFamily: 'TitanOne',
//                                                         color: Colors.grey,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 );
//                               }).toList(),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 16,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
