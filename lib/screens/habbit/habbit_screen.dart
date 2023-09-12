import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habitude_aplication/widgets/habit_widget.dart';
import '../form_tambah/formtambah_screen.dart';

class habbitScreen extends StatefulWidget {
  const habbitScreen({super.key});

  @override
  State<habbitScreen> createState() => _habbitScreenState();
}

class _habbitScreenState extends State<habbitScreen> {
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Tindakan saat tombol tambah diklik
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormTambahScreen()),
            );
          },
          child: Container(
            child: Icon(Icons.add),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Color(0xFF7EBB94),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                    return Column(
                      children: List.generate(docs.length, (index) {
                        return HabitWidget(
                          id: docs[index].id,
                          judul: docs[index].data()!['nama'],
                          jadwalHari: List<String>.from(
                              docs[index].data()!['hari_mengulang']),
                          jamPengingat: List<String>.from(
                              docs[index].data()!['jam_pengingat']),
                          interval: DateTimeRange(
                            start: DateTime.fromMillisecondsSinceEpoch(
                                (docs[index].data()!['interval']['start']
                                        as Timestamp)
                                    .millisecondsSinceEpoch),
                            end: DateTime.fromMillisecondsSinceEpoch(
                                (docs[index].data()!['interval']['end']
                                        as Timestamp)
                                    .millisecondsSinceEpoch),
                          ),
                          habit: docs[index],
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
          // Habbit body
        ) // HabitWidget(),
        );
  }
}
