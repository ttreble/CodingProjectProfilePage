import 'package:edit_profile_project/user/UserPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../user/user.dart';
import 'TextFields/BuildTextFieldAbout.dart';
import 'TextFields/BuildTextFieldEmail.dart';
import 'TextFields/BuildTextFieldName.dart';
import 'TextFields/BuildTextFieldPhone.dart';
import 'edit_components/PhotoChange.dart';

class EditProfileUI extends StatefulWidget {
  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  static const backIcon = Icon(Icons.arrow_back_ios_new);
  static const editIcon = Icon(Icons.edit);
  final user = UserPref.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditProfileUI Route'),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        // leading: IconButton(
        //   color: Colors.black,
        //   icon: backIcon,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: const Text('Edit Profile',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Center(
                child: Stack(children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Theme.of(context).primaryColor,
                      ),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/1594837603639070721/zLHHb60N_400x400.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: -2,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: editIcon,
                        onPressed: () {
                          //change profile picture with one from gallery
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PhotoChange()),
                          );
                        },
                        color: Theme.of(context).primaryColor,
                        iconSize: 20,
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              buildTextFieldName('Name', '${user.firstName} ${user.lastName}', context),
              buildTextFieldPhone('Phone', PhoneFormatter(user.phone), context),
              buildTextFieldEmail('Email', user.email, context),
              buildTextFieldAbout('About', user.about, context),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //covert phone number to (xxx) xxx-xxxx format
  String PhoneFormatter(String phone) {
    return '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6, 10)}';
  }
}
