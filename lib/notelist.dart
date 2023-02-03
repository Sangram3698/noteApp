import 'package:flutter/material.dart';
import 'package:notes/data/database.dart';
import 'package:notes/util/createNote.dart';
import 'package:notes/util/noteList.dart';
import 'package:notes/util/viewNotes.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Notelist extends StatefulWidget {
  const Notelist({super.key});

  @override
  State<Notelist> createState() => _NotelistState();
}

class _NotelistState extends State<Notelist> {
  //text controller
  final _titlecont = TextEditingController();
  final _descont = TextEditingController();
  late DateTime myTime;

  //reference hive box
  final _mybox = Hive.box('mybox');

  //creating instance of DB to access noteList
  NoteDb db = NoteDb();

  @override
  void initState() {
    //if it is first time opening the app

    if (_mybox.get("NOTELIST") == null) {
      db.createInitialData();
    } else {
      //there already exist few datas
      db.loadData();
    }
    super.initState();
  }

  void onSave() {
    setState(() {
      db.notesList.add([_titlecont.text, _descont.text]);
      _titlecont.clear();
      _descont.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteData(int index) {
    setState(() {
      db.notesList.removeAt(index);
      print("deleted");
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 0, 52, 2),
        elevation: 0,
        title: Center(
          child: Text(
            "Q U A N T A || N O T E S",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.notesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewNotes(
                          titl: db.notesList[index][0],
                          descp: db.notesList[index][1],
                          delete: () => deleteData(index),
                        )),
              );
            },
            child: NotesLists(
              noteTitle: db.notesList[index][0],
              noteDescrip: db.notesList[index][1],
              dateTime: DateTime.now(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Noting(
                        titleCont: _titlecont,
                        descCont: _descont,
                        save: onSave,
                      )));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
