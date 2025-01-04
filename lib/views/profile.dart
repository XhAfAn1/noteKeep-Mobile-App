import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notekeep/notes%20and%20datas/Userinfo.dart';
import 'package:notekeep/views/home_screen.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  File? image;
  bool hasImage = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        userInfo['profile'] = File(pickedImage.path);
        userInfo['hasPhoto'] = true;
        hasImage = true;
        image = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getImg();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const home_screen()));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                if (userInfo['hasPhoto']!=false)
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: image != null
                        ? Image.file(image!).image
                        : Image.asset('assets/defaultUser.jpg').image,
                  )
                else
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        Image.asset('assets/defaultUser.jpg').image,
                  ),
                TextButton(
                  onPressed: () {
                    getImage();
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.lightBlueAccent,
                    size: 35,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "USER NAME: ${userInfo['name']}",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
  Future<void> getImg() async {
    image = await userInfo['profile'];
    setState(() {}); // Ensure UI updates after the value is set.
  }
}
