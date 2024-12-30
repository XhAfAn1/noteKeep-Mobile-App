
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';




class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}


class _profileState extends State<profile> {
PlatformFile? pickedFile;


Future SelectFile() async {

  final result = await FilePicker.platform.pickFiles();

  setState(() {
    pickedFile=result?.files.first;
  });

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Stack(alignment: Alignment.bottomRight,
             children: [if(pickedFile!=null)CircleAvatar(
        child: Image.file(File(pickedFile!.path!)),
      ) ,
               TextButton(
                 onPressed: (){
                  SelectFile;
               }, child: const Icon(Icons.add,color: Colors.amber,size: 35,),)
             ],
           ),

          const SizedBox(
            height: 50,
          ),
          const Text("USER NAME: XhAfAn",style: TextStyle(fontSize: 20),)
        ],),
      ),
    );
  }
}
