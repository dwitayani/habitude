import 'package:flutter/material.dart';
import 'package:habitude_aplication/screens/mapping/mapping_screen.dart';
import 'screens/splashscreen/splash_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/form_tambah/formtambah_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/tasklist/tasklist_screen.dart';
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
      initialRoute: '/formTambahScreen',
      routes: {
        '/splashScreen':(context) => SplashScreen(),
        '/homeScreen':(context) => HomeScreen(),
        '/formTambahScreen':(context) => FormTambahScreen(),
        '/mappingScreen':(context) => MappingScreen(),
        '/taskListScreen':(context) => TasklistScreen(),

      },
    );
  }
}
