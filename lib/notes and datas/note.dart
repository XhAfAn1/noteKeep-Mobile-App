

import 'dart:convert';

class note{
  final title;
  final description;
  final date;
  note({this.date,this.title, this.description});


  factory note.fromRawJson(String str) => note.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory note.fromJson(Map<String, dynamic> json) => note(
    title: json["title"],
    description: json["description"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "date": date,
  };
}
