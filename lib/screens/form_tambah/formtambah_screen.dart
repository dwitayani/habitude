// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class FormTambahScreen extends StatelessWidget {
  const FormTambahScreen({super.key});

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
              Center(
                child: const Text(
                  'create new habit',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'TitanOne',
                    fontSize: 28,
                  ),
                ),
              ),
              Container(
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
              Column(
                children: [
                  Text(
                    'starting',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16,  bottom: 16),
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
              Text('end'),
              Container(
                margin: const EdgeInsets.only(top: 16,  bottom: 16),
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
              const Text('interval and repetition'),
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
                  // if (widget.jadwalHari.contains(e)) {
                  //   isScheduled = true;
                  // }
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
              Text('reminder'),
              Row(
                children: [
                  Container(
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
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ],
              ),
              Container(
                height: 28,
                width: 152,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Text(
                  'add',
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 28,
                    width: 152,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 219, 42, 42),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Text('cancel'),
                  ),
                  Container(
                    height: 28,
                    width: 152,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Text('save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
