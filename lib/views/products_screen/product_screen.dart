import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/products_screen/add_product.dart';
import 'package:metbuy/views/products_screen/product_details.dart';

import '../widgets/dashboard_button.dart';
import '../widgets/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen ({super.key});

  get intl => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=> const AddProduct());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back arrow
        title: normalText(text: products, color: fontGrey, size: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
                  (index) => Card(
                child: ListTile(
                  onTap: () {
                    Get.to(()=> const ProductDetails());
                  },
                  leading: Image.asset(imgProduct, width: 100, height: 100, fit: BoxFit.cover),
                  title: boldText(text: "Product title", color: fontGrey),
                  subtitle: normalText(text: "\$40.0", color: fontGrey),
                  trailing: VxPopupMenu(
                    arrowSize: 0.0,
                    child: Icon(Icons.more_vert_rounded), menuBuilder: ()=>Column(
                    children: List.generate(
                        popupMenuTitles.length,
                            (index) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(popupmenuIcons[index]),
                              10.widthBox,
                              normalText(text: popupMenuTitles[index], color: darkGrey)
                            ],
                          ).onTap(() {

                          }),
                        )
                    ),
                  ).box.white.rounded.width(200).make(),
                    clickType: VxClickType.singleClick,
                    //child: const Icon(Icons.more_vert_rounded)
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
