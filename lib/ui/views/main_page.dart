import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/entity/note.dart';


import 'package:todo_list/ui/cubit/main_page_cubit.dart';
import 'package:todo_list/ui/views/detail_page.dart';
import 'package:todo_list/ui/views/register_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  bool aramaYapiliyormu = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainPageCubit>().getAllNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        actions: [
          aramaYapiliyormu ? IconButton(onPressed: (){
            setState(() {
              aramaYapiliyormu = false;
            });
          }, icon: Icon(Icons.search)):
              IconButton(onPressed: (){
                setState(() {
                  aramaYapiliyormu = true;
                });
              }, icon: Icon(Icons.cancel))
        ],
        title: aramaYapiliyormu ? const Text("Notes",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),) :
            TextField(decoration: InputDecoration(hintText: "Ara"),onChanged: (sonuc){
                // arama sonu
              context.read<MainPageCubit>().GetSearchByTitle(sonuc);
            },)
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0,left: 12.0,top: 4),
                    child: Card(
                      color: Colors.white.withOpacity(0.75),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("${note.title}",style: const TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("${note.content}",maxLines: 2,),
                          )
                        ],
                      ),
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
