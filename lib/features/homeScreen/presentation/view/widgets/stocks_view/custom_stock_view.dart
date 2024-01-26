import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';


class CustomStockCard extends StatelessWidget {
  const CustomStockCard({
    super.key,
     required this.order,
     required this.minusOnpressed,
     required this.addOnpressed,
     required this.delOnPressed
});
   final ordermodel order;
   final void Function()? minusOnpressed;
   final void Function()? addOnpressed;
   final void Function()? delOnPressed;

   

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
             
              subtitle: Column(
                
                children: [
                const SizedBox(height: 30,),
                  RichText(
                    text:  TextSpan(
                    text: 'Special Code : ',
                    style:  const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 81, 84, 206)),
                    children: [
                      TextSpan(
                        text: order.lotNum ?? 'No',
                        style: const TextStyle(color: Colors.black)
                      )
                    ]
                  )
                  ),
                  const SizedBox(height: 5,),
                  RichText(
                    text:  TextSpan(
                    text: 'Entry date : ',
                    style:  const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 81, 84, 206)),
                    children: [
                      TextSpan(
                        text: '${order.entryDate!.day}/${order.entryDate!.month}/${order.entryDate!.year}',
                        style: const TextStyle(color: Colors.black)
                      )
                    ]
                  )
                  ),const SizedBox(height: 5,),
                  RichText(
                    text:  TextSpan(
                    text: 'Expiry date : ',
                    style:  const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 81, 84, 206)),
                    children: [
                      TextSpan(
                        text:'${order.expiryDate!.day}/${order.expiryDate!.month}/${order.expiryDate!.year}',
                        style: const TextStyle(color: Colors.black)
                      )
                    ]
                  )
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: delOnPressed,
               icon: const Icon(Icons.delete,size: 30,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                    IconButton
                   (onPressed:minusOnpressed,
                    icon: const Icon(FontAwesomeIcons.minus)),
                   Text('${order.currentAmount}'),
                   IconButton
                   (onPressed:addOnpressed ,
                    icon: const Icon(FontAwesomeIcons.plus))
              
                   ],
                    )
          ],
        ),
      ),
    );
  }
}