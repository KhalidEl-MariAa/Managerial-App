import 'package:flutter/material.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';

class CustomAddedStocksHistoryView extends StatelessWidget {
  const CustomAddedStocksHistoryView({super.key,required this.order, required this.index,required this.delOnpressed});
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
                            Text('${order.incomingDate!.day}/${order.incomingDate!.month}/${order.incomingDate!.year}'),
                            IconButton(onPressed: delOnpressed, icon: const Icon(Icons.delete,color: Colors.black,))],
                        ),
                      );
  }
}