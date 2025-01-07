import 'package:flutter/material.dart';
import 'package:notekeep/notes%20and%20datas/note.dart';
import 'package:notekeep/notes%20and%20datas/noteDatas.dart';
import 'package:notekeep/views/home_screen.dart';

class create_note extends StatefulWidget {
  final titleName;
  final descriptionData;
  final index;
  final Edate;

  create_note(this.titleName, this.descriptionData,this.index,this.Edate,{super.key, });

  @override
  State<create_note> createState() => _create_noteState();
}

class _create_noteState extends State<create_note> {
  TextEditingController title= TextEditingController(

  );

  TextEditingController noteData= TextEditingController(

  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title.text=widget.titleName;
    noteData.text=widget.descriptionData;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final isKeyboard =MediaQuery.of(context).viewInsets.bottom !=0;
    int h1=(height/150).toInt();
    int h2=(height/70).toInt();


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {

            if(widget.index!=-1) noteobj.removeAt(widget.index);
            noteobj.add(note(title: title.text,description: noteData.text,date: DateTime.now()));

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const home_screen(),
            ));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
          padding: const EdgeInsets.only(left: 10),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.pin_drop_outlined,
              size: 30,
              color: Color(0XFF676B70),

            ),

          ),const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_alert_outlined,
              size: 30,
              color: Color(0XFF676B70),
            ),

          ),const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.archive_outlined,
              size: 30,
              color: Color(0XFF676B70),
            ),

          ),
          const SizedBox(
            width: 20,
          ),

        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20,top: 20),
                child: TextField(
                  controller: title,
                  minLines: 1,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    // color: Colors.grey,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: noteData,

                  maxLines: isKeyboard ? h1 :h2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    // color: Colors.grey,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),



          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_box_outlined,
                          size: 27,
                          color: Color(0XFF676B70),

                        ),

                      ),const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.color_lens_outlined,
                          size: 27,
                          color: Color(0XFF676B70),
                        ),

                      )
                    ],
                  ),
                   Text("Edited: ${widget.Edate.hour}:${widget.Edate.minute}",style: const TextStyle(color: Color(0XFF676B70),fontSize: 12),),
                  const SizedBox(
                    width: 10,
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          size: 27,
                          color: Color(0XFF676B70),
                        ),

                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )



                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
          )


        ],
      ),
    );
  }
}
