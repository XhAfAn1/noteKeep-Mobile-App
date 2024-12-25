import 'package:flutter/material.dart';
import 'package:notekeep/views/single_note.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color: Color(0XFF676B70),
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
                  builder: (context)=> const create_note(),
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
                    IconButton(
                        color: const Color(0XFF676B70),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 25,
                        )),
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.view_agenda_outlined,
                          size: 25,
                        )),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/user.png'),
                      maxRadius: 18,
                    )
                  ],
                )
              ],
            ),
          ),
          const Center(child: Text("home"))
        ],
      ),
    );
  }
}
