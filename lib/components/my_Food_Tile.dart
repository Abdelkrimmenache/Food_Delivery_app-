import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/food.dart';
import 'package:firebase_app/pages.dart/food_Page.dart';
import 'package:flutter/material.dart';


class myFoodTile extends StatelessWidget {
  const myFoodTile({
    super.key,
    required this.CategoryMenu, required this.index,
  });

  final List<Food> CategoryMenu; 
  final int index; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FoodPage(food: CategoryMenu[index],))) ; 
      },
      child: Container(
        color:  Theme.of(context).colorScheme.tertiary,
        child: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 5) , 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CategoryMenu[index].name , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ),) , 
                      Text("${CategoryMenu[index].price}") , 
                      Text(CategoryMenu[index].description) , 
                    ],
                    ),
                  ),
                  Container(
                    
                    width: 120 ,
                    height: 120 ,
              
                    decoration: BoxDecoration(
                      color: Colors.black ,
                      borderRadius: BorderRadius.circular(10)  ,
                      image: DecorationImage(
                        image: AssetImage(CategoryMenu[index].imagepath ,  )  , 
                        
                        )
                    ),
                  ) , 
              
                ],
              ),
            ),
            Divider(color: Theme.of(context).colorScheme.inversePrimary,)
          ],
        ),
      ),
    );
  }
}
