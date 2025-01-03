import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notekeep/notes%20and%20datas/noteDatas.dart';
import 'package:notekeep/views/profile.dart';
import 'package:notekeep/views/single_note.dart';

import '../notes and datas/Userinfo.dart';

bool singleGrid = false;
class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  @override
  void initState() {
    super.initState();
  }
   File? image;
  bool hasImage=false;
  @override

  Widget build(BuildContext context) {
    setState(() {
      if(userInfo['hasPhoto']==true) {
        image = userInfo['profile'];
        hasImage=true;
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          height: 80,
          shadowColor: Colors.black,
          elevation: 10,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.check_box_outlined,
                  size: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                  icon: const Icon(
                    Icons.brush_outlined,
                    color: Color(0XFF676B70),
                    size: 25,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(
                    Icons.mic_none_outlined,
                    color: Color(0XFF676B70),
                    size: 25,
                  ),
                  onPressed: () {}),
              IconButton(
                icon: const Icon(
                  Icons.image_outlined,
                  color: Color(0XFF676B70),
                  size: 25,
                ),
                onPressed: () {},
              ),
            ],
          )),
      drawer: Drawer(
        shape: const LinearBorder(),
        width: 350,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image.asset('assets/appstore.png'),
              title: const Text(
                'Note Keep',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              onTap: null,
            ),
            const Divider(
              height: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                  color: Color(0XFFE8F0FE),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: const ListTile(
                leading: Icon(
                  color: Color(0XFF3C88EC),
                  Icons.lightbulb_outline,
                  size: 23,
                ),
                title: Text(
                  'Notes',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0XFF3C88EC),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  color: Colors.black.withOpacity(0.75),
                  Icons.notifications_none_outlined,
                  size: 23,
                ),
                title: Text(
                  'Reminders',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            const Divider(
              height: 10,
              indent: 60,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(left: 17, top: 20, bottom: 20),
              child: Text(
                "LABELS",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.75),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  Icons.label_outline,
                  color: Colors.black.withOpacity(0.75),
                  size: 23,
                ),
                title: Text(
                  'Assignment',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  Icons.mode_edit_outline_outlined,
                  color: Colors.black.withOpacity(0.75),
                  size: 23,
                ),
                title: Text(
                  'Create/Edit labels',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            const Divider(
              height: 10,
              indent: 60,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  Icons.archive_outlined,
                  color: Colors.black.withOpacity(0.75),
                  size: 23,
                ),
                title: Text(
                  'Archive',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: Colors.black.withOpacity(0.75),
                  size: 23,
                ),
                title: Text(
                  'Bin',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            const Divider(
              height: 10,
              indent: 60,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black.withOpacity(0.75),
                  size: 23,
                ),
                title: Text(
                  'Setting',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  Icons.feedback_outlined,
                  color: Colors.black.withOpacity(0.75),
                  size: 23,
                ),
                title: Text(
                  'Send app feedback',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 15),
              child: ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.black.withOpacity(0.75),
                  size: 23,
                ),
                title: Text(
                  'Help',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FloatingActionButton(
            shape: const CircleBorder(),
            elevation: 5,
            backgroundColor: Colors.white,
            onPressed: () {},
            child: TextButton(
              onPressed: () {
                //  Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const create_note("","",-1),
                ));
              },
              child: Image.asset('assets/add_logo.PNG'),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding:
                const EdgeInsets.only(left: 13, right: 13, top: 2, bottom: 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0XFF676B70),
                            size: 25,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 170,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search your notes",
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        color: const Color(0XFF676B70),
                        onPressed: () {
                          setState(() {
                            singleGrid = !singleGrid;
                          });
                        },
                        icon: singleGrid
                            ? const Icon(
                                Icons.grid_view_outlined,
                                size: 25,
                              )
                            : const Icon(
                                Icons.view_agenda_outlined,
                                size: 25,
                              )),

                    if (userInfo['hasPhoto'])
                    InkWell(
                        onTap: (){
                          print("Hello");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const profile()
                          ));
                        },
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: Image.file(image!).image,
                        )
                    ) else InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const profile()
                        ));
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: Image.asset('assets/defaultUser.jpg').image,
                      )
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: (noteobj.isEmpty)
                ? Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      "No Notes",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0XFF676B70),
                      ),
                    ))
                : MasonryGridView.builder(
                    dragStartBehavior: DragStartBehavior.start,
                    crossAxisSpacing: 0,
                    padding: const EdgeInsets.all(5),
                    itemCount: noteobj.length,
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: singleGrid ? 1 : 2,
                    ),
                    itemBuilder: (context, index) {
                      final data = noteobj[index];
                      return InkWell(
                        onLongPress: (){
                          showDialog(context: context, builder: (context)=>AlertDialog(
                            actions: [
                              const Text("Delete this note?"),
                              TextButton(onPressed: (){
                                setState(() {
                                  noteobj.removeAt(index);
                                });
                                Navigator.pop(context);

                              }, child: const Text("Delete"))
                            ],
                          ));

                        },
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => create_note(data.title,data.description,index),
                          ));
                        },
                        child: Container(
                          //height: ,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          //   color: Colors.red,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.1, color: Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.title != null
                                  ? Text(
                                      data.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.7)),
                                    )
                                  : const SizedBox(
                                      height: 5,
                                    ),
                              data.description != null
                                  ? const SizedBox(
                                      height: 10,
                                    )
                                  : const SizedBox(),
                              data.description != null
                                  ? Text(data.description,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.5)),
                              maxLines: 8,overflow: TextOverflow.ellipsis,
                              )
                                  : const SizedBox(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
