import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // TO UPLOAD IMAGE TO FIREBASE STORAGE
  Future<String?> uploadImage(String path, BuildContext context) async {
    ScaffoldMessenger.of(context)
    .showSnackBar(const SnackBar(content: Text("Uploding image...")));
    print("Uploading image...");
    File file = File(path);
    try{
      //Create a unique file name based on the current time
      String fileName = DateTime.now().toString();

      //Create a reference to Firebase Storage
      Reference ref = _storage.ref().child("images/$fileName");

      //Upload the file
      UploadTask uploadTask = ref.putFile(file);

      //wait for the upload to complete
      await uploadTask;

      //Get the download URL
      String downloadURL = await ref.getDownloadURL();
      print("Download URL: $downloadURL");
      return downloadURL;
    } catch (e) {
      print("There was an error");
      print(e);

      return null;
    }
  }
}