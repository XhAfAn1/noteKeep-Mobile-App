import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notekeep/main.dart';
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
      }
      else
        print("No Image");
    });

  }
  @override
  Widget build(BuildContext context) {
    PageController pages =PageController(initialPage: 0);
    TextEditingController userName=TextEditingController();


    return Scaffold(
      body: Container(
        child: PageView(
          controller: pages,
          children: [
            Container(
                padding: EdgeInsets.all(20),
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: (){
                      pages.nextPage(duration: Duration(microseconds: 250), curve:Curves.bounceIn);
                    }, child: Text("Continue"),),
                ),

                  SizedBox(height: 50,)
                ],
              )
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 50,),
                    Container(
                      child: Column(
                        children: [
                        Stack(alignment: Alignment.bottomRight,
                        children: [
                          if(image!=null)CircleAvatar(
                            radius: 80,
                            backgroundImage: Image.file(image!).image,
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
                      ),SizedBox(height: 50,),
                          TextField(

                            decoration: const InputDecoration(
                              hintText:"Enter User name",
                              hintStyle: TextStyle(fontSize: 20,color: Colors.white),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            ),
                            controller: userName,
                          )
                        ],
                      ),
                    )
                    ,
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: (){
                              uerInfo['name']=userName.text;
                              uerInfo['profile']=image;
                              pages.nextPage(duration: Duration(microseconds: 250), curve:Curves.bounceIn);
                            }, child: Text("Continue"),),
                        ),

                        SizedBox(height: 50,)
                      ],
                    )
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>home_screen()));
                      }, child: Text("Get Started"),),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
