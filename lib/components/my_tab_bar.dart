

import 'package:firebase_app/models/food.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class mytabbar extends StatelessWidget {

  List <Tab> _buildCategorytabs(){
    return FoodCatergory.values.map((Category) {
      return Tab(
        text: Category.toString().split(".").last ,  //this is in order to split the word (for exmaple "foodcatergory.burger" and take the last word whish is burger)
      ) ;
    }).toList() ;     
    
  }

  // List<Tab> _buildCategorytabs (){
  //   return FoodCatergory.values.map((Category) {
  //     return Tab(
  //       text: Category.toString().split(".").last,
  //     );
  //   }
    
    
  //   ).toList() ; 
  // }

   mytabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: _buildCategorytabs() );
  }
}
