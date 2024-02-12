import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/entity/note.dart';
import 'package:todo_list/ui/cubit/main_page_cubit.dart';
import 'package:todo_list/ui/views/register_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                  },
                  onLongPress: (){
                    // delete veri
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
            print("Anasayfaya dönüldü");
          });
        } ,
        child: Icon(Icons.add),
      ),
    );
  }
}
