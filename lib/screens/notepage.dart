
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  NotePageState createState() => NotePageState();
}





class NotePageState extends State<NotePage> {
  TextEditingController noteTextEditingController = TextEditingController();
  List<String> enteredTexts = [];

  void addText(String newText) {
    setState(() {
      if (newText.length >= 5)
      {
      enteredTexts.insert(0, newText);

      noteTextEditingController.clear();
      }
    });
  }

  void removeText(int index) {
    setState(() {
      enteredTexts.removeAt(index);
    });
  }

  void markText(int index) {
    setState(() {
      if (enteredTexts[index].endsWith("    ✓")) {
        enteredTexts[index] = enteredTexts[index].substring(0, enteredTexts[index].length - 5);
      } else {
        enteredTexts[index] = "${enteredTexts[index]}    ✓";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SafeArea(
              child: TextField(
                controller: noteTextEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type a note, min 5 characters",
                ),
                maxLength: 999,
                onSubmitted: (text) {
                  addText(noteTextEditingController.text);
                },
              ),
            ),
            for (var i = 0; i < enteredTexts.length; i++)
            GestureDetector(
              onLongPress: () {
                removeText(i);
              },
              onDoubleTap: () {
                markText(i);
              },
              child: Padding(padding: const EdgeInsets.all(10),
              child: Text(enteredTexts[i],
              style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ),
            ),
          ],
        ),
      ),
     ),
    );
  }
}