import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notekeep/views/single_note.dart';

bool singleGrid = false;
List<Map> notes = [
  {
    'title': 'note1',
    'description': 'This is depscription for note 1',
  },
  {
    'title': 'note2',
    'description': 'This is depscription for note 2',
  },
  {
    'title': 'note3',
    'description':
        'This is depscription for note 3\nThis is depscription for note 3\nThis is depscription for note 3',
  },
  {
    'title': 'note4',
    'description': '',
  },
];

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
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
                  builder: (context) => const create_note(),
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
                        onPressed: () {
                          setState(() {
                            singleGrid = !singleGrid;
                          });
                        },
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
          Expanded(
            child: MasonryGridView.builder(
                itemCount: notes.length,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: singleGrid ? 1 : 2,
                  //childAspectRatio: 0.9,
                  //crossAxisSpacing: 10,
                  // mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final data = notes[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    //   color: Colors.red,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.8)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['title'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(data['description'] ,
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.5))),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
