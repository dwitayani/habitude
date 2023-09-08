import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/habit_widget.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:habitude_aplication/widgets/mapping_widget.dart';

class MappingScreen extends StatelessWidget {
  const MappingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue[50],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
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
                "MAPPING",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'TitanOne',
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
                        interval: DateTimeRange(
                          start: DateTime.fromMillisecondsSinceEpoch(
                              (docs[index].data()!['interval']['start']
                                      as Timestamp)
                                  .millisecondsSinceEpoch),
                          end: DateTime.fromMillisecondsSinceEpoch((docs[index]
                                  .data()!['interval']['end'] as Timestamp)
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
        )
      ]),
    ));
  }
}
