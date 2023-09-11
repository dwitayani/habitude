import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class FormTambahScreen extends StatefulWidget {
  const FormTambahScreen({super.key});

  @override
  State<FormTambahScreen> createState() => _FormTambahScreenState();
}

class _FormTambahScreenState extends State<FormTambahScreen> {
  TextEditingController judulController = TextEditingController();
  List<String> jadwal = [];
  List<String> reminder = [];
  DateTimeRange? interval;
  bool _isCompleate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // margin: const EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 126, 187, 148),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
                color: const Color.fromARGB(255, 64, 115, 82), width: 4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'create new habit',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'TitanOne',
                    fontSize: 28,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "HABIT NAME",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: 'TitanOne')),
                  controller: judulController,
                ),
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.all(8),
                width: 360,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(
                    color: _isCompleate ? Colors.grey : Colors.red,
                    width: 0.5,
                  ),
                ),
              ),
              const Text(
                'starting',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () async {
                  interval = await showDateRangePicker(
                    context: context,
                    initialDateRange: interval,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(interval != null
                      ? DateFormat("dd-MM-yyyy").format(interval!.start)
                      : ""),
                  // decoration: InputDecoration(
                  //     hintText: "HABIT NAME",
                  //     hintStyle: TextStyle(
                  //         fontSize: 16,
                  //         color: Colors.grey,
                  //         fontFamily: 'TitanOne')),
                  // margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: 360,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              const Text(
                'end',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'TitiliumWeb',
                ),
              ),
              InkWell(
                onTap: () async {
                  interval = await showDateRangePicker(
                    context: context,
                    initialDateRange: interval,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(interval != null
                      ? DateFormat("dd-MM-yyyy").format(interval!.end)
                      : ""),
                  // margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  // padding: const EdgeInsets.all(5),
                  width: 360,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              const Text(
                'interval and repetition',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'TitiliumWeb',
                ),
              ),
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
                  if (jadwal.contains(e)) {
                    isScheduled = true;
                  }
                  return InkWell(
                    onTap: () {
                      if (isScheduled) {
                        jadwal.remove(e);
                      } else {
                        jadwal.add(e);
                      }
                      setState(() {});
                    },
                    child: Container(
                      // margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      // padding: const EdgeInsets.all(5),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isScheduled ? Colors.grey : Colors.white,
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
                          color: !isScheduled ? Colors.grey : Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Text(
                'reminder',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'TitiliumWeb',
                ),
              ),
              Column(
                  children: List.generate(reminder.length, (index) {
                return Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Text(reminder[index]),
                      width: 160,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        reminder.removeAt(index);
                        setState(() {});
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                );
              })),
              InkWell(
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  if (selectedTime != null) {
                    reminder.add("${selectedTime.hour}:${selectedTime.minute}");
                    setState(() {});
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  // margin: const EdgeInsets.only(top: 8.0, right: 4.0),
                  height: 28,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 152, 96),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color.fromARGB(255, 42, 90, 59)),
                  ),
                  child: Text(
                    'add reminder',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'TitanOne',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 8.0, right: 4.0),
                      height: 40,
                      width: 152,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 207, 88, 80),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color.fromARGB(255, 175, 42, 32),
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
                      if (jadwal.isEmpty ||
                          reminder.isEmpty ||
                          judulController.text.isEmpty ||
                          interval == null) {
                        print(SnackBar(content: Text('harus diisi semua iya')));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('habit cannot be empty'),
                          duration: Duration(seconds: 2),
                        ));
                        _isCompleate = false;
                      } else {
                        List<Map<String, dynamic>> mappings = [];
                        DateTime start = interval!.start;
                        DateTime end = interval!.end;
                        do {
                          if (jadwal
                              .contains(DateFormat('EEEE').format(start))) {
                            mappings.add({
                              "key": DateFormat("yyyyMMdd").format(start),
                              "value": null,
                            });
                          }
                          start = start.add(Duration(days: 1));
                          print(DateFormat("yyyyMMdd").format(start) !=
                              DateFormat("yyyyMMdd").format(end));
                        } while (DateFormat("yyyyMMdd").format(start) !=
                            DateFormat("yyyyMMdd").format(end));
                        await FirebaseFirestore.instance
                            .collection('habits')
                            .add({
                          "createdAt": FieldValue.serverTimestamp(),
                          "mappings": mappings,
                          "hari_mengulang": jadwal,
                          "jam_pengingat": reminder,
                          "nama": judulController.text,
                          "interval": {
                            "start": interval?.start,
                            "end": interval?.end,
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('habit successfully added'),
                          duration: Duration(seconds: 2),
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(4),
                      height: 40,
                      width: 152,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 64, 152, 96),
                        borderRadius: BorderRadius.circular(16),
                        border:
                            Border.all(color: Color.fromARGB(255, 42, 90, 59)),
                      ),
                      child: Text(
                        'save',
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
    );
  }
}
