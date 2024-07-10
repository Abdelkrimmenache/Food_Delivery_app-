

import 'package:firebase_app/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryInProgres extends StatelessWidget {
  const DeliveryInProgres({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background ,
        centerTitle: true ,
        title: Text("delivery in progress..."),),


        body: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 , ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Text("thans for your order !") , 
              SizedBox(height: 25 ,)  , 
              MyReceipt() 
              
            ],
          ),
        )
    ) ; 
  }
}

