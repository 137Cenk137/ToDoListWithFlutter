import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/entity/note.dart';
import 'package:todo_list/data/repo/notes_repo.dart';

class MainPageCubit extends Cubit<List<Note>>{


  MainPageCubit():super(<Note>[]);

  var nrepo = NotesRepository();
  Future<void> getAllNotes() async{

    var liste = await nrepo.getAllNotes();
    emit(liste);
    }
  Future<void> deleteNote(int letter_id) async{

    await nrepo.deleteNote(letter_id);

  }

  Future<void> GetSearchByTitle(String veri) async{
    var liste = await nrepo.GetSearchByTitle(veri);
    emit(liste);
  }


}