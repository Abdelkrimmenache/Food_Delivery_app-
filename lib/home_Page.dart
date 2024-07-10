import 'package:firebase_app/components/my_Food_Tile.dart';
import 'package:firebase_app/components/my_description_box.dart';
import 'package:firebase_app/components/my_drawer.dart';
import 'package:firebase_app/components/my_tab_bar.dart';
import 'package:firebase_app/components/mysliver_app_bar.dart';
import 'package:firebase_app/models/food.dart';
import 'package:firebase_app/models/restaurant.dart';
import 'package:firebase_app/pages.dart/cart_Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //this fuction in order to return only the food belong to specifique catefory
  // List<Food> _filterMenuByCategory (FoodCatergory  Category  , List<Food> fullMenu ) {
  //   return fullMenu.where((food) => food.catergory == Category).toList() ;

  // }

  List<Food> _filterMenuByCategory( 
      List<Food> fullMenu, FoodCatergory catergory) {
    return fullMenu.where((food) => food.catergory == catergory).toList();
  }

  List<Widget> getFoodinthisCategory(List<Food> fullMenu) {
    return FoodCatergory.values.map((Category) {
      List<Food> CategoryMenu = _filterMenuByCategory(fullMenu, Category);

      return ListView.builder(
          itemCount: CategoryMenu.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return myFoodTile(
              CategoryMenu: CategoryMenu,
              index: i,
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.background ,
        //   title: Center(child: Text("Sunset Diner" , style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),) , ),
        //   actions: [

        //    Padding(
        //      padding: EdgeInsets.symmetric(horizontal: 10 , ) ,
        //      child: Icon(Icons.shopping_cart_outlined , color: Theme.of(context).colorScheme.inversePrimary,),
        //    )
        //   ],
        // ),
        drawer: const myDrawer(),
        body: DefaultTabController(
          length: FoodCatergory.values.length,
          child: NestedScrollView(headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                expandedHeight: 400,
                floating: true,
                title: Text("Suset Diner"),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage()));
                      },
                      icon: Icon(Icons.shopping_bag)),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: MyDescriptionBox(),
                  title: mytabbar(),
                  centerTitle: true,
                  expandedTitleScale: 1,
                ),
              )
            ];
          }, body: Consumer<Restaurant>(builder: (context, restaurant, child) {
            return TabBarView(children: getFoodinthisCategory(restaurant.menu));
          })),
        )

        //NestedScrollView(
        //   headerSliverBuilder: (context , isBoxScrolled) {
        //     return
        //     [
        //       mySliverAppBar(
        //          child:  MyDescriptionBox() ,

        //         title: MyTabBar() ,

        //         )

        //     ] ;

        //   } ,
        // body:
        // TabBarView(children: [
        //   Text("hello") ,
        //   Text("hello") ,
        //   Text("hello") ,
        // ])

        //  )

        );
  }
}

//we need to filter menu by cateogry  ;

//we creat a mehtode will get the appropiate category menu for each category :

//this function must have two parameters (List<food> fullmenu , catgerty )
