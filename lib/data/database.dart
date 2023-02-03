import 'package:hive_flutter/hive_flutter.dart';

class NoteDb {
  List notesList = [];
  //refrence box
  final _myBox = Hive.box('mybox');

  //this runs when it is the first time using the noteapp
  void createInitialData() {
    notesList = [
      ["My first Note", "The journey ahead will be fun"]
    ];
  }

  //load the data from database
  void loadData() {
    notesList = _myBox.get("NOTELIST");
  }

  //update the database
  void updateData() {
    _myBox.put("NOTELIST", notesList);
  }

  //delete any data
  
}
