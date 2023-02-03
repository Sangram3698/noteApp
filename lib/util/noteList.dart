import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesLists extends StatelessWidget {
  final String noteTitle;
  final String noteDescrip;
  DateTime dateTime;
  NotesLists(
      {super.key,
      required this.noteTitle,
      required this.noteDescrip,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: SingleChildScrollView(
        child: Container(
          height: 145,
          width: double.infinity,
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 224, 127),
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                noteTitle,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 13,),
              Text(
                noteDescrip,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat.yMMMd().add_jm().format(dateTime),
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
