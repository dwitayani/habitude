import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Setting',
              style: TextStyle(
                fontFamily: 'Cocogoose',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
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

// import 'package:flutter/material.dart';

// class SettingScreen extends StatelessWidget {
//   const SettingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(28),
//         color: Colors.white,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Setting',
//               style: TextStyle(
//                 fontFamily: 'Cocogoose',
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             // TextButton(
//             //   onPressed: () {},
//             //   style: TextButton.styleFrom(
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(1.0),
//             //     ),
//             //   ),
//             //   child: Text(
//             //     'Notification Settings',
//             //     style: TextStyle(
//             //       fontFamily: 'TitiliumWeb',
//             //       fontSize: 20,
//             //       color: Colors.black,
//             //     ),
//             //   ),
//             // ),
//             // TextButton(
//             //   onPressed: () {},
//             //   style: TextButton.styleFrom(
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(1.0),
//             //     ),
//             //   ),
//             //   child: Text(
//             //     'Turn On Holiday Mode',
//             //     style: TextStyle(
//             //       fontFamily: 'TitiliumWeb',
//             //       fontSize: 20,
//             //       color: Colors.black,
//             //     ),
//             //   ),
//             // ),
//             // TextButton(
//             //   onPressed: () {},
//             //   style: TextButton.styleFrom(
//             //     shape: RoundedRectangleBorder(
//             //         borderRadius: BorderRadius.circular(1.0)),
//             //   ),
//             //   child: Text(
//             //     'Aplication Version Info',
//             //     style: TextStyle(
//             //       fontFamily: 'TitiliumWeb',
//             //       fontSize: 20,
//             //       color: Colors.black,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
