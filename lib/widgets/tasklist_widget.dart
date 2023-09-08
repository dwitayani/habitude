// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListWidget extends StatefulWidget {
  final String id;
  final String namatask;
  const TaskListWidget({super.key, required this.id, required this.namatask});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 231, 255),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(width: 1.0, color: Colors.black),
                  ),
                  checkColor: Colors.black,
                  value: isChecked,
                  onChanged: (_) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  activeColor: Colors.white,
                  tristate: true, 
                  // value: null,
                  // value: isChecked,
                  // onChanged: (bool? value) {
                  //   setState(() {
                  //     isChecked = value!;
                  //   });
                  // },
                ),
                Text(widget.namatask),
              ],
            )
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {
            // Logika ketika aksi 1 dijalankan
          },
        ),
        IconSlideAction(
          caption: 'hapus',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            // Logika ketika aksi 2 dijalankan
          },
        ),
      ],
    );
  }
}
