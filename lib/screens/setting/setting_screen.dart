import 'package:flutter/material.dart';

class settingWidget extends StatelessWidget {
  const settingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
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
              ),
            ),
            Text(
              'Application Version Info',
              style: TextStyle(
                fontFamily: 'TitiliumWeb',
              ),
            ),
            Text(
              'Turn On Holiday Mode',
              style: TextStyle(
                fontFamily: 'TitiliumWeb',
              ),
            )
          ],
          

        )
      ),
    );
  }
}