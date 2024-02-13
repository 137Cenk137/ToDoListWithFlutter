import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/entity/note.dart';

class MainPageCubit extends Cubit<List<Note>>{


  MainPageCubit():super(<Note>[]);

  Future<void> getAllNotes() async{

  }


}