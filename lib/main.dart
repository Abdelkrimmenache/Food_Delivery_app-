
import 'dart:io';

import 'package:firebase_app/components/sliverAppbartuterial.dart';
import 'package:firebase_app/home_Page.dart';
import 'package:firebase_app/models/restaurant.dart';
import 'package:firebase_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'  ;
import 'package:provider/provider.dart';




//it containe the mainpage of the app 

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  Platform.isAndroid? 
  await Firebase.initializeApp (
    options: const FirebaseOptions(
    apiKey: 'AIzaSyD-fEhyaXJRFUwMCJ4XuBRSbPLlGmKBaZk' , 
    appId: '1:756900645570:android:9d98efe4fdf1cad910c95b', 
    messagingSenderId: '756900645570', 
    projectId: 'fir-app-4baab' , 
    storageBucket: 'fir-app-4baab.appspot.com', 
    // messagingSenderId: "604005378047",
    )
    ) 
  :await Firebase.initializeApp() ;
  
  runApp( 
    MultiProvider(providers: [
      //theme provoder 
      ChangeNotifierProvider<ThemeProvider>(create: (context){
        return ThemeProvider() ;
      }) , 
      ChangeNotifierProvider<Restaurant>(create: (context){
        return  Restaurant() ; 
      }) ,

       

    ] , 
    child: 
    const MyApp( ),
    )
  );
}


class MyApp extends StatefulWidget {

 
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() { 
    super.initState();
  }




  @override
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData , //theme will change when they listnen that the value of has been changed 
      
        home: homepage()  


    
    ) ;
      
       
   
      
    
  }
}





