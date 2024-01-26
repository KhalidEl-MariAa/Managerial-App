import 'package:flutter/material.dart';

import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';


class CustomIncomingCard extends StatelessWidget {
  const CustomIncomingCard({
    super.key,
     required this.order,
     required this.handshakeOnPressed
     
     
});
   final ordermodel order;
   final void Function()? handshakeOnPressed;
   
   

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
                onPressed: handshakeOnPressed ,
               icon: const Icon(Icons.handshake,size: 30,)),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:30.0,top: 30),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width*0.70
                ),
                child: Text(
                  'You have maker order for (${order.stockName}) stock',
                  style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}