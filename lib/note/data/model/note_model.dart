
// class Note{
//   final List<NoteModel> note;
//
//   Note({
//     required this.note,
//   });
//
//   factory Note.fromJson(Map<String, dynamic> json) {
//     return Note(
//       note: json['note'],
//     );
//   }
//
//   Note copyWith({
//     required List<NoteModel>data,
//   }) {
//     return Note(
//      note: data,
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//      'note':note,
//     };
//   }
//
//   static NoteModel empty() {
//     return NoteModel(
//       id: 0,
//       note: '',
//     );
//   }
// }




//
//
// class NoteModel {
//   final int id;
//   final String note;
//
//   NoteModel({
//     required this.id,
//     required this.note,
//   });
//
//   factory NoteModel.fromJson(Map<String, dynamic> json) {
//     return NoteModel(
//       id: json['id'],
//       note: json['note'],
//     );
//   }
//
//   NoteModel copyWith({
//     required int id,
//     required String not
//   }) {
//     return NoteModel(
//       id: id,
//       note: not,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'note': note,
//     };
//   }
//
//   static NoteModel empty() {
//     return NoteModel(
//       id: 0,
//       note: '',
//     );
//   }
// }
class NoteModel1 {
  int? id;
  final String title;

   final String note;
  final String work;
  final String personal;
  final String ideas;

  NoteModel1({
    this.id,
    required this.title,
     required this.note,
    required this.work,
    required this.personal,
    required this.ideas,

  });

  factory NoteModel1.fromJson(Map<String, dynamic> json) {
    return NoteModel1(
      id: json['id'],
      title: json['title'],
       note: json['note'],
      work: json['work'],
      personal: json['personal'],
      ideas: json['ideas'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
       "note": note,
      'work': work,
      'personal': personal,
      'ideas': ideas,


    };
  }
}

