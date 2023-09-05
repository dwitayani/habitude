import 'package:flutter/material.dart';

class mapping_widget extends StatefulWidget {
  const mapping_widget({super.key});

  @override
  State<mapping_widget> createState() => _mapping_widgetState();
}

class _mapping_widgetState extends State<mapping_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 216, 204, 163),
        ),
    );
  }
}