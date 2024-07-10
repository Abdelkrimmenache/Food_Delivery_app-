//food item 


class Food {

  final String name ; 
  final String description ; 
  final String imagepath ; 
  final double price ;
  final FoodCatergory catergory ; 
  List<Addon> availableAddons ; 

  Food ({
    required this.name , 
    required this.description , 
    required this.imagepath , 
    required this.price , 
    required this.catergory , 
    required this.availableAddons  , 

    
  }) ;  

  
}
 
 //food catergory 
  enum FoodCatergory {  //i can reach the content of this enum by FoodCatergory.values 
    burgers ,  
    salads , 
    siders , 
    desserts , 
    drinks , 
  

  }



//food addons 

class Addon {
  String name ; 
  double price ; 

  Addon ({
    required this.name , 
    required this.price  , 
  }) ; 

}
