import 'package:flutter/material.dart';

import '../model/teacher.dart';

class TeacherInfo extends StatelessWidget {
  TeacherInfo({super.key});

  final List<Teacher> teach = Teacher.generateTeacher();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemCount: teach.length,
          itemBuilder: (BuildContext context, index) => Container(
            height: 60, // Adjusted container height to fit content
            decoration: BoxDecoration(
              color: teach[index].color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10), // Removes extra padding
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  teach[index].photo,
                  height: 60, // Reduce image height
                  width: 60,  // Reduce image width
                  fit: BoxFit.cover, // Ensure it fills the space
                ),
              ),
              title: Text(
                teach[index].name!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 8); // Reduce space between items
          },
        ),//
      ),
    );
  }
}

