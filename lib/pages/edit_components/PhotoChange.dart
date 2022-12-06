import 'package:edit_profile_project/pages/EditProfileUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../user/UserPref.dart';

class PhotoChange extends StatefulWidget {
  const PhotoChange({Key? key}) : super(key: key);

  @override
  State<PhotoChange> createState() => _PhotoChangeState();
}

class _PhotoChangeState extends State<PhotoChange> {

  @override
  Widget build(BuildContext context) {
    var user = UserPref.myUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhotoChangeRoute'),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          iconSize: 30,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //send back to EditProfileUI
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.only(top: 30, left: 40, right: 20),
            child: const Text(
              'Upload a photo of yourself:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //create black rectangular button that saves changes on bottom center of screen
          Container(
            margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.only(top: 15, bottom: 15),
              ),
              child: const Text(
                'Update',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
