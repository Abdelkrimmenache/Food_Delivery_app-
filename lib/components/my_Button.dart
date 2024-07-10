
import 'package:flutter/material.dart'; 

class MyButton extends StatelessWidget {
  final void Function()? onPressed ; 
  final String text ; 
  const MyButton({
    super.key, required this.text, required this.onPressed 
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      color: Colors.white,
      minWidth: double.infinity,
      onPressed: onPressed , 
      child: Text("${text}"),
    );
  }
}




