import 'package:edit_profile_project/pages/EditProfileUI.dart';
import 'package:edit_profile_project/pages/edit_components/NameChange.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edit Profile Project',
      theme: ThemeData(
        //change battery icon color
        primarySwatch: Colors.blue,
        fontFamily: 'Assistant'
      ),
      home: EditProfileUI(),
      // home: NameChange(),
    );
  }
}

