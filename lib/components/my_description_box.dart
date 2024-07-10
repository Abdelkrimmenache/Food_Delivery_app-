import 'package:flutter/material.dart'  ;  

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});


  void  OpenLocationSearchBox( BuildContext context ){
  
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: const Text("your location"),
      content: const TextField(
        decoration: InputDecoration(
          hintText: "search adress..." , 

        ),
      ),
      actions: [
        MaterialButton( color: Colors.red , onPressed: (){Navigator.pop(context) ;} , child: const Text("cancel"),),
        MaterialButton( color: Colors.green  , onPressed: (){Navigator.pop(context) ;} , child: const Text("save"),)  , 
      ],

    )
    ) ; 


  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
                 
                padding: const EdgeInsets.symmetric(vertical: 50 , horizontal: 20 ) , 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end ,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    
                   const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20 ) , 
                      child: Divider(color: Colors.white ,)
                    ) , 
                    Text("deliver now" ,  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),) , 
                    InkWell(
                      onTap: () => OpenLocationSearchBox(context) ,
                      child: Row(
                        children: [
                          Text(
                            "6901 Hollywood Blv"  , 
                           style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary , 
                           fontWeight: FontWeight.bold , 
                           )
                           
                           
                           ) , 
                          //drop down micu 
                          const Icon(Icons.arrow_drop_down) 
                        ],
                      ),
                    ) , 
                    /////////////////////////
                    
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20 ) , 
                      child: Divider(color: Colors.white ,),
                    ) , 

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [
                        Column(
                          children: [
                            Text("\$0.99") ,  
                            Text("Delivery fee") ,  
                          ],
                        ) , 
                        Column(
                          children: [
                            Text("15-30 min") ,  
                            Text("Delivery time") ,  
                          ],
                        ) , 
                      ],
                    ) , 
                       const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20 ) , 
                      child: Divider(color: Colors.white ,),
                    ) ,
                
                  ],
                ),
              ) ;
  }
}