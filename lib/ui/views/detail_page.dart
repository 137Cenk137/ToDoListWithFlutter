import 'package:flutter/material.dart';

import '../../data/entity/note.dart';

class DetailPage extends StatefulWidget {
  Note note;
  DetailPage({required this.note});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var tfTitle = TextEditingController();
  var tfContent = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tfTitle.text = widget.note.title;
    tfContent.text = widget.note.content;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(controller: tfTitle,decoration: InputDecoration(
                labelText: tfTitle.text.isEmpty ? "" : "${widget.note.title}"
          )),
            TextField(controller: tfContent,decoration: InputDecoration(
                labelText: tfContent.text.isEmpty ? "" : "${widget.note.content}"
            )),
            ElevatedButton(onPressed: (){
              //Update button
            }, child: const Text("Update"))

          ],
        ),
      ),
    );
  }
}
