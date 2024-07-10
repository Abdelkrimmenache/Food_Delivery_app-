import 'package:firebase_app/components/settingsPage.dart';
import 'package:flutter/material.dart'  ;
 


class myDrawer extends StatelessWidget {

  // final void Function()? onTap ; 
  // final IconData? icon ; 
  // final String text ; 
  const myDrawer({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background ,
      child: 
      Column(
        children: [
        
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Icon(Icons.lock , size: 100,),
          ) , 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 , ) , 
            child: Divider(
              color: Colors.white, 
            ),
          ) , 

            SizedBox(height: 30  ,) , 

          myDrawerTile(onTap: (){}, text: "H O M E", icon: Icons.home) ,  
          myDrawerTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => settingsPage())) ;
          }, 
          text: "S E T T I N G S", icon: Icons.settings  , ) ,  
          Spacer() , 
          myDrawerTile(onTap: (){}, text: "L O G O U T", icon: Icons.exit_to_app) ,  
 
        
        ],
      ),
      
    );
  }
}

class myDrawerTile extends StatelessWidget {
  const myDrawerTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final void Function()? onTap;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap ,
      title: Text("$text" , style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary ),),
      leading: Icon(icon) , 
     );
  }
}