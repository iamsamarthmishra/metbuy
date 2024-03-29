import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../services/store_services.dart';
import '../auth_screen/login_screen.dart';
import '../messages_screen/messages_screen.dart';
import '../shop_screen/shop_settings_screen.dart';
import '../widgets/loading.dart';
import '../widgets/text_style.dart';
import 'edit_profilescreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0, color: darkGrey),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => EditProfileScreen(
                  // username: controller.snapshotData['vendor_name'],
                  ));
            },
            icon: const Icon(Icons.edit),
          ),
          TextButton(
            onPressed: () async {
              await Get.find<AuthController>().signoutMethod(context);
              Get.offAll(() => const LoginScreen());
            },
            child: normalText(text: logout, color: fontGrey),
          )
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circleColor: black);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(currentUser!.uid),
              backgroundColor: Colors.red,
            ));
            // var data = snapshot.data!.docs[0];
            return Column(
              children: [
                ListTile(
                  leading: Image.asset(imgProduct)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  title: boldText(text: "${['name']}", color: darkGrey),
                  subtitle: normalText(text: "${['email']}", color: darkGrey),
                ),
                Divider(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                      profileButtonIcons.length,
                      (index) => ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(() => const ShopSettingsScreen());
                              break;
                            case 1:
                              Get.to(() => const MessagesScreen());
                              break;
                            default:
                          }
                        },
                        leading: Icon(profileButtonIcons[index]),
                        title: normalText(
                            text: profileButtonTitles[index], color: darkGrey),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
