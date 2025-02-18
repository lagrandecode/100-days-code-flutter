


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_app/second_page.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
      ,
      body: Container(

        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Center(
              child: Image.asset("images/image1.png"),
            ),
            SizedBox(height: 50.0,),
            Container(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child:  Center(
                  child: Text("The only study app you'll ever need",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),)),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 30.0,right: 30.0),
              child: Text("Upload class study materials, create electronic flashcards to study.",textAlign: TextAlign.center,),
            ),
            SizedBox(height: 80,),
            GestureDetector(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SecondPage())),
              child: Container(
                width: 150,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Let's start",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50.0),
              ),),
            )
          ],
        ),
      ),
    );
  }
}

