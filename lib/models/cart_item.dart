


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/food.dart';

class CartItem {

  Food food ;
  List<Addon> selectedAddons ; 
  int  quantity = 1     ; //the user can buy more than one food  ;

  CartItem ({
    required this.food , 
    required this.selectedAddons , 
  })  ; 
   
  double get totalPrice {
    double addonPrice = selectedAddons.fold(0, (sum ,addon) => sum + addon.price ) ; 
    return (addonPrice + food.price ) * quantity! ; 
    
  } 



  
}