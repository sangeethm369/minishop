import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:minishop/list_items.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePg extends StatefulWidget {
  const HomePg({super.key});

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  final List<String>_items=[
    "Colocasia","Potato",
    "ginger","LadiesFinger",
    "Eggplant","Beetroot",
    "Turmeric","Bittermelon",
    "Cucumber","Pumkin",
    "Calabash","Garlic",
    "Cabbage","onion",
    "Scarletgourds","Cauliflower",
    "Capsicum","Spinach",
    "Mushrooms","Beans",
    "Broccoli","CapsicumRed",
    "CapsicumYellow","SweetCorn",
    "LettuceGreen","Corriander",
    "Drumstick"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              CarouselSlider.builder(
                itemCount: 5, 
                itemBuilder: (context, index, realIndex) {
                  return SliderOffers(index);
                } , options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 0.8,
                  height: 220,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 3)
                )),
                SizedBox(height: 10,),
              GridView.builder(
                itemCount: _items.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220,mainAxisExtent: 220), 
                itemBuilder: (context, index) {
                  return ItemsList(itemName: _items[index]);
                },),
            ],
          ),
        )
      ),
    );
  }
}


class MyFav extends StatefulWidget {
  const MyFav({super.key});

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  void initState() {
    _getFav();
    super.initState();
  }
  _getFav()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    _favitem= pref.getStringList("fav")!;
    setState(() {
      
    });
  }
  List<String>_favitem=[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: _favitem.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220,mainAxisExtent: 220), 
          itemBuilder: (context, index) {
            return FavItem(itemName: _favitem[index]);
          },)
      ),
    );
  }
}

List<String>favitems=[];
favr(String name){
  if(favitems.contains(name)){
    favitems.remove(name);
  }
  print(favitems);
  return favitems;
}
favs(String name){
  if(!favitems.contains(name)){
    favitems.add(name);
  }
  print(favitems);
  return favitems;
}