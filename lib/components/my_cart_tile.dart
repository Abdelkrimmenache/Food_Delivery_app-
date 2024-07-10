import 'package:firebase_app/models/cart_item.dart';
import 'package:firebase_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';   

class MyCartTile extends StatelessWidget {
  final CartItem cartItem ; 
  const MyCartTile({
    super.key, required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return 
   Consumer<Restaurant>(builder: (context , restaurant , child ) {
    return
    Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5 , vertical: 5 ),
        decoration: BoxDecoration(
          color: Colors.white , 
          borderRadius: BorderRadius.circular(10) 
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image of item 
                Container(
                  height: 100 ,
                  width: 100 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                    image: AssetImage(
                      cartItem.food.imagepath , 
                      
        
        
                     ) , 
                  )
                  )
                  
                ) , 
        
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    //name of item 
      
                     Text("${cartItem.food.name }"  , style: TextStyle(fontWeight: FontWeight.bold) ,) ,
      
                    //price of item 
      
                      Text("${cartItem.food.price}" , style: TextStyle(fontWeight: FontWeight.bold) ) ,
        
                  ],
                ) , 
        
                //the increment and decrement quantity 
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 5 ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background  ,
                    borderRadius: BorderRadius.circular(10) , 
                  ),
                  child: 
                  Row(
                    children: [
                      InkWell(
                         onTap: () {
                          restaurant.removeFromCart(cartItem) ; 
                      },
                        child: Text("-"),) , 
                      SizedBox(width: 25 ,) , 
                      Text("${cartItem.quantity}") ,
                      SizedBox(width: 25 ,) ,  
                      InkWell( onTap: () {
                        restaurant.addToCart(cartItem.food , cartItem.selectedAddons) ; 
                      }, child: Text("+"),) , 
                      
                    ],
                  ),
                )
        
        
              ],
            ) , 
        
            //the list of addons : 
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60  ,
              child: 
              ListView.builder(
                
                itemCount: cartItem.selectedAddons.length ,
                scrollDirection: Axis.horizontal ,
                itemBuilder:(context ,i ){ 
                  return
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10 ,horizontal: 10 ),
                    padding: EdgeInsets.symmetric(horizontal: 10 ),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black , )  ,
                      borderRadius: BorderRadius.circular(15 )
                      
                    ),
                    child: Row(
                      children: [
                        Text(cartItem.selectedAddons[i].name) ,
                        SizedBox(width: 5 ,),  
                        Text("(\$${cartItem.selectedAddons[i].price})") , 
                      ],
                    
                    ),
                  ) ;

              })
              

              )  
            
        
        
        
        
          ],
          
        ),
      ),
    ) ; 
   }
   
   
   )  ;
  }
}