// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habitude_aplication/widgets/tasklist_widget.dart';

class TasklistScreen extends StatelessWidget {
  const TasklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "TASK LIST",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'TitanOne',
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("tasklist")
                    .snapshots(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('loading data...');
                  }
                  List<DocumentSnapshot<Map<String, dynamic>>> docs =
                      snapshot.data!.docs;
                  return Column(
                    children: List.generate(docs.length, (index) {
                      return TaskListWidget(
                        id: docs[index].id,
                        namatask: docs[index].data()!['nama_task'],
                      );
                    }),
                  );
                },
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              constraints: BoxConstraints(maxWidth: 100, maxHeight: 180),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 142, 142),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                  )),
              child: Column(
                children: [
                  Text(
                    "Create New Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'TitanOne',
                    ),
                  ),
                  Container(
                    child: TextField(
                      // controller: judulController,
                    ),
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(8),
                    width: 360,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 8.0, right: 4.0),
                          height: 28,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 126, 187, 148),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Color.fromARGB(255, 64, 115, 82),
                              width: 2.0,
                            ),
                          ),
                          child: Text(
                            'cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'TitanOne',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //  {
        //   Dialog(
        //     backgroundColor: Colors.transparent,
        //     child: Container(
        //       constraints: BoxConstraints(maxWidth: 1000.0, maxHeight: 800.0),
        //       padding: EdgeInsets.all(18),
        //       decoration: BoxDecoration(
        //         color: Color.fromARGB(255, 126, 187, 148),
        //         borderRadius: BorderRadius.circular(24),
        //         border: Border.all(
        //           color: Color.fromARGB(255, 64, 115, 82),
        //           width: 2.0,
        //         ),
        //       ),
        //     ),
        //   );
        //   // Tindakan saat tombol tambah diklik

        //   // print('Tombol tambah diklik');
        // },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF7EBB94),
      ),
    );
  }
}
