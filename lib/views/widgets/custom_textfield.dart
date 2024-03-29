import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/widgets/text_style.dart';

Widget customTextField({label, hint, controller, isDesc = false}){
  return TextFormField(
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
      isDense: true,
      label: normalText(text: label),
      enabledBorder:
       OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: black,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: black,
          )),
      hintText: hint,
      hintStyle: const TextStyle(color: darkGrey),
    ),
  );
}