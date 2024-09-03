import 'package:flutter/material.dart';
import 'package:minishop/navpg.dart';


class SignupPg extends StatefulWidget {
  const SignupPg({super.key});

  @override
  State<SignupPg> createState() => _SignupPgState();
}

class _SignupPgState extends State<SignupPg> {
  bool _isChecked=false;
  bool _isShow01=true;
  bool _isShow02=true;
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final RegExp upperCase=RegExp(r'[A-Z]');
  final RegExp numberCase=RegExp(r'\d');
  String _passwordCheck="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(209, 192, 192, 192),
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("MiniStore"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Welcome",style: TextStyle(color: Color.fromARGB(255, 85, 85, 85),fontSize: 28,fontWeight: FontWeight.bold),),
                Align(alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 7),
                    child: Text("Name"),
                  )),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)))),
                Align(alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 7),
                    child: Text("Email "),
                  ),
                ),
                TextFormField(controller: _email,
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return "Please enter your Email ";
                      }
                    if(!value.contains('@gmail.com')&&value.length>10){
                      return "enter valid email";
                      }
                    return null;
                    },
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),),
                Align(alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0,left: 5),
                    child: Text("New Password "),
                  ),
                ),
                TextFormField(controller: _password,
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return "Please Enter your Password";
                        }
                   if (value.length<8||!upperCase.hasMatch(value)||!numberCase.hasMatch(value)) {
                      return "Enter Valid password";
                        }
                    _passwordCheck=value;
                    return null;
                  },
                  obscureText: _isShow01,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    hintText: "Enter a password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _isShow01=!_isShow01;
                          });
                        }, icon:Icon(_isShow01?Icons.visibility_off:Icons.visibility) )),),
                Align(alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0,left: 5),
                    child: Text("Repeate Password "),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if(value!=_passwordCheck){
                      return "password not matching";
                    }
                    return null;
                  },
                  obscureText: _isShow02,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    hintText: "password again",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _isShow02=!_isShow02;
                          });
                        }, icon:Icon(_isShow02?Icons.visibility_off:Icons.visibility) )),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Checkbox(value: _isChecked, onChanged: (bool?value){
                              setState(() {
                                _isChecked=value!;
                              });
                            },side: BorderSide(color: Colors.white),activeColor: Colors.green,),
                            Text("I Agree with ",style: TextStyle(color: Colors.black),),
                            Text("privacy ",style: TextStyle(color: Colors.red)),
                            Text("and ",style: TextStyle(color: Colors.black)),
                            Text("policy ",style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                     if(_formkey.currentState!.validate()&&_isChecked==true)
                     {Navigator.push(context, MaterialPageRoute(builder: (context) => Navpg()));}
                  }, child: Text(" SignUp ")),
                ),
                Row(
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPg()));
                      Navigator.pop(context);
                    }, child: Text("SignIn"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}