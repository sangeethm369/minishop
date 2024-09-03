import 'package:flutter/material.dart';
import 'package:minishop/home_pg.dart';
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
  Map<String,int>_priceMap={
    "Colocasia":22,"Potato":37,
    "ginger":150,"LadiesFinger":56,
    "Eggplant":53,"Beetroot":45,
    "Turmeric":59,"Bittermelon":39,
    "Cucumber":29,"Pumkin":35,
    "Calabash":27,"Garlic":45,
    "Cabbage":20,"onion":26,
    "Scarletgourds":50,"Cauliflower":35,
    "Capsicum":49,"Spinach":30,
    "Mushrooms":300,"Beans":62,
    "Broccoli":132,"CapsicumRed":253,
    "CapsicumYellow":248,"SweetCorn":50,
    "LettuceGreen":243,"Corriander":51,
    "Drumstick":150
  };
    
//HOME
class ItemsList extends StatefulWidget {
  final String itemName;
  const ItemsList({super.key, required this.itemName});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  _setFavs(value)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setStringList("fav", value);
    _getFav();
  }
  @override
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
  bool _isFav=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,shadowColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("${_imageMap[widget.itemName]}"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Align(alignment: Alignment.centerLeft,child: FittedBox(child: Text(widget.itemName,style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold,),softWrap: true,))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Align(alignment: Alignment.centerLeft,child: Text("\$${_priceMap[widget.itemName]}/kg",style: const TextStyle(color: Colors.black))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>SingleItemViewer(itemName: widget.itemName),));
                    });
                  }, child: const Text("buy",style: TextStyle(),)),
                  Flexible(
                    child: IconButton(onPressed: (){
                      _isFav=!_isFav;
                      setState(() {
                        _isFav?_favitem=favs(widget.itemName):_favitem=favr(widget.itemName);
                        _setFavs(_favitem);
                      });
                    }, icon: _favitem.contains(widget.itemName)?const Icon(Icons.favorite,color: Colors.red):const Icon(Icons.favorite_border,color: Colors.red)),
                  )
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}

//FAVORITES
class FavItem extends StatefulWidget {
  final String itemName;
  const FavItem({super.key, required this.itemName});

  @override
  State<FavItem> createState() => _FavItemState();
}

class _FavItemState extends State<FavItem> {
  _setFavs(value)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setStringList("fav", value);
    _getFav();
  }
  @override
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
  bool _isFav=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,shadowColor: Colors.redAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("${_imageMap[widget.itemName]}"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Align(alignment: Alignment.centerLeft,child: FittedBox(child: Text(widget.itemName,style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold,),softWrap: true,))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Align(alignment: Alignment.centerLeft,child: Text("\$${_priceMap[widget.itemName]}/kg",style: const TextStyle(color: Colors.black))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>SingleItemViewer(itemName: widget.itemName),));
                    });
                  }, child: const Text("buy")),
                  IconButton(onPressed: (){
                    _isFav=!_isFav;
                    setState(() {
                      _isFav?_favitem=favs(widget.itemName):_favitem=favr(widget.itemName);
                      _setFavs(_favitem);
                    });
                  }, icon: _favitem.contains(widget.itemName)?const Icon(Icons.favorite,color: Colors.red):const Icon(Icons.favorite_border,color: Colors.red))
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}

//HOME SLIDER
class SliderOffers extends StatefulWidget {
  final int intex;
  const SliderOffers(this.intex,{super.key});

  @override
  State<SliderOffers> createState() => _SliderOffersState();
}

class _SliderOffersState extends State<SliderOffers> {

  final List<List<String>>_specialOffer=[
    ["ginger","Turmeric"],
    ["CapsicumRed","CapsicumYellow"],
    ["LettuceGreen","SweetCorn"],
    ["LettuceGreen","Cabbage"],
    ["Bittermelon","onion"],
  ];
  final List<List<String>>_specialPrice=[
    ["500 g","500 g","99"],
    ["500 g","500 g","239"],
    ["1 Kg","2 kg","229"],
    ["1 Kg","3 Kg","299"],
    ["2 Kg","2 Kg","119"],
  ];
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 165, 165, 165),Color.fromARGB(255, 241, 178, 178),Color.fromARGB(255, 168, 172, 118)])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("✨SPECIAL OFFER✨",style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 9,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("${_imageMap[_specialOffer[widget.intex][0]]}"),fit: BoxFit.fill)),),
                  ),
                  const Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Flexible(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("${_imageMap[_specialOffer[widget.intex][1]]}"),fit: BoxFit.fill)),),
                  ), 
                ],
              ),
              const SizedBox(height: 9,),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_specialPrice[widget.intex][0],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    const Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    Text(_specialPrice[widget.intex][1],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    const Text("=",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    Text(_specialPrice[widget.intex][2],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                  ],
                ),
              )
              ]
              ),
        ),
      ),

      onTap: () {
        
      },
    );
  }
}



//item viewer

class SingleItemViewer extends StatefulWidget {
  final String itemName;
  const SingleItemViewer({super.key,required this.itemName});

  @override
  State<SingleItemViewer> createState() => _SingleItemViewerState();
}

class _SingleItemViewerState extends State<SingleItemViewer> {
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
    SharedPreferences shr=await SharedPreferences.getInstance();
    _listCart=shr.getStringList("cartitems")!;
    _qty=shr.getStringList("qty")!;
  }
  List<String>_listCart=[];
  List<String>_qty=[];
  String _selectSize="250g";
  final List<String>_size=[
    "250g","500g","1Kg","1.5Kg","2Kg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image: DecorationImage(image: AssetImage("${_imageMap[widget.itemName]}"),fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(widget.itemName,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("\$${_priceMap[widget.itemName]}/kg",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                
                ],
            ),),
           
              Padding(
                padding: const EdgeInsets.only(right: 8.0,left: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Available size",style: TextStyle(fontWeight: FontWeight.bold),),),
                    SizedBox(width: 100,
                      child: DropdownButton(borderRadius: BorderRadius.circular(10),
                        items: _size.map((size) {
                          return DropdownMenuItem(
                            value: size,
                            child: Text(size)
                            );
                        },).toList(), 
                        onChanged: (newValue) {
                          setState(() {
                            _selectSize=newValue!;
                          });
                        },
                        value: _selectSize,
                        ),
                    ),
                    
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: (){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: const Center(child: Text("Add To Cart")),
                        content: SizedBox(height: 100,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.itemName,style: const TextStyle(fontWeight: FontWeight.bold),),
                              Text("Price(Kg) :\$${_priceMap[widget.itemName]}"),
                              Text("Quantity:$_selectSize"),
                              Text("Total :\$${priceTotal(widget.itemName, _selectSize)}")
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                              _listCart.add(widget.itemName);
                              _qty.add(_selectSize);
                              _setCartItems(_listCart);
                              _setCart(_qty);
                              Navigator.pop(context);
                              showDialog(context: context, builder: (context)=>AlertDialog(
                              content: Text("Added successfully",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                              actions: [
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Ok"))
                              ],
                              ));
                            });
                          }, child: const Text("Add")),
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: const Text("Cancel",style: TextStyle(color: Colors.black),)),
                        ],
                      ),
                      );
                    }, 
                    child: const Text("ADD TO CART",style: TextStyle(color: Colors.white),
                    )),
              )
        ],
      ),
    );
  }
}


double priceTotal(String name,String qty){
  int price=_priceMap[name]!;
  double tPrice=0;
  switch (qty) {
    case "250g":
      tPrice=price*0.25;
      break;
    case "500g":
      tPrice=price*0.5;
      break;
    case "1Kg":
      tPrice=price*1.0;
      break;
    case "1.5Kg":
      tPrice=price*1.5;
      break;
    case "2Kg":
      tPrice=price*2.0;
      break;
    
  }
  return tPrice;
}

sumTotal(List item,List qty){
  double total=0;
  for (var i = 0; i < item.length; i++) {
    var price= priceTotal(item[i], qty[i]);
    total+=price;
  }
  return total;
}