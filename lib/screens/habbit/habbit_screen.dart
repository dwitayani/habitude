import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habitude_aplication/widgets/habit_widget.dart';

import '../form_tambah/formtambah_screen.dart';

class habbitScreen extends StatelessWidget {
  const habbitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Tindakan saat tombol tambah diklik
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormTambahScreen()),
            );
            },
            child: Icon(Icons.add),
            backgroundColor: Color(0xFF7EBB94),
          ),
      body: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Your habits start here",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
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
              // Habbit body
              // HabitWidget(),
              
      );
  }
}