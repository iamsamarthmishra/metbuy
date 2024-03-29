import 'package:flutter/material.dart';
import 'package:metbuy/const/colors.dart';
import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/products_screen/components/product_dropdown.dart';
import 'package:metbuy/views/products_screen/components/product_images.dart';
import 'package:metbuy/views/widgets/custom_textfield.dart';
import 'package:metbuy/views/widgets/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        title: boldText(text: "Add Product", color: fontGrey, size: 16.0),
        actions: [TextButton(onPressed: (){}, child: boldText(text: save, color: black))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              customTextField(hint: "eg. Nike", label: "Product Name"),
              10.heightBox,
              customTextField(hint: "eg. Nike Product", label: "Description", isDesc: true),
              10.heightBox,
              customTextField(hint: "eg. \$100", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. 20", label: "Quantity"),
              15.heightBox,
              productDropdown(),
              15.heightBox,
              productDropdown(),
              15.heightBox,
              normalText(text: "Choose product images"),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: List.generate(3, (index) => productImages(label: "${index + 1}"),
               ),
              ),
              10.heightBox,
              normalText(text: "First image will be your display image"),
            ],
          ),
        ),
      ),
    );
  }
}
