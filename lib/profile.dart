import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePg extends StatefulWidget {
  const ProfilePg({super.key});

  @override
  State<ProfilePg> createState() => _ProfilePgState();
}

class _ProfilePgState extends State<ProfilePg> {
  File? _image;
  final ImagePicker _picker=ImagePicker();
  Future<void>_pickImage(ImageSource source)async{
    final XFile? image=await _picker.pickImage(source: source);
    if(image!=null){
      setState(() {
        _image=File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           _image==null?
            CircleAvatar(radius: 60,backgroundImage: AssetImage("assets/images/cappuccinowithmilk.jpg"),):
            CircleAvatar(radius: 60,backgroundImage: FileImage(_image!)),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: ()=>_pickImage(ImageSource.gallery), child: Text("Galary")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()=>_pickImage(ImageSource.camera), child: Text("Camera")),
          ExpansionTile(
        title: Text("Sangeeth",style: TextStyle(color: Colors.red),),
        children: [
          ListTile(title: Text("Age:21"),),
          ListTile(title: Text("Address:PKD"),),
          ListTile(title: Text("Phone:9999777553"),),
        ],
        ),
        
        ],
      ),
    );
  }
}