import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/ui/cubit/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var tfTitle = TextEditingController();
  var tfContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note",style: TextStyle(fontWeight: FontWeight.bold),),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: tfTitle,decoration: InputDecoration(hintText: "Title"),),
            TextField(controller: tfContent,decoration: InputDecoration(hintText: "Content"),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Kayit
        context.read<RegisterCubit>().addNote(tfTitle.text, tfContent.text);
      },
      child: Icon(Icons.add_task),),
    );
  }
}
