class Task{

  String title;
  bool complete;

  Task ( this.title, this.complete);

}

// class Task{
//
//   final int? id;
//   final String title;
//   final bool? complete;
//
//   const Task ({this.complete, required this.title, this.id});
//
//   factory Task.fromJson(Map<String,dynamic> json) => Task(
//     id: json['id'],
//     title: json['title'],
//     complete: json['complete'],
//
//   );
//
//   Map<String,dynamic> toJson() => {
//     'id': id,
//     'title': title,
//   };
//
// }