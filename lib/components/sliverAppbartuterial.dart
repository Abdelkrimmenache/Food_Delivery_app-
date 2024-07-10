
import 'package:flutter/material.dart'  ; 


class name extends StatelessWidget {
   name({super.key});

 final  List<String> images = [
   "cool.png" , 
   "facbook.jpg" ,
    "producta.png" , 
    "productb.png" , 
    "productc.png" , 
    "producta.png" , 
    "productb.png" , 
    "productc.png" , 
    "corsera.png"
  
 ] ; 
 

  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      body: 
       CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("hello world"),
            leading: Icon(Icons.home) ,
            actions: [
              Icon(Icons.settings)
            ],
            expandedHeight: 200 ,
            pinned: true ,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/${images[0]}" , fit: BoxFit.cover,),
              title: Text("my app bar"),
              centerTitle: true ,
            ),

            
          ), 

          SliverToBoxAdapter(child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: images.length ,
            shrinkWrap: true ,
            primary: false ,
            itemBuilder: (context , i ){
              return 
              Container(
              margin: EdgeInsets.all(5) ,  
              height: 50 ,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/${images[i]}") , 
                  fit: BoxFit.cover 
                  
                  )

              ),
              
              
              );
            },
            
          ))
      
           ] 
         
      ),
    ); 
  
  }
  // Widget buildimages (){
  //  return SliverToBoxAdapter(
  //     child: 
  //     Container(color: Colors.black,),
  //   );

  // }
}

// class Imagewidget extends StatelessWidget {
//   const Imagewidget({super.key, required this.imagename});
//    final  String imagename ; 

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//       child: 
      
//     );
//   }
// }



class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.red,
              child: Center(child: Text('Screen 1')),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Center(child: Text('Screen 2')),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.green,
              child: Center(child: Text('Screen 3')),
            ),
          ],
        ),
      ),
    );
  }
}
