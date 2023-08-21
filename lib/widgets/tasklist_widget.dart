import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskListWidget extends StatefulWidget {
  final String id;
  final String namatask;
  const TaskListWidget(
    {super.key,
    required this.id,
    required this.namatask
    });

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
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
          Text(widget.namatask)
        ],
      ),
    );
  }
}