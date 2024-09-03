import 'package:flutter/material.dart';
import 'package:minishop/list_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
  Map<String,String>_imageMap={
    "Colocasia":"assets/images/Colocasia.jpg","Potato":"assets/images/Potato.jpg",
    "ginger":"assets/images/ginger.jpg","LadiesFinger":"assets/images/LadiesFinger.jpg",
    "Eggplant":"assets/images/Eggplant.jpg","Beetroot":"assets/images/Beetroot.jpg",
    "Turmeric":"assets/images/Turmeric.jpg","Bittermelon":"assets/images/Bittermelon.jpg",
    "Cucumber":"assets/images/Cucumber.jpg","Pumkin":"assets/images/Pumkin.jpg",
    "Calabash":"assets/images/Calabash.jpg","Garlic":"assets/images/Garlic.jpg",
    "Cabbage":"assets/images/Cabbage.jpg","onion":"assets/images/onion.jpg",
    "Scarletgourds":"assets/images/Scarletgourds.jpg","Cauliflower":"assets/images/Cauliflower.png",
    "Capsicum":"assets/images/Capsicum.png","Spinach":"assets/images/Spinach.png",
    "Mushrooms":"assets/images/Mushrooms.png","Beans":"assets/images/Beans.png",
    "Broccoli":"assets/images/Broccoli.png","CapsicumRed":"assets/images/CapsicumRed.png",
    "CapsicumYellow":"assets/images/CapsicumYellow.jpg","SweetCorn":"assets/images/SweetCorn.png",
    "LettuceGreen":"assets/images/LettuceGreen.jpg","Corriander":"assets/images/Corriander.png",
    "Drumstick":"assets/images/Drumstick.jpg"
  };



class MyCartItem extends StatefulWidget {

  const MyCartItem({super.key});

  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItem> {
 
  @override
  void initState() {
    _getCartItem();
    super.initState();
  }
  _setCartItems(name)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setStringList("cartitems", name);
  }
  _setCart(qty)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setStringList("qty", qty);
  }

  _getCartItem()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    _itemNames=sp.getStringList("cartitems")!;
    _itemqty=sp.getStringList("qty")!;
    setState(() {
      
    });
   
  }
  List<String>_itemNames=[];
  List<String>_itemqty=[];
  double price=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _itemNames.length,
            itemBuilder: (context, index) {
            price=priceTotal(_itemNames[index], _itemqty[index]);
            return ListTile(tileColor: const Color.fromARGB(255, 223, 223, 223),
            onLongPress: () {
              setState(() {
                _itemNames.removeAt(index);
                _itemqty.removeAt(index);
                _setCartItems(_itemNames);
                _setCart(_itemqty);
              });
            },
            leading: Container(height: 50,width: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("${_imageMap[_itemNames[index]]}"),fit: BoxFit.fill)),),
                      title: Text(_itemNames[index],style: const TextStyle(color: Colors.black),),
                      subtitle: Text(_itemqty[index],style: const TextStyle(color: Colors.black)),
                      trailing: Text("Price :\$$price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      );
          },),
          Positioned(bottom: 5,left: 5,right: 5,
            child: Container(height: 50,decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 220, 220, 220),Color.fromARGB(255, 210, 210, 210),Color.fromARGB(255, 210, 220, 210),Color.fromARGB(255, 220, 210, 220)])),
              child: Center(child: Text("Total Price :\$${sumTotal(_itemNames,_itemqty)}",style: TextStyle(color: Colors.black),)))
            )
        ],
      ),
    );
  }
}

