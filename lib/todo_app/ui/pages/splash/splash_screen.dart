import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_t_app/todo_app/ui/layout/home_layout/home_layout.dart';
import 'package:todo_t_app/todo_app/ui/pages/home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
Future.delayed(Duration(seconds: 4),(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
});
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 77, 130, 255),
body: Column(
  children: [
     Expanded(
       child: LottieBuilder.asset('images/animatee.json',width: 600,
           height: 500,
           alignment: Alignment.center,),
     )
    ,
    

   Text('Developed by Radwan',
    style: TextStyle(fontSize: 20,
    color: Colors.black),),
  ],
),



    );
  }
}