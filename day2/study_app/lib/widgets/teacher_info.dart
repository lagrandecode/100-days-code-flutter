

import 'package:flutter/material.dart';

import '../model/teacher.dart';

class TeacherInfo extends StatelessWidget {
  TeacherInfo({super.key});

  final List<Teacher> teach = Teacher.generateTeacher();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        itemCount: teach.length,
          itemBuilder: (BuildContext context, index)=>Container(
            height: 100,
            decoration: BoxDecoration(
              color: teach[index].color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(teach[index].name!),
            ),
          ), separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10,);
      },),
    );
  }
}
