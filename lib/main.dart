import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? heading = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("Compass")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Compass Degree",
              style: TextStyle(
                  color: Color.fromARGB(255, 141, 0, 0),
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
          Text("${heading!.ceil()}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 50.00,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network("https://i.ibb.co/mD2WVDZ/cadrant.png"),
                Transform.rotate(
                  angle: ((heading ?? 0) * (pi / 180) * -1),
                  child: Image.network(
                    "https://i.ibb.co/JjXW9MV/compass.png",
                    scale: 1.2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
