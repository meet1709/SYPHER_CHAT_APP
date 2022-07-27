

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ChatUser
{

    final String uid;
    final String name;
    final String email;
    final String imageURl;
    late DateTime lastActive;

    ChatUser(
{

    required this.uid,
    required this.name,
    required this.email,
    required this.imageURl,
    required this.lastActive

});

  factory ChatUser.fromJSON(Map<String,dynamic> _json)
  {

      return ChatUser(uid: _json["uid"], name: _json["name"], email: _json["email"], imageURl: _json["image"], lastActive: _json["last_active"].toDate(),);

  }

  Map<String , dynamic> toMap()
  {
    return {

      "email" :email,
      "name" :name,
      "last_active" : lastActive,
      "image" : imageURl,
    };
  }

  String lastDayActive()
  {
      return "${lastActive.month}/${lastActive.day}/${lastActive.year}";


  }

  bool wasrecentlyActive()
  {
  

    //print(lastActive);

     return DateTime.now().difference(lastActive).inMinutes < 10;
   // return  true;

   
     

  }





}