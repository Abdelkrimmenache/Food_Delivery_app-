import 'package:firebase_app/components/my_Button.dart';
import 'package:firebase_app/models/food.dart';
import 'package:firebase_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  List<bool> isselected = [];

  FoodPage({
    super.key,
    required this.food,
  })
  //we genna initialize selcted Addons to be false :
  //body of contracor :
  {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //methode add to cart :
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current page
    Navigator.pop(context);
    //format the selected addons :

    List<Addon> currntlySelectedAddon = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currntlySelectedAddon.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currntlySelectedAddon);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               //food image
                Expanded(
                    child: Image.asset(
                  widget.food.imagepath,
                  fit: BoxFit.cover,
                )),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10 ) , 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   
                    //food name
                    Text(
                      widget.food.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    //food price
                    Text("\$${widget.food.price}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    //food description :
                    Text(
                      widget.food.description,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    

                           Padding(
                            padding: EdgeInsets.symmetric(vertical: 10 ) ,
                            child: Divider(color: Colors.white ,),
                          )  ,
                          Padding(
                            padding: EdgeInsets.only(bottom: 10 ) ,
                            child: Text("Add-ons"),
                          ) ,
                
                    //adons :
                    Container(
                      
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.white)),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                                title: Text(
                                  widget.food.availableAddons[i].name,
                                ),
                                subtitle:
                                    Text("\$${widget.food.availableAddons[i].price}"),
                                trailing: Checkbox(
                                    value: widget.selectedAddons[
                                        widget.food.availableAddons[i]],
                                    onChanged: (val) {
                                      setState(() {
                                        widget.selectedAddons[
                                            widget.food.availableAddons[i]] = val!;
                                      });
                                    }));
                          }),
                    ) , 
                    
                    MyButton(text:"add to cart" , onPressed: (){
                    addToCart(widget.food , widget.selectedAddons );  } )
                
                    // Container(
                
                    //   width: double.infinity ,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black ,
                    //     image: DecorationImage(
                    //       image: AssetImage(widget.food.imagepath)  ,
                    //       fit: BoxFit.cover
                    //       )
                    //   ),
                    // ) ,
                
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20 ),
                    //   color: Theme.of(context).colorScheme.background ,
                    //   child:
                    //   Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start ,
                    //     children: [
                    //       Text(widget.food.name , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),) ,
                    //       Text("\$${widget.food.price}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ,
                    //        color: Theme.of(context).colorScheme.primary  ),) ,
                    //       Text(widget.food.description , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15 ),) ,
                    //       Padding(
                    //         padding: EdgeInsets.symmetric(vertical: 10 ) ,
                    //         child: Divider(color: Colors.white ,),
                    //       )  ,
                    //       Padding(
                    //         padding: EdgeInsets.only(bottom: 10 ) ,
                    //         child: Text("Add-ons"),
                    //       ) ,
                
                    //       Column(
                    //         children: [
                    //           Container(
                    //            height: 180,
                    //             decoration: BoxDecoration(
                    //               border: Border.all(color: Colors.white )
                    //             ),
                    //             child:
                    //             ListView.builder(
                
                    //               shrinkWrap: true ,
                    //               itemCount: widget.food.availableAddons.length ,
                    //               itemBuilder: (context , i ) {
                    //                 return
                    //                 ListTile(
                    //                   title: Text(widget.food.availableAddons[i].name , ) ,
                    //                   subtitle: Text("\$${widget.food.availableAddons[i].price}") ,
                    //                   trailing:
                    //                   Checkbox(value: widget.selectedAddons[widget.food.availableAddons[i]]  , onChanged: (val) {
                    //                   setState(() {
                    //                     widget.selectedAddons[widget.food.availableAddons[i]] = val!  ;
                    //                   });
                
                    //                    }
                    //                    )
                    //                 ) ;
                
                    //             }
                
                    //             )
                    //           ),
                
                    //           SizedBox(height: 15,)  ,
                
                    //            MaterialButton(
                    //                    padding: EdgeInsets.symmetric(vertical: 20),
                    //                   minWidth: double.infinity ,
                
                    //                   color: Theme.of(context).colorScheme.tertiary ,
                    //                   onPressed: (){
                    //                     addToCart(widget.food , widget.selectedAddons );
                    //                 } ,
                    //                 child:
                    //                 Text("Add to cart")
                
                    //                 )
                    //         ],
                    //       )
                
                    //     ],
                    //   )
                
                    //   ,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
        )
      ],
    );
  }
}
