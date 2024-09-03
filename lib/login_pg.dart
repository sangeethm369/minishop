import 'package:flutter/material.dart';
import 'package:minishop/navpg.dart';
import 'package:minishop/signup_pg.dart';

class LoginPg extends StatefulWidget {
  const LoginPg({super.key});

  @override
  State<LoginPg> createState() => _LoginPgState();
}

class _LoginPgState extends State<LoginPg> {
 
  bool _isShow01=false;
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final RegExp upperCase=RegExp(r'[A-Z]');
  final RegExp numberCase=RegExp(r'\d');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(209, 238, 238, 238),
     
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height:20),
                const Text("Welcome",style: TextStyle(color: Color.fromARGB(255, 85, 85, 85),fontSize: 30,fontWeight: FontWeight.bold),),
                const Text(" Back To ",style: TextStyle(color: Color.fromARGB(255, 85, 85, 85),fontSize: 24,fontWeight: FontWeight.bold),),
                const Text("MiniStore",style: TextStyle(color: Color.fromARGB(255, 85, 85, 85),fontSize: 28,fontWeight: FontWeight.bold),),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0,left: 10),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Email")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "enter your Email address",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                    ),controller: _email,
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return "Please enter your Email ";
                      }
                      if(!value.contains('@gmail.com') || value.length<10){
                        return "enter valid email";
                      }
                      return null;
                    },
                  )
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0,left: 10),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Password")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _password,
                    validator: (value) {
                     if(value==null||value.isEmpty){
                      return "Please Enter your Password";
                      }
                    if (value.length<8||!upperCase.hasMatch(value)||!numberCase.hasMatch(value)) {
                      return "Enter Valid password";
                      }
                    return null;
                    },
                    decoration: InputDecoration(hintText: "enter your Password ",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              _isShow01=!_isShow01;
                            });}, icon:Icon(_isShow01?Icons.visibility_off:Icons.visibility) )
                            )
                            ),
            
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0,left: 20),
                  child: Align(alignment: Alignment.centerRight,
                    child: Text("Forget your Password?")),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    onPressed: (){
                       if(_formKey.currentState!.validate())
                        {Navigator.push(context, MaterialPageRoute(builder: (context) => Navpg()));}
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    child: const Text(" LogIn ")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Don't have an account ?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPg()));
                      }, child: const Text("SignIn"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}