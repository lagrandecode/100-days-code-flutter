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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BuildAppBar("Sam Altman","6th grade"),
            SizedBox(height: 25.0,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withBlue(220).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  children: [
                    Icon(Icons.search,size: 30,color: Colors.black.withOpacity(0.5),),
                    SizedBox(width: 10,),
                    Text("Search",style: TextStyle(fontSize: 18.0,color: Colors.black.withOpacity(0.5)),),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            _buildSection("Next class"),
          ],
        ),
      ),
    );
  }
  Widget _BuildAppBar(String name, String grade){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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



        ],),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.2),width: 1.0),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)

          ),
          child: Icon(Icons.notification_add_rounded),
        ),
      ],
    );
  }
  Widget _buildSection(String section, {String name = "See all"}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(section,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        Text("$name"),
      ],
    );
  }

}
