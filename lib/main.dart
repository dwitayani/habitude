import 'package:flutter/material.dart';
import 'package:habitude_aplication/screens/tasklist/tasklist_screen.dart';
import 'screens/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'widgets/tasklist_widget.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen':(context) => SplashScreen(),
        '/tasklist':(context) => TasklistScreen(),
      },
    );
  }
}