import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notekeep/MainWheretoGo.dart';
import 'package:notekeep/notes%20and%20datas/Userinfo.dart';
import 'package:notekeep/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notes and datas/sharedPref/sharedPref.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController name= TextEditingController(

  );
  void initState() {
    super.initState();
    getImg();
    if(userInfo['name']!=null)
    name.text=userInfo['name'];
  }

  File? image;
  bool hasImage = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
        userInfo['profile'] = image;
        userInfo['hasPhoto'] = true;
        hasImage = true;
        setImg();
        saveUser();
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
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
    )),
        centerTitle: true,
        actions: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent)),
            onPressed: () async{
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actionsPadding: EdgeInsets.all(10) ,
                    titlePadding:EdgeInsets.all(30) ,

                    backgroundColor: Colors.white,
                    title: Text("Reset Everything?",style: TextStyle(color: Colors.black),),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel",style: TextStyle(color: Colors.black),))
                      ,
                      TextButton(
                          onPressed: () async {
                            SharedPreferences sp= await SharedPreferences.getInstance();
                            resetAll();
                            sp.clear();
                            saveNotes();
                            setState(() {

                            });
                            saveNotes();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const mainlog()));
                          },
                          child: const Text("Confirm",style: TextStyle(color: Colors.black),))
                    ],
                  ));

            }, child: const Text("reset",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black),),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(
                  height: 100,
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                    "Profile Details",
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),
                  ),
                    Align(
                        child: IconButton(onPressed: (){
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                // actionsPadding: EdgeInsets.all(10) ,
                                // titlePadding:EdgeInsets.all(30) ,

                                backgroundColor: Colors.white,
                                title: Text("Edit Name",style: TextStyle(color: Colors.black),),
                                actions: [
                                  TextField(
                                    controller: name,
                                  ),
                                 SizedBox(
                                   height: 40,
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     TextButton(
                                         onPressed: () {
                                           Navigator.pop(context);
                                         },
                                         child: const Text("Cancel",style: TextStyle(color: Colors.black),))
                                     ,
                                     TextButton(
                                         onPressed: () async {
                                           userInfo['name']=name.text;
                                           saveUserName();
                                           setState(() {

                                           });
                                           Navigator.pop(context);
                                         },
                                         child: const Text("Confirm",style: TextStyle(color: Colors.black),))
                                   ],
                                 )
                                ],
                              ));

                        }, icon:Icon(Icons.edit,size: 20,))
                    ),],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "USER NAME: ",
                      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),
                    ),
                    Text(
                      "${userInfo['name']}",
                      style: const TextStyle(fontSize: 18),
                    ),

                  ],
                ),const SizedBox(
                  height: 50,
                ),


              ],
            ),
        ),
      ),

    );
  }
  Future<void> getImg() async {
    image = await userInfo['profile'];
    setState(() {}); // Ensure UI updates after the value is set.
  }
  setImg(){
    setState(() {
      userInfo['profile']=image;
    });
  }
}
