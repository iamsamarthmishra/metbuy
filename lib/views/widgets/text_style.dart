import 'package:flutter/material.dart';
import 'package:metbuy/const/const.dart'; // Import your constants file if necessary

Widget normalText({text, color = Colors.white, double size = 50.0}) {
  return "$text".text.color(color).make();
}

Widget boldText({text, color = Colors.white, double size = 50.0}) {
  return "$text".text.color(color).make();
}
