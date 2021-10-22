import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screen/Camerascreen.dart';
import 'package:whatsapp_clone/screen/homescreen.dart';

 Future <void> main()
    async{
  WidgetsFlutterBinding.ensureInitialized();
  Cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( fontFamily: "OpenSans",
          primaryColor: const Color(0xFF075E54), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF128C7E))
    ),
      home: const Homescreen(),
    );
  }
}