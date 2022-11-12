import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/util/smart_device_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double horizontalPadding = 20;
  final double verticalPadding = 20;
  final double universalPadding = 20;
  final double spacer = 20;

  List mySmartDevices = [
    // [deviceName, icon, powerStatus];
    ["Smart Light", FontAwesomeIcons.lightbulb, true],
    ["Smart AC", FontAwesomeIcons.airbnb, true],
    ["Smart TV", FontAwesomeIcons.television, true],
    ["Smart Fan", FontAwesomeIcons.fan, true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(universalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.list,
                  ),
                  FaIcon(
                    FontAwesomeIcons.user,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: horizontalPadding,
            ),
            Padding(
              padding: EdgeInsets.all(universalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back", style: TextStyle(fontSize: 20, color: Colors.grey[700]),),
                  Text(
                    "Sushant Patil",
                    style: GoogleFonts.bebasNeue(fontSize: 50),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,

              ),
            ),
            Padding(
              padding: EdgeInsets.all(universalPadding),
              child: Text("Smart Devices", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.grey[800]),),
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      deviceName: mySmartDevices[index][0],
                      switchStatus: mySmartDevices[index][2],
                      icons: mySmartDevices[index][1],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  }),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }
}
