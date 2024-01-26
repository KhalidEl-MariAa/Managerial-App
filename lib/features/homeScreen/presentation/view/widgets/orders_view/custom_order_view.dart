import 'package:flutter/material.dart';

import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';


class CustomOrderCard extends StatelessWidget {
  const CustomOrderCard({
    super.key,
     required this.order,
     required this.toTrueOnPressed
     
});
   final ordermodel order;
   final void Function()? toTrueOnPressed;
   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
      child: Container(
        decoration: BoxDecoration(
          color:  const Color.fromARGB(100,135, 206, 250),
          borderRadius: BorderRadius.circular(25)
        ),
        
        child: Column(
         
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              
              leading: Container(
                constraints: const BoxConstraints(
                  maxHeight: 250,
                  maxWidth: 100),
                child: Text(order.stockName,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
             
            
              trailing: IconButton(
                onPressed: toTrueOnPressed,
               icon: const Icon(Icons.done_outline_outlined,size: 30,)),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:30.0,top: 30),
              child: Text(
                'Amount you have is less than your Limit (${order.orderLimit})',
                style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
            
            
          ],
        ),
      ),
    );
  }
}