import 'package:metbuy/views/widgets/custom_textfield.dart';

import '../../const/const.dart';
import '../widgets/text_style.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fontGrey,
      appBar: AppBar(
        title: boldText(text: shops, size: 16.0,color: darkGrey),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save, color: fontGrey))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            10.heightBox,
            customTextField(
              label: shops, hint: nameHint,
            ),
            5.heightBox,
            customTextField(
              label: address, hint: shopAddressHint,
            ),
            5.heightBox,
            customTextField(
              label: mobile, hint: shopMobileHint,
            ),
            5.heightBox,
            customTextField(
              isDesc: true,
              label: description, hint: shopDescHint,
            ),
          ],
        ),
      ),
    );
  }
}
