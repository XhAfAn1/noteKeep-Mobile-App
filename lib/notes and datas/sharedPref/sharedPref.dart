import 'dart:convert';
import 'dart:io';

import 'package:notekeep/notes%20and%20datas/noteDatas.dart';
import 'package:notekeep/notes%20and%20datas/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Userinfo.dart';
const String KEYLOGIN ="login";
SharedPreferences? sp;
getInstance() async {
  sp=await SharedPreferences.getInstance();
  getUser();
}
loggedin() async {
  var sharedPref = await SharedPreferences.getInstance();
  sharedPref.setBool(KEYLOGIN, true);
}

saveUser() async {
sp?.setString('username', userInfo['name']);

  final bytes = await userInfo['profile'].readAsBytes();
  final base64String = base64Encode(bytes);
  sp?.setString('profiledp', base64String);
sp?.setBool('hasimg', userInfo['hasPhoto']);
}

Future<File?> getUser() async {
  var sharedPref = await SharedPreferences.getInstance();
  userInfo['name']= sharedPref.getString('username');

  final base64String = sharedPref.getString('profiledp');
  if (base64String != null) {
    final bytes = base64Decode(base64String);
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/profile_image.png');
    userInfo['profile']= file.writeAsBytes(bytes);
    userInfo['hasPhoto']= sharedPref.getBool('hasimg');
  }

  return null;

}

saveNotes() async{
List<String> notesString=  noteobj.map((note)=>jsonEncode(note.toJson())).toList();
sp?.setStringList('Allnotes', notesString);
}

readNotes() async{
  var sharedPref = await SharedPreferences.getInstance();
  List<String>? notesString= sharedPref.getStringList('Allnotes');
  if(notesString!=null){
    noteobj = notesString.map((notes) => note.fromJson(jsonDecode(notes))).toList();
  }
}