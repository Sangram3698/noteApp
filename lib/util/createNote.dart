import 'package:flutter/material.dart';
import 'package:notes/notelist.dart';

class Noting extends StatelessWidget {
  final titleCont;
  final descCont;
  VoidCallback save;

  Noting(
      {super.key,
      required this.titleCont,
      required this.descCont,
      required this.save});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(242, 232, 229, 44),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Notelist()));
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 3, 57, 220)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: save,
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 5, 64, 229)),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 8, 234, 34)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              "Let your Words remember the world",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            )),

            SizedBox(
              height: 30,
            ),
            //to Add notes

            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Form(
                  child: Column(
                children: [
                  SizedBox(
                    width: 320,
                    child: TextField(
                      controller: titleCont,
                      decoration: InputDecoration(
                          focusColor: null,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(width: 3, color: Colors.black38)),
                          filled: true,
                          fillColor: Color.fromARGB(255, 116, 245, 241),
                          hintText: 'Add Title',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      style: TextStyle(
                          fontSize: 22.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 320,
                    child: TextField(
                      controller: descCont,
                      decoration: InputDecoration(
                        focusColor: null,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        hintText: 'Description',
                        fillColor: Color.fromARGB(255, 104, 238, 251),
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      minLines: 1,
                      maxLines: 15,
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    ));
  }
}
