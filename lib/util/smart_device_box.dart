import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final bool switchStatus;
  final IconData icons;
  final void Function(bool)? onChanged;

  const SmartDeviceBox(
      {super.key,
      required this.deviceName,
      required this.switchStatus,
      required this.icons,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: switchStatus ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  icons,
                  size: 50,
                  color: switchStatus ? Colors.white : Colors.black,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      deviceName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: switchStatus ? Colors.white : Colors.black,
                      ),
                    )),
                    Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                          value: switchStatus, onChanged: onChanged),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
