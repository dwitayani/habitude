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
          onPressed: () {
            Navigator.pop(context);
          },
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
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.0),
                ),
              ),
              child: Text(
                'Notification Settings',
                style: TextStyle(
                  fontFamily: 'TitiliumWeb',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.0),
                ),
              ),
              child: Text(
                'Turn On Holiday Mode',
                style: TextStyle(
                  fontFamily: 'TitiliumWeb',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0)),
              ),
              child: Text(
                'Aplication Version Info',
                style: TextStyle(
                  fontFamily: 'TitiliumWeb',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
