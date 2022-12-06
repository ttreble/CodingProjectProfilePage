import 'package:edit_profile_project/pages/EditProfileUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../user/UserPref.dart';

class NameChange extends StatefulWidget {
  const NameChange({Key? key}) : super(key: key);

  @override
  State<NameChange> createState() => _NameChangeState();
}

class _NameChangeState extends State<NameChange> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = UserPref.myUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('NameChangeRoute'),
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
              'What\'s your name?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                  child: Container(
                margin: const EdgeInsets.only(top: 20, left: 40, right: 20),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              )),
              Flexible(
                  child: Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 40),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              )),
            ],
          ),
          //create black rectangular button that saves changes on bottom center of screen
          Container(
            margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  user.firstName = firstNameController.text;
                  user.lastName = lastNameController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileUI()),
                  );
                });

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
