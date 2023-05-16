import List "mo:base/List";
import Debug "mo:base/Debug";


actor DKeeper {

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func creatNote(titleText: Text, contentText:Text) {

    let newNote: Note = {
      title = titleText;
      content = contentText;
    }; 

    notes := List.push(newNote, notes);
    Debug.print(debug_show("done"));
  };

  public query func readNotes(): async [Note]{
    return List.toArray(notes);
  };

  public func removeNote(id: Nat){
    var noteTake = List.take(notes,id);
    var notedrop = List.drop(notes,id+1);
    var noteAppend = List.append(noteTake,notedrop);
    notes := noteAppend;
    // Debug.print(debug_show(noteAppend));
  };




}