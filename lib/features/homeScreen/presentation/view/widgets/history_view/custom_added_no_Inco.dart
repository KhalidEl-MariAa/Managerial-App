import 'package:flutter/material.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';

class CustomAddedStocksHistoryINCView extends StatelessWidget {
  const CustomAddedStocksHistoryINCView({super.key,required this.order, required this.index,required this.delOnpressed});
  final ordermodel order;
  final int index;
  final void Function()? delOnpressed;



  @override
  Widget build(BuildContext context) {
    return  Container(
                        height: 50,
                        
                          decoration: const BoxDecoration(
                          color: Color.fromARGB(100,135, 206, 250)

                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(index.toString()),
                            Text(order.stockName),
                            Text('${order.entryDate!.day}/${order.entryDate!.month}/${order.entryDate!.year}'),
                            Text('${order.initialAmount}'),
                            IconButton(onPressed: delOnpressed, icon:const Icon(Icons.delete,color: Colors.black,)),
                            ],
                        ),
                      );
  }
}