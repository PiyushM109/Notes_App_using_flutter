import 'package:flutter/material.dart';

import '../data/hive_database.dart';
import 'note.dart';

class NoteData extends ChangeNotifier{

  final db = HiveDatabase();
  //for overall list of Notes
  List<Note> allNotes = [
    
  ];

  void initializeNotes(){
    allNotes = db.loadNotes();

  }

  //to get Notes
  List<Note> getAllNotes(){
    return allNotes;
  }

  //to add new Note
  void addNewNote(Note note){
    allNotes.add(note);
    notifyListeners();
  }

  //to update note
  void updateNote(Note note, String text){
    for(int i=0; i<allNotes.length; i++){
      if(allNotes[i].id==note.id){
        allNotes[i].text = text;
      }
    }
    notifyListeners();

  }

  void deleteNote(Note note){
    allNotes.remove(note);
    notifyListeners();

  }


}