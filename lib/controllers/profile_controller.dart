import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../const/const.dart';
import '../const/firebase_const.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {

  QueryDocumentSnapshot? snapshotData;

  var profileImgPath = ''.obs;

  var profileImageLink = '';

  var isloading = false.obs;

  //textfield
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();

  changeImage(context) async {
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null ) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImgPath.value);
    var destination = 'image/${currentUser!.uid}/$filename';
    Reference ref =FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imgUrl}) async {
    var store = firestore.collection(vendorsCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imgUrl
    }, SetOptions(merge: true));
    isloading(false);
  }

  changeAuthPassword({email, password, newpassword})async{
    final cred = EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newpassword);
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
