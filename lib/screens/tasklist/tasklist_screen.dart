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
          color: Colors.blue[50],
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
        onPressed: () {
          // Tindakan saat tombol tambah diklik
          print('Tombol tambah diklik');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF7EBB94),
      ),
    );
  }
}
