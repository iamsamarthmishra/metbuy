import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metbuy/const/const.dart';
import 'package:metbuy/const/strings.dart';
import 'package:metbuy/controllers/profile_controller.dart';
import 'package:metbuy/views/widgets/custom_textfield.dart';
import 'package:metbuy/views/widgets/text_style.dart';

import '../../const/colors.dart';
import '../../const/image.dart';

class EditProfileScreen extends StatelessWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: boldText(text: editscreen, size: 16.0,color: darkGrey),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save, color: fontGrey))],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(imgProduct, width: 150).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: black),
                onPressed: () {}, child: normalText(text: changeImage, color: white),
              ),
              10.heightBox,
              const Divider(color: black),
              20.heightBox,
              customTextField(label: uname),
              20.heightBox,
              customTextField(label: password, hint: passHint),
              20.heightBox,
              customTextField(label: conpass, hint: passHint),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:metbuy/const/const.dart';
// import 'package:metbuy/const/strings.dart';
// import 'package:metbuy/controllers/profile_controller.dart';
// import 'package:metbuy/views/widgets/custom_textfield.dart';
// import 'package:metbuy/views/widgets/text_style.dart';
// import 'dart:io';
//
// import '../../const/colors.dart';
// import '../../const/const.dart';
// import '../../const/image.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   final String? username;
//
//   const EditProfileScreen({Key? key, this.username}) : super(key: key);
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final controller = Get.find<ProfileController>();
//
//   @override
//   void initState() {
//     controller.nameController.text = widget.username!;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         title: boldText(text: editscreen, size: 16.0, color: darkGrey),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: normalText(text: save, color: fontGrey),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             controller.snapshotData ['imageUrl'] == '' && controller.profileImgPath.isEmpty ? Image.asset(imgProduct, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
//                 :
//             controller.snapshotData['imageUrl'] != '' && controller.profileImgPath.isEmpty?
//
//             Image.network(
//               controller.snapshotData['imageUrl'],
//               width: 100,
//               fit: BoxFit.cover,
//             ).box.roundedFull.clip(Clip.antiAlias).make()
//                 :
//             Image.file(File(controller.profileImgPath.value),
//               width: 100,
//               fit: BoxFit.cover,
//             ).box.roundedFull.clip(Clip.antiAlias).make(),
//
//             //Image.asset(imgProduct, width: 150).box.roundedFull.clip(Clip.antiAlias).make(),
//             SizedBox(height: 10),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: black),
//               onPressed: () {
//                 controller.changeImage(context);
//               },
//               child: normalText(text: changeImage, color: white),
//             ),
//             const Divider(color: black),
//             SizedBox(height: 20),
//             customTextField(label: uname, hint: "Admin", controller: controller.nameController),
//             SizedBox(height: 20),
//             customTextField(label: password, hint: passHint, controller: controller.oldpassController),
//             SizedBox(height: 20),
//             customTextField(label: conpass, hint: passHint, controller: controller.newpassController),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
