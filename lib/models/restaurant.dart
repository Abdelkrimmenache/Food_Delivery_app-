import 'package:firebase_app/models/cart_item.dart';
import 'package:firebase_app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart'; 

class Restaurant extends ChangeNotifier {

 
 //list of food menu  : 
 //include all the food cantergorys : 

  final List <Food> _menu = [
 
   //burgers 

   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/9.png", 
    price: 0.99, 
    catergory: FoodCatergory.burgers  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/53.jpg", 
    price: 0.99, 
    catergory: FoodCatergory.burgers  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/119.jpg", 
    price: 0.99, 
    catergory: FoodCatergory.burgers  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/129.jpg", 
    price: 0.99, 
    catergory: FoodCatergory.burgers  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/129.jpg", 
    price: 0.99, 
    catergory: FoodCatergory.burgers  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   

   //salads 

   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/9.png", 
    price: 0.99, 
    catergory: FoodCatergory.salads  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/9.png", 
    price: 0.99, 
    catergory: FoodCatergory.salads  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/9.png", 
    price: 0.99, 
    catergory: FoodCatergory.salads  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/9.png", 
    price: 0.99, 
    catergory: FoodCatergory.salads  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
   Food(
    name: "classic cheesburger", 
    description: "this is a very delecioius classic cheesburger with chees", 
    imagepath: "lib/images/burgers/9.png", 
    price: 0.99, 
    catergory: FoodCatergory.salads  , 
    availableAddons: [ 
      Addon(name: "Extra chees", price: 1.99) , 
      Addon(name: "Bacon", price: 1.99) , 
      Addon(name: "Avocado", price: 2.99) , 
    ]
    ) , 
  

   //sides


   //desserts 


   //drinks 
   
 


  ] ;


  /* 
  G  E T T E R S 

  */

  List<Food> get menu => _menu ; 
  List<CartItem> get cart => _cart ; 

  /* 
  Opritaions /////////////////////////////////////////////////
  */
  //user card  : 

  final  List<CartItem> _cart = [] ; 


  //add to cart : 

  void addToCart (Food food , List<Addon> selectedAddons) { //the user input the food and addons 
    
    //see if there is a cart item already with the same food and slelected Addons : 
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the Food item are the same : 
      bool isSameFood = item.food == food; 
      //check if the slectedAddon are the same ; 
      bool isSameAddons = 
      ListEquality().equals(item.selectedAddons, selectedAddons ); 

      return isSameFood && isSameAddons ; 

    }) ;
    
    //if item already exict increase his quantity : 
    if(cartItem != null ) {

      cartItem.quantity++ ; 

    }

    else {
      _cart.add(CartItem(food: food,  selectedAddons: selectedAddons)) ; 

    }

     notifyListeners()  ; 

  }

  /* 
  Helpers  

  */



  //removee from the cart
  
  removeFromCart(CartItem cartItem ) {
    int cartIndex = _cart.indexOf(cartItem) ;

    if(cartIndex != -1 ) {
      if(_cart[cartIndex].quantity > 1 ) {
      _cart[cartIndex].quantity-- ; 
    } 
    else {
      _cart.removeAt(cartIndex) ; 
    }
    }
    notifyListeners();
  }




// get total price  :   



double getTotalPrice(){
  double totalPrice = 0.0 ; 
  
  for(CartItem cartItem in _cart  ){
    totalPrice += cartItem.totalPrice ; 
  }

  return totalPrice ;
  

}

//get total number of item in cart : 

int getTotalItemCount (){
  int totalItemCount = 0 ; 
  for (CartItem cartItem in _cart ) {
    totalItemCount += cartItem.quantity   ; 
  }
  return totalItemCount ; 

}

void clearCart (){
  _cart.clear() ; 
  notifyListeners() ; 
  
}

//gernerate receipt : 
// String displayCartReceipt (){
//   final receipt = StringBuffer() ; 
//   receipt.writeln("Here's your receipt") ;  
//   receipt.writeln() ; 

//   //format the data to include up to seconds only 
 
  
// }




//format double value into money : 

String _formatPrice ( double price ){

  return "\$ ${price.toStringAsFixed(2)}"  ;

}

String _formatAddons (List<Addon> addons ) {

  return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})" ).join(", ") ;

}


   












} 

