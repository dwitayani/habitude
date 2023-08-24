import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {},
        ),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "setting",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "TitanOne",
            fontSize: 35,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(28),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification Settings',
              style: TextStyle(
                fontFamily: 'TitiliumWeb',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Application Version Info',
              style: TextStyle(
                fontFamily: 'TitiliumWeb',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Turn On Holiday Mode',
              style: TextStyle(
                fontFamily: 'TitiliumWeb',
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
