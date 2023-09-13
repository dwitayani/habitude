// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListWidget extends StatefulWidget {
  final String id;
  final String namatask;
  final bool status;
  final DocumentSnapshot<Map<String, dynamic>> tasklist;
  const TaskListWidget(
      {super.key,
      required this.id,
      required this.namatask,
      required this.tasklist,
      required this.status});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  TextEditingController judultaskController = TextEditingController();

@override
void initState(){
  super.initState();
  judultaskController.text = widget.tasklist.data()?['nama_task'];
}

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
          color: Color.fromARGB(255, 246, 246, 246),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black,
          ),
          boxShadow: [
                BoxShadow(
                  color: Colors.grey, 
                  offset: Offset(0, 3), // Arah bayangan (horizontal, vertical)
                  blurRadius: 3.0, // Ketajaman bayangan
                  spreadRadius: 1.5, // Sebaran bayangan
                ),
              ],
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
                  value: widget.status,
                  onChanged: (_) {
                    setState(() async{
                      await FirebaseFirestore.instance
                                      .collection('tasklist')
                                      .doc(widget.tasklist.id)
                                      .update({
                                    "status": !widget.status,
                                  });
                    });
                  },
                  activeColor: Colors.white,
                  tristate: true,
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
            onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 100, maxHeight: 180),
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 126, 187, 183),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Color.fromARGB(255, 42, 90, 90),
                              width: 2.0,
                            )),
                        child: Column(
                          children: [
                            Text(
                              "Edit Task",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'TitanOne',
                              ),
                            ),
                            Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "TASK NAME",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontFamily: 'TitanOne'),
                                ),
                                controller: judultaskController,
                              ),
                              margin: EdgeInsets.all(12),
                              padding: EdgeInsets.all(8),
                              width: 360,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (judultaskController.text.isEmpty) {
                                  print(SnackBar(
                                      content: Text('harus diisi semua iya')));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('tasklist cannot be empty'),
                                    duration: Duration(seconds: 2),
                                  ));
                                } else {
                                  await FirebaseFirestore.instance
                                      .collection('tasklist')
                                      .doc(widget.tasklist.id)
                                      .update({
                                    "nama_task": judultaskController.text,
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('tasklist successfully edited'),
                                    duration: Duration(seconds: 2),
                                  ));
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 42, 90, 90),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 42, 90, 90),
                                    width: 2.0,
                                  ),
                                ),
                                child: Text(
                                  'save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'TitanOne',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
        IconSlideAction(
          caption: 'delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
            await FirebaseFirestore.instance
                .collection("tasklist")
                .doc(widget.id)
                .delete();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('tasklist successfully deleted'),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
