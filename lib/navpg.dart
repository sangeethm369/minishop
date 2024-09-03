import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minishop/cart_items.dart';
import 'package:minishop/home_pg.dart';
import 'package:minishop/profile.dart';

class Navpg extends StatefulWidget {
  const Navpg({super.key});

  @override
  State<Navpg> createState() => _NavpgState();
}

class _NavpgState extends State<Navpg> {
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
  int _currentIndex=0;
  final tabs=[
    const Center(child: HomePg()),
    const Center(child: MyFav()),
    const Center(child: MyCartItem()),
    const Center(child: ProfilePg()),
  ];
  final List<String>_tabsname=["Home","Favorite","Cart","Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_tabsname[_currentIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(height: 150,width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black,Colors.grey],
                begin: Alignment.bottomLeft)),
              child: Stack(
                children: [
                  const Positioned(right: 0,top: 10,
                    child: SizedBox(width: 150,
                      child: ExpansionTile(
                        textColor: Colors.white,
                        dense: true,
                        title: Text("UserName",),
                        tilePadding: EdgeInsets.zero,
                      children: [
                        Align(alignment: Alignment.centerLeft,child: Text("Age:12")),
                        Align(alignment: Alignment.centerLeft,child: Text("Place:Pkd")),
                        Align(alignment: Alignment.centerLeft,child: Text("Pin:646464"))
                      ],
                      ),
                    )
                    ),
                  Positioned(top: 0,
                    child: _image==null?const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/cappuccinowithmilk.jpg",),):
                      CircleAvatar(radius: 60,backgroundImage: FileImage(_image!)),
                  ),
                  Positioned(top: 85,left: 85,
                    child: IconButton(onPressed: ()=>_pickImage(ImageSource.camera), icon: const Icon(Icons.camera,color: Colors.white,),))
                    ])),
                    const ListTile(title: Text("Favorites"),leading: Icon(Icons.favorite),iconColor: Colors.red,),
                    const ListTile(title: Text("Notification"),leading: Icon(Icons.notifications),iconColor: Colors.amber,),
                    const ListTile(title: Text("Orders"),leading: Icon(Icons.shopify),iconColor: Colors.blue,),
          ],
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
        fixedColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.shopify,),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: "Profile"),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex=value;
          });
        }
        ),
    );
  }
}
