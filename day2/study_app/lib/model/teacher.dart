


import 'dart:ui';

class Teacher{
  String? name;
  String? time;
  Color color;

  Teacher(this.name, this.time, this.color);

  static List<Teacher> generateTeacher(){
    return [Teacher("Comedy Show", "26 Apr, 6:30pm", Color(0xFFFFCF0FF)),
      Teacher("Thriller", "26 Apr, 6:30pm", Color(0xFFEAFFFA)),
      Teacher("Dance evening", "2 May, 5:40pm", Color(0xFFFAF7ED)),
      Teacher("Movie Show", "3 May, 1:30pm", Color(0xFFFCFFF))];
  }
}