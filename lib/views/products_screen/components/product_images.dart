import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/widgets/text_style.dart';

Widget productImages({required label, onPress, }) {
  return "$label".text.bold.color(fontGrey).size(16).makeCentered().box.color(white).size(100, 100).roundedSM.make();
}