import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/entity/note.dart';
import 'package:todo_list/data/repo/notes_repo.dart';

class DetailPageCubit extends Cubit<void>{

  DetailPageCubit():super(0);

  var nrepo = NotesRepository();
  Future<void> updateNote(int letter_id, String title, String content) async{
    await nrepo.updateNote(letter_id, title, content);
  }
}