import 'package:todo_list/data/entity/note.dart';
import 'package:todo_list/sqlite/veritabani_yardimcisi.dart';

class NotesRepository{


  Future<void> addNote(String title, String content) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String,dynamic>();
    bilgiler["title"] = title;
    bilgiler["content"] = content;
    await db.insert("notes", bilgiler);

  }


  Future<List<Note>> getAllNotes() async{
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM notes");
  return List.generate(maps.length, (index){
    var note = maps[index];
    return Note(letter_id: note["letter_id"], title: note["title"], content: note["content"]);
  });

  }

  Future<void> updateNote(int letter_id, String title, String content) async{

    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["title"] = title;
    bilgiler["content"] = content;
    await db.update("notes", bilgiler,where: "letter_id = ?",whereArgs: [letter_id]);
  }
  Future<void> deleteNote(int letter_id) async{

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("notes",where: "letter_id = ?",whereArgs: [letter_id]);
  }

  Future<List<Note>> GetSearchByTitle(String veri) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT *  FROM notes WHERE title like '%$veri%' ");
    return List.generate(maps.length, (index){
      var note = maps[index];
      return Note(letter_id: note["letter_id"], title: note["title"], content: note["content"]);
    });

  }

}