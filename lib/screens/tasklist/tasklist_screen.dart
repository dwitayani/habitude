import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TasklistScreen extends StatefulWidget {
  const TasklistScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TasklistScreen> createState() => _TasklistScreenState();
}

class _TasklistScreenState extends State<TasklistScreen> {
  TextEditingController judultaskController = TextEditingController();
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task List',
                  style: TextStyle(
                    fontFamily: 'Cocogoose',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 32,
                  width: 76,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "To Do",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                // Widget untuk menampilkan daftar tugas yang belum selesai
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("tasklist")
                      .where('uid', isEqualTo: user?.uid)
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(); // Menampilkan loading spinner
                    }
                    List<DocumentSnapshot<Map<String, dynamic>>> docs =
                        snapshot.data!.docs;
                    return Column(
                      children: List.generate(docs.length, (index) {
                        return ListTile(
                          leading: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                            checkColor: Colors.black,
                            value: docs[index].data()!['status'],
                            onChanged: (_) async {
                              await FirebaseFirestore.instance
                                  .collection('tasklist')
                                  .doc(docs[index].id)
                                  .update({
                                "status": !docs[index].data()!['status'],
                              });
                            },
                            activeColor: Colors.white,
                            tristate: true,
                          ),
                          title: Text(docs[index].data()!['nama_task']),
                        );
                      }),
                    );
                  },
                ),
                // Container(
                //   alignment: Alignment.center,
                //   height: 32,
                //   width: 76,
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: Text(
                //     "Done",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // Container untuk menambahkan tugas baru
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 16,
                //     vertical: 16,
                //   ),
                //   child: Column(
                //     children: [
                //       Text(
                //         "Create New Task",
                //         style: TextStyle(
                //           color: Colors.black, // Ganti warna teks
                //           fontFamily: 'TitanOne',
                //         ),
                //       ),
                //       Container(
                //         child: TextField(
                //           decoration: InputDecoration(
                //             hintText: "TASK NAME",
                //             hintStyle: TextStyle(
                //                 fontSize: 16,
                //                 color: Colors.grey,
                //                 fontFamily: 'TitanOne'),
                //           ),
                //           controller: judultaskController,
                //         ),
                //         margin: EdgeInsets.all(12),
                //         padding: EdgeInsets.all(8),
                //         width: 360,
                //         height: 48,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(16),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () async {
                //           if (judultaskController.text.isEmpty) {
                //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //               content: Text('Task list cannot be empty'),
                //               duration: Duration(seconds: 2),
                //             ));
                //           } else {
                //             await FirebaseFirestore.instance
                //                 .collection('tasklist')
                //                 .add({
                //               "nama_task": judultaskController.text,
                //               "status": false,
                //               "uid": user?.uid,
                //             });
                //             judultaskController
                //                 .clear(); // Menghapus teks setelah menambahkan tugas
                //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //               content: Text('Task list successfully added'),
                //               duration: Duration(seconds: 2),
                //             ));
                //           }
                //         },
                //         child: Container(
                //           alignment: Alignment.center,
                //           height: 28,
                //           width: 120,
                //           decoration: BoxDecoration(
                //             color: Color.fromARGB(255, 64, 115, 82),
                //             borderRadius: BorderRadius.circular(24),
                //             border: Border.all(
                //               color: Color.fromARGB(255, 64, 115, 82),
                //               width: 2.0,
                //             ),
                //           ),
                //           child: Text(
                //             'Save',
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontFamily: 'TitanOne',
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: () {
              // Tambahkan aksi saat tombol Floating Action Button ditekan (jika diperlukan)
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Create New Task'),
                    content: TextField(
                      controller: judultaskController,
                      decoration: InputDecoration(
                        hintText: 'Task Name',
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          // Mengambil nilai dari TextField
                          if (judultaskController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Task list cannot be empty'),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            await FirebaseFirestore.instance
                                .collection('tasklist')
                                .add({
                              "nama_task": judultaskController.text,
                              "status": false,
                              "uid": user?.uid,
                            });
                            judultaskController
                                .clear(); // Menghapus teks setelah menambahkan tugas
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Task list successfully added'),
                              duration: Duration(seconds: 2),
                            ));
                            Navigator.of(context).pop();
                          }
                          // String enteredCode = judultaskController.text;

                          // Lakukan sesuatu dengan kode yang dimasukkan, misalnya mencetaknya
                          // print('Entered Code: $enteredCode');

                          // Tutup dialog
                        },
                        child: Text('save'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Tutup dialog tanpa melakukan apa pun
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  );
                },
                // child: Icon(Icons.add),
              );
            }));
  }
}


// // ignore_for_file: prefer_const_constructors

// // import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// // import 'package:habitude_aplication/firebase_options.dart';
// // import 'package:habitude_aplication/screens/account/account_screen.dart';
// // import 'package:habitude_aplication/widgets/tasklist_widget.dart';

// // void main() async {
// //   AwesomeNotifications().initialize(
// //     null,
// //     [
// //       NotificationChannel(
// //           channelKey: 'basic_channel',
// //           channelName: 'Basic notifications',
// //           channelDescription: 'Notification channel for basic tests')
// //     ],
// //     debug: true,
// //   );
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// //   );
// // }

// class TasklistScreen extends StatefulWidget {
//   const TasklistScreen({
//     super.key,
//   });
//   // required this.id, required this.namatask, required this.status, required this.tasklist
//   // });
//   // final String id;
//   // final String namatask;
//   // final bool status;
//   // final DocumentSnapshot<Map<String, dynamic>> tasklist;
//   // static final GlobalKey<NavigatorState> navigatorKey =
//   //     GlobalKey<NavigatorState>();

//   // static const String name = 'Awesome Notifications - Example App';

//   @override
//   State<TasklistScreen> createState() => _TasklistScreenState();
// }

// class _TasklistScreenState extends State<TasklistScreen> {
//   TextEditingController judultaskController = TextEditingController();
//   User? user;

//   @override
//   void initState() {
//     super.initState();
//     // judultaskController.text = widget.tasklist.data()?['nama_task'];
//     FirebaseAuth.instance.authStateChanges().listen((value) async {
//       if (value != null) {
//         user = value;
//       }
//       setState(() {});
//     });
//     // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//     //   if (isAllowed) {
//     //     AwesomeNotifications().requestPermissionToSendNotifications();
//     //   }
//     // });
//     // super.initState();
//   }

//   // triggerNotification() {
//   //   AwesomeNotifications().createNotification(
//   //       content: NotificationContent(
//   //           id: 10,
//   //           channelKey: 'basic_channel',
//   //           title: "notif nih kak",
//   //           body: 'simple button'));
//   // }

//   //   @override
//   // void initState() {
//   //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//   //     if (isAllowed) {
//   //       AwesomeNotifications().requestPermissionToSendNotifications();
//   //     }
//   //   });

//   //   super.initState();
//   // }

//   Widget build(BuildContext context) {
//     if (user == null) {
//       return Scaffold(
//         body: Text('loading'),
//       );
//     }
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           color: Colors.white,
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // InkWell(
//               // onTap: triggerNotification,
//               // child:
//               //  Container(
//               //   height: 16,
//               //   width: 20,
//               // ),
//               // ),
//               Text(
//                 'Task List',
//                 style: TextStyle(
//                   fontFamily: 'Cocogoose',
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 16,
//               ),

//               Container(
//                 alignment: Alignment.center,
//                 height: 32,
//                 width: 76,
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Text("To Do",
//                     style: TextStyle(
//                       color: Colors.white,
//                     )),
//               ),
//               StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                 stream: FirebaseFirestore.instance
//                     .collection("tasklist")
//                     .where('uid', isEqualTo: user?.uid)
//                     .snapshots(),
//                 builder: (_, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Text('loading data...');
//                   }
//                   List<DocumentSnapshot<Map<String, dynamic>>> docs =
//                       snapshot.data!.docs;
//                   return Column(
//                     children: List.generate(docs.length, (index) {
//                       print(docs[index].data()!['status']);
//                       return TaskListWidget(
//                         id: docs[index].id,
//                         namatask: docs[index].data()!['nama_task'],
//                         tasklist: docs[index],
//                         status: docs[index].data()!['status'],
//                       );
//                     }),
//                   );
//                 },
//                 // builder: (context, snapshot) {
//                 //   return Column(
//                 //     children: [
//                 //       Container(
//                 //         child: Row(
//                 //           children: [
//                 //             Checkbox(
//                 //               shape: RoundedRectangleBorder(
//                 //                 borderRadius: BorderRadius.circular(5.0),
//                 //               ),
//                 //               side: MaterialStateBorderSide.resolveWith(
//                 //                 (states) => BorderSide(width: 1.0, color: Colors.black),
//                 //               ),
//                 //               checkColor: Colors.black,
//                 //               value: widget.status,
//                 //               onChanged: (_) {
//                 //                 setState(() async {
//                 //                   await FirebaseFirestore.instance
//                 //                       .collection('tasklist')
//                 //                       .doc(widget.tasklist.id)
//                 //                       .update({
//                 //                     "status": !widget.status,
//                 //                   });
//                 //                 });
//                 //               },
//                 //               activeColor: Colors.white,
//                 //               tristate: true,
//                 //             ),
//                 //             Text(widget.namatask),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   );
//                 // }
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 height: 32,
//                 width: 76,
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Text("Done",
//                     style: TextStyle(
//                       color: Colors.white,
//                     )),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 16,
//                 ),
//                 // child: Column(
//                 //   crossAxisAlignment: CrossAxisAlignment.center,
//                 //   children: [
//                 //     const Text(
//                 //       "TASK LIST",
//                 //       style: TextStyle(
//                 //         fontSize: 32,
//                 //         fontWeight: FontWeight.bold,
//                 //         fontFamily: 'TitanOne',
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//               ),
//               // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//               //   stream: FirebaseFirestore.instance
//               //       .collection("tasklist")
//               //       .where('uid', isEqualTo: user?.uid)
//               //       .snapshots(),
//               //   builder: (_, snapshot) {
//               //     if (!snapshot.hasData) {
//               //       return Text('loading data...');
//               //     }
//               //     List<DocumentSnapshot<Map<String, dynamic>>> docs =
//               //         snapshot.data!.docs;
//               //     return Column(
//               //       children: List.generate(docs.length, (index) {
//               //         print(docs[index].data()!['status']);
//               //         return TaskListWidget(
//               //           id: docs[index].id,
//               //           namatask: docs[index].data()!['nama_task'],
//               //           tasklist: docs[index],
//               //           status: docs[index].data()!['status'],
//               //         );
//               //       }),
//               //     );
//               //   },
//               // ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showDialog(
//           context: context,
//           builder: (BuildContext context) => Dialog(
//             backgroundColor: Colors.transparent,
//             child: Container(
//               constraints: BoxConstraints(maxWidth: 100, maxHeight: 180),
//               padding: EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 126, 187, 148),
//                   borderRadius: BorderRadius.circular(24),
//                   border: Border.all(
//                     color: Color.fromARGB(255, 64, 115, 82),
//                     width: 2.0,
//                   )),
//               child: Column(
//                 children: [
//                   Text(
//                     "Create New Task",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'TitanOne',
//                     ),
//                   ),
//                   Container(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "TASK NAME",
//                         hintStyle: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontFamily: 'TitanOne'),
//                       ),
//                       controller: judultaskController,
//                     ),
//                     margin: EdgeInsets.all(12),
//                     padding: EdgeInsets.all(8),
//                     width: 360,
//                     height: 48,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       if (judultaskController.text.isEmpty) {
//                         print(SnackBar(content: Text('harus diisi semua iya')));
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text('tasklist cannot be empty'),
//                           duration: Duration(seconds: 2),
//                         ));
//                       } else {
//                         // List<Map<String, dynamic>> tasklist= [];
//                         await FirebaseFirestore.instance
//                             .collection('tasklist')
//                             .add({
//                           // "checklist": judultaskController.text,
//                           "nama_task": judultaskController.text,
//                           "status": false,
//                           "uid": user?.uid
//                         });
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text('tasklist successfully added'),
//                           duration: Duration(seconds: 2),
//                         ));
//                         Navigator.pop(context);
//                       }
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 28,
//                       width: 120,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 64, 115, 82),
//                         borderRadius: BorderRadius.circular(24),
//                         border: Border.all(
//                           color: Color.fromARGB(255, 64, 115, 82),
//                           width: 2.0,
//                         ),
//                       ),
//                       child: Text(
//                         'save',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'TitanOne',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         child: Container(
//           child: Icon(Icons.add),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               color: Color(0xFF7EBB94),
//               borderRadius: BorderRadius.circular(50),
//               border: Border.all(color: Colors.black)),
//         ),
//       ),
//     );
//   }
// }
