import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/ui/cubit/detail_page_cubit.dart';

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
            Container(width: 200,height: 400,
              child: TextField(controller: tfContent,
                  maxLines: 10,
                  decoration: InputDecoration(
                  labelText: tfContent.text.isEmpty ? "" : "${widget.note.content}"
              )),
            ),
            ElevatedButton(onPressed: (){
              //Update button
              context.read<DetailPageCubit>().updateNote(widget.note.letter_id, tfTitle.text, tfContent.text);

            }, child: const Text("Update"))

          ],
        ),
      ),
    );
  }
}
