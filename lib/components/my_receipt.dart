
import 'package:flutter/material.dart';


class MyReceipt extends StatelessWidget {
  const MyReceipt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical:  20 ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.tertiary)
      ),
      width: double.infinity ,
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          Text("Here's your receipt" )  ,   
          Text("------------") , 
          Text("")
    
         
        ],
      )
      
    );
  }
}