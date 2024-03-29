import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/widgets/text_style.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
      child:  DropdownButton<String>(
        hint: normalText(text: "Choose Category", color: fontGrey),
        value: null,
        isExpanded: true,
        items: const [],
        onChanged: (value) {},
      ),
  ).box.white.padding(const EdgeInsets.symmetric(horizontal: 5)).roundedSM.make();
}