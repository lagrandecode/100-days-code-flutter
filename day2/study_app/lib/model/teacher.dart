


import 'dart:ui';

class Teacher{
  String? name;
  String? time;
  Color color;
  String photo;
  Teacher(this.name, this.time, this.color, this.photo);

  static List<Teacher> generateTeacher(){
    return [Teacher("Comedy Show", "26 Apr, 6:30pm", Color(0xFFFFCF0FF),"images/img2.png"),
      Teacher("Thriller", "26 Apr, 6:30pm", Color(0xFFEAFFFA),"images/img3.png"),
      Teacher("Dance evening", "2 May, 5:40pm", Color(0xFFFAF7ED),"images/img4.png"),
      Teacher("Movie Show", "3 May, 1:30pm", Color(0xFFFCFFF),"images/img5.png")];
  }
}