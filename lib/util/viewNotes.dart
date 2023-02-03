import 'package:flutter/material.dart';
import 'package:notes/data/database.dart';

import '../notelist.dart';

class ViewNotes extends StatelessWidget {
  final titl;
  final descp;
  Function()? delete;

  ViewNotes({super.key, required this.titl, required this.descp,required this.delete});

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
                    onPressed: delete,
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 252, 252, 252)),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 243, 27, 31)),
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
              "So Thats What you Wrote",
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
              child: Column(
                children: [
                  SizedBox(
                    width: 320,
                    child: Text(
                      titl,
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
                    child: Text(
                      descp,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
    ;
  }
}
