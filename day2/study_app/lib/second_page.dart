import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 60,left: 20,right: 20),
        child: Column(
          children: [
            _BuildAppBar("Erica Hawkins","6th grade"),
          ],
        ),
      ),
    );
  }
  Widget _BuildAppBar(String name, String grade){
    return Container(
      child: Row(
        children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/sam.png"),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
            
          ),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text(grade,style: TextStyle(fontSize: 15.0,color: Colors.black.withOpacity(0.5)),)
          ],
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
              borderRadius: BorderRadius.circular(10)
            
          ),
        )

        
      ],),
    );
  }
}
