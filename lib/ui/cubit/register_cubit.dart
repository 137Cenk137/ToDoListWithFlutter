import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/repo/notes_repo.dart';

class RegisterCubit extends Cubit<void>{

  RegisterCubit():super(0);
  var nrepo = NotesRepository();
  Future<void> addNote(String title,String content) async{
    await nrepo.addNote(title, content);
  }


}