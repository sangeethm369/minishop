import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minishop/login_pg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home: IntroPg(),
    );
  }
}


class IntroPg extends StatefulWidget {
  const IntroPg({super.key});

  @override
  State<IntroPg> createState() => _IntroPgState();
}

class _IntroPgState extends State<IntroPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Center(
        child: Lottie.asset("assets/images/lottiecart.json"),
      ),
      floatingActionButton:  Container(width: 100,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPg(),));
          },shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tooltip: "Continue to Login page",
          splashColor: Colors.indigoAccent,
          child: const Icon(Icons.arrow_forward_sharp),
          ),
      ),
    );
  }
}