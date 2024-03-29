import 'package:flutter/cupertino.dart';
import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/widgets/text_style.dart';

import '../../const/colors.dart';
import '../../const/image.dart';
import '../../const/strings.dart';

Widget dashboardButton( context, {title, count, icon}) {
  var size = MediaQuery.of(context).size;
  return Row(
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            normalText(text: title, size: 16, color: white), // Apply fontGrey color here
            normalText(text: count, size: 20, color: white), // Apply fontGrey color here
          ],
        ),
      ),
      Image.asset(icon, width: 40, color: Colors.white),
    ],
  ).box.color(fontGrey).rounded.size(size.width * 0.4, 80).padding(
    const EdgeInsets.all(8),
  ).make();
}
