

import 'package:firebase_app/components/my_Button.dart';
import 'package:firebase_app/pages.dart/Delivery_in_progres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}



class _PaymentPageState extends State<PaymentPage> {


  
void userTappedPay () {
  showDialog(
    context:  context   ,   
        builder: (context){
        return AlertDialog(
      title: Text("confirm payment"), 
      content: SingleChildScrollView(
        child: ListBody(

          children: [
            Text("card number :  $cardNumber") , 
            Text("expiry date : $expiryDate") , 
            Text("Card holder name :  $cardHolderName ") , 
            Text("Cvv :  $cvvCode") ,  
          ],
        ),
      ) , 
      actions: [
        //cancel button 
        TextButton(onPressed: (){
          Navigator.of(context).pop()  ; 
        }, 
        child: 
        Text("cancel") , 
        
        ) , 
        //confirme button : 
        TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context ) => DeliveryInProgres())) ; 
        }, 
        child: 
        Text("confirme") , 
        
        ) , 
      ],

      
    ) ; 
  }
  
  );
 
}

  GlobalKey<FormState> formKey = GlobalKey<FormState>() ; 
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("checkout          ")),
      ),
      body: 
          Column(
          children: [
             CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
        
          //credit card form
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data){
               setState(() {
                 
                  cardNumber = data.cardNumber ; 
                expiryDate = data.expiryDate ; 
                cardHolderName = data.cardHolderName ; 
                cvvCode  = data.cvvCode ;
        
               }); 
                
        
        
              },
              formKey: formKey
              ) , 
              Spacer(flex: 5,) , 
              MyButton(text: "Pay now", onPressed: (){
                userTappedPay() ;
              }) , 
          ],
        ),
      
    );
  }
}
