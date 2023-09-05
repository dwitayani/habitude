import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Dialog/edithabit_dialog.dart';

class HabitWidget extends StatefulWidget {
  final String id;
  final String judul;
  final List<String> jadwalHari;
  final List<String> jamPengingat;
  final DateTimeRange interval;
  final DocumentSnapshot<Map<String, dynamic>> habit;
  const HabitWidget(
      {super.key,
      required this.id,
      required this.judul,
      required this.jadwalHari,
      required this.jamPengingat,
      required this.interval,
      required this.habit});

  @override
  State<HabitWidget> createState() => _HabitWidgetState();
}

class _HabitWidgetState extends State<HabitWidget> {
  bool isOpen = false;
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: widget.jadwalHari.contains(DateFormat("EEEE").format(today))
              ? Color.fromARGB(250, 255, 209, 201)
              : Color.fromARGB(250, 255, 209, 201).withOpacity(0.5),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.judul,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'TitanOne',
                        ),
                      ),
                      Text(
                        "${widget.jadwalHari.length} days a week",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'TitanOne',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isOpen)
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EditHabitDialog(
                                habit: widget.habit,
                                id: '',
                                judul: '',
                                jadwalHari: [],
                                jamPengingat: [],
                                interval: widget.interval,
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                      //menampilkan Dialog hapus
                      InkWell(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: 100, maxHeight: 100),
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(color: Colors.red),
                              child: Column(
                                children: [
                                  Text(
                                    "Konfirmasi Hapus",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                              top: 8.0, right: 4.0),
                                          height: 28,
                                          width: 152,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 207, 88, 80),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 175, 42, 32),
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
                                      InkWell(
                                        onTap: () async {
                                          await FirebaseFirestore.instance
                                              .collection("habits")
                                              .doc(widget.id)
                                              .delete();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text('data berhasil diedit'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                              top: 8.0, right: 4.0),
                                          height: 28,
                                          width: 152,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 64, 152, 96),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 42, 90, 59)),
                                          ),
                                          child: Text(
                                            'delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'TitanOne',
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    isOpen = !isOpen;
                    setState(() {});
                  },
                  child: Icon(
                    isOpen
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    size: 32,
                  ),
                )
              ],
            ),
            if (isOpen)
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          "Sunday",
                          "Monday",
                          "Tuesday",
                          "Wednesday",
                          "Thursday",
                          "Friday",
                          "Saturday",
                        ].map((e) {
                          bool isScheduled = false;
                          if (widget.jadwalHari.contains(e)) {
                            isScheduled = true;
                          }
                          return Container(
                            margin: EdgeInsets.only(top: 8.0, right: 4.0),
                            padding: EdgeInsets.all(5),
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isScheduled
                                  ? const Color.fromARGB(255, 255, 181, 181)
                                  : Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            child: Text(
                              e[0],
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'TitanOne',
                                color: !isScheduled
                                    ? const Color.fromARGB(255, 255, 181, 181)
                                    : Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reminder',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'TitilliumWeb',
                          color: Colors.grey,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(widget.jamPengingat.length,
                              (index) {
                            return Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 4.0, right: 4.0),
                              width: 80,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                              ),
                              child: Text(
                                widget.jamPengingat[index],
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }),
                        ),
                      ),
                      widget.jadwalHari
                              .contains(DateFormat("EEEE").format(today))
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(Icons.close, color: Colors.red),
                                      SizedBox(width: 8),
                                      Text(
                                        'Missed',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
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
                                ),
                              ],
                            )
                          : SizedBox()
                    ],
                  ),
                ],
              ),
          ],
        ));
  }
}
