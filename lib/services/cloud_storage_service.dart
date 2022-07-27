//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

const String USER_COLLECTION = "Users";

class CloudStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CloudStorageService() {}

  Future<String?> saveUserImageToStorage(
      String _uid, String _file) async {
    try {
      Reference ref =
          _storage.ref().child('images/users/$_uid/profile.txt');

      // ignore: unused_local_variable
      UploadTask _task = ref.putString(_file);

      return _file;


      //return await _task.then(
       // (_result) => _result.ref.getDownloadURL(),
      //);


    } catch (e) {
      print(e);
    }
  }

  





  Future<String?> saveChatImageToStorage(
      String _chatID, String _userId, PlatformFile _file) async {
    try {
      Reference _ref = _storage.ref().child(
          'images/chats/$_chatID/${_userId}_${Timestamp.now().microsecondsSinceEpoch}.${_file.extension}');

          UploadTask _task = _ref.putFile(File(_file.path.toString()));

           return await _task.then(
        (_result) => _result.ref.getDownloadURL(),
      );



    } catch (e) {
      print(e);
    }
  }
}
