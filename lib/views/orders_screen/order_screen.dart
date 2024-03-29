import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/orders_screen/components/order_placed.dart';
import 'package:metbuy/views/orders_screen/order_details.dart';

import '../widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      automaticallyImplyLeading: false, // Disable the back arrow
      title: normalText(text: orders, color: fontGrey, size: 16)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
                  (index) => ListTile(
                onTap: () {
                  Get.to(() => OrderDetails());
                },
                tileColor: textfieldGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                title: boldText(text: "16464131646", color: darkGrey),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: fontGrey,),
                        10.widthBox,
                        normalText(text: intl.DateFormat().add_yMd().format(DateTime.now()), color: darkGrey),

                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.payment, color: fontGrey,),
                        10.widthBox,
                        boldText(text: unpaid, color: red),

                      ],
                    )
                  ],
                ),
                    trailing: boldText(text: "\$40",color: purpleColor, size: 16),
              ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
            ),
          ),
        ),
      ),
    );

  }
}
