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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.98, // 80% lebar layar
          height: 800,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 126, 187, 148),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
                color: const Color.fromARGB(255, 64, 115, 82), width: 4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: TextField(
                  controller: judulController,
                ),
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                padding: const EdgeInsets.all(5),
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
                  child: Text(interval != null
                      ? DateFormat("dd-MM-yyyy").format(interval!.start)
                      : ""),
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  padding: const EdgeInsets.all(5),
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
                  child: Text(interval != null
                      ? DateFormat("dd-MM-yyyy").format(interval!.end)
                      : ""),
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  padding: const EdgeInsets.all(5),
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
                      margin: const EdgeInsets.only(top: 8.0, right: 4.0),
                      padding: const EdgeInsets.all(5),
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
                  margin: const EdgeInsets.only(top: 8.0, right: 4.0),
                  height: 28,
                  width: 152,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 152, 96),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color.fromARGB(255, 42, 90, 59)),
                  ),
                  child: Text(
                    'add',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'TitanOne',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8.0, right: 4.0),
                      height: 28,
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
                      await FirebaseFirestore.instance
                          .collection('habits')
                          .add({
                        "hari_mengulang": jadwal,
                        "jam_pengingat": reminder,
                        "nama": judulController.text,
                        "interval": {
                          "start": interval?.start,
                          "end": interval?.end,
                        }
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8.0, right: 4.0),
                      height: 28,
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
