// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habitude_aplication/widgets/tasklist_widget.dart';

class TasklistScreen extends StatefulWidget {
  const TasklistScreen({super.key});

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
                     .where('uid',isEqualTo: user?.uid)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('loading data...');
                  }
                  List<DocumentSnapshot<Map<String, dynamic>>> docs =
                      snapshot.data!.docs;
                  return Column(
                    children: List.generate(docs.length, (index) {
                      print(docs[index].data()!['status']);
                      return TaskListWidget(
                        id: docs[index].id,
                        namatask: docs[index].data()!['nama_task'],
                        tasklist: docs[index],
                        status: docs[index].data()!['status'],
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              constraints: BoxConstraints(maxWidth: 100, maxHeight: 180),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 126, 187, 148),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Color.fromARGB(255, 64, 115, 82),
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
                      decoration: InputDecoration(
                        hintText: "TASK NAME",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'TitanOne'),
                      ),
                      controller: judultaskController,
                    ),
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(8),
                    width: 360,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (judultaskController.text.isEmpty) {
                        print(SnackBar(content: Text('harus diisi semua iya')));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('tasklist cannot be empty'),
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        // List<Map<String, dynamic>> tasklist= [];
                        await FirebaseFirestore.instance
                            .collection('tasklist')
                            .add({
                          // "checklist": judultaskController.text,
                          "nama_task": judultaskController.text,
                          "status": false,
                          "uid":user?.uid
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('tasklist successfully added'),
                          duration: Duration(seconds: 2),
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 28,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 64, 115, 82),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Color.fromARGB(255, 64, 115, 82),
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        'save',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'TitanOne',
                        ),
                      ),
                    ),
                  ),
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
