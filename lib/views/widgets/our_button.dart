import 'package:flutter/material.dart'; // Changed import to Material library
import 'package:metbuy/const/colors.dart';
import 'package:metbuy/views/widgets/text_style.dart';

Widget ourButton({title, color = black, onPress}) { // Added explicit types
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color, // Set the primary color
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: boldText(text: title ?? '', size: 16.0), // Added null check for title
  );
}
