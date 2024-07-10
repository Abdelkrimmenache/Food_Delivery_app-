import 'package:firebase_app/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'  ;
import 'package:provider/provider.dart'; 

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background ,
        title: Center(child: Text("settings")), 
        leading: IconButton(
          icon: Icon(Icons.arrow_back ), 
          onPressed: (){
            Navigator.of(context).pop() ; 


          },
        ), 
      ),

      body:  
      Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 20 ),
        height: 80 , 
        width: double.infinity ,
        decoration: BoxDecoration(

          color:  Theme.of(context).colorScheme.secondary  ,
          borderRadius: BorderRadius.circular(10) , 

        ),
       
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode" , style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),) , 
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context, listen: false ).isDarkMode,   
               
              onChanged: (value){
             
                  
                 Provider.of<ThemeProvider>(context, listen: false).toggletheme() ;  
            
                 
                 
              }
              
              ),
          ],
        )
      ),
    ) ; 
  }
}