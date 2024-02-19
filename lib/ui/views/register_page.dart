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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: TextField(controller: tfTitle,decoration: const InputDecoration(hintText: "Title",border: InputBorder.none),),
              ),
              TextField(
                controller: tfContent,decoration:const  InputDecoration(hintText: "Content",border: InputBorder.none),
              maxLines: null,),

            ],
          ),
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
