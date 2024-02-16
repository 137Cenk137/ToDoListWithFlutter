import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/entity/note.dart';
import 'package:todo_list/ui/cubit/detail_page_cubit.dart';
import 'package:todo_list/ui/cubit/main_page_cubit.dart';
import 'package:todo_list/ui/views/detail_page.dart';
import 'package:todo_list/ui/views/register_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainPageCubit>().getAllNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    body:BlocBuilder<MainPageCubit,List<Note>>(
      builder: (context,notes){
        if(notes.isNotEmpty){
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context,index){
                var note = notes[index];
                return GestureDetector(
                  onDoubleTap: (){
                    //detay page gecis
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailPage(note: note))).then((value) {
                      context.read<MainPageCubit>().getAllNotes();
                    });
                  },
                  onLongPress: (){
                    // delete veri
                    context.read<MainPageCubit>().deleteNote(note.letter_id).then((value) {
                      context.read<MainPageCubit>().getAllNotes();
                    });
                  },
                  child: Card(

                    child: Column(
                      children: [
                        Text("${note.title}",style: const TextStyle(fontWeight: FontWeight.bold),),
                        Text("${note.content}",maxLines: 2,)
                      ],
                    ),
                  ),
                );
            });
        }
        else{
          return const Center();
        }
      }
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())).then((value) {
            context.read<MainPageCubit>().getAllNotes();
          });
        } ,
        child: Icon(Icons.add),
      ),
    );
  }
}
