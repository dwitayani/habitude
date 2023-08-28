import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HabitWidget extends StatefulWidget {
  final String id;
  final String judul;
  final List<String> jadwalHari;
  final List<String> jamPengingat;
  final DateTimeRange interval;
  const HabitWidget(
      {super.key,
      required this.id,
      required this.judul,
      required this.jadwalHari,
      required this.jamPengingat,
      required this.interval});

  @override
  State<HabitWidget> createState() => _HabitWidgetState();
}

class _HabitWidgetState extends State<HabitWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(250, 255, 209, 201),
        borderRadius: BorderRadius.circular(48.0),
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
                      "${widget.jadwalHari.length} times a week",
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
                    Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection("habits")
                            .doc(widget.id)
                            .delete();
                      },
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
                        children:
                            List.generate(widget.jamPengingat.length, (index) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Builder(builder: (context) {
                          bool isToday = false;
                          DateTime today = DateTime.now();
                          if (today.isAfter(widget.interval.start) &&
                              today.isBefore(widget.interval.end)) {
                            if (widget.jadwalHari
                                .contains(DateFormat("EEEE").format(today))) {
                              isToday = true;
                            }
                          }
                          if (!isToday) {
                            return SizedBox();
                          }
                          return TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.close, color: Colors.red),
                                SizedBox(width: 8),
                                Text(
                                  'missed',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        Builder(builder: (context) {
                          return TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                            ),
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
                          );
                        })
                      ],
                    )
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
