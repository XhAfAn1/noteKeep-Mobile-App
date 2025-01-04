import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notekeep/notes%20and%20datas/sharedPref/sharedPref.dart';
import 'package:notekeep/views/home_screen.dart';
import 'package:notekeep/notes and datas/Userinfo.dart';
class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  File? image;
  final picker = ImagePicker();

  Future getImage() async {

    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(pickedImage !=null){
        image=File(pickedImage.path);
        userInfo['profile']=image;
        userInfo['hasPhoto']=true;

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    PageController pages =PageController(initialPage: 0);
    TextEditingController userName=TextEditingController();


    return Scaffold(
      backgroundColor: Colors.white,
      body:  PageView(
          controller: pages,
          children: [
            Container(
                padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 50,),
                  const Text("This is just a basic notepad app.\nFeatures:\n1.Create note\n2.Setup Profile\n3.long press delete note\n\n\nwill design this onboarding screen later",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 50,),
                 Column(
                   children: [
                     SizedBox(
                       width: double.infinity,
                       height: 60,
                       child: ElevatedButton(
                         style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent)),
                         onPressed: (){
                           pages.nextPage(duration: const Duration(microseconds: 800), curve:Curves.easeIn);
                         }, child: const Text("Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),),
                     ),

                     const SizedBox(height: 50,)
                   ],
                 )
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 50,),
                    const Text("Set up Profile",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),),

                    Column(
                      children: [
                      Stack(alignment: Alignment.bottomRight,
                      children: [
                        if(image!=null)CircleAvatar(
                          radius: 80,
                          backgroundImage: Image.file(userInfo['profile']! as File).image,
                        )
                        else CircleAvatar(
                          radius: 80,
                          backgroundImage: Image.asset('assets/defaultUser.jpg').image,
                        )
                        ,
                        TextButton(
                          onPressed: (){
                            getImage();
                          }, child: const Icon(Icons.camera_alt,color: Colors.lightBlueAccent,size: 35,),)
                      ],
                    ),const SizedBox(height: 50,),
                        TextField(
                          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),
                          decoration: const InputDecoration(
                            hintText:"Enter User name",
                            hintStyle: TextStyle(fontSize: 20,color: Colors.white),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                          ),
                          controller: userName,
                        )
                      ],
                    )
                    ,const SizedBox(height: 50,),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent)),
                            onPressed: (){
                              userInfo['name']=userName.text;
                              userInfo['profile']=image;
                              if(image!=null){
                                userInfo['hasPhoto']=true;
                              }


                              pages.nextPage(duration: const Duration(microseconds: 250), curve:Curves.bounceIn);
                            }, child: const Text("Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),),
                        ),

                        const SizedBox(height: 50,)
                      ],
                    )
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 50,),
                  const Text("Welcome!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent)),
                          onPressed: (){
                            loggedin();
                            saveUser();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const home_screen()));
                          }, child: const Text("Get Started",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),),
                      ),
                      const SizedBox(height: 50,)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),

    );
  }
}
