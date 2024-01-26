import 'package:flutter/material.dart';
import 'package:kuhl_store/core/AnimatedNavigation.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/added_stocks_his.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/history_item_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/recieved_stocks_his.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/orders_history.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        
        
        children: [
          AppBar(
             backgroundColor: UsableNames.col,
                centerTitle: true,
                title: const Text(
                  'Orders',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.07),
          HistoryItemView(title: 'Added History',ontap: (){
            Navigator.of(context).push(AnimatedScaleTransition(page: const HistoryAddedStockView() ));
          }),
          const SizedBox(height: 40,),
          HistoryItemView(title: 'Orders History', ontap: (){Navigator.of(context).push(AnimatedScaleTransition(page: const OrderedHistoryView()));
          }),
          const SizedBox(height: 40,),
          HistoryItemView(title: 'Recieved Orders History', ontap: () {
             Navigator.of(context).push(AnimatedScaleTransition(page: const HistoryRecievedOrderedStockView() ));
          },),
          
          
        ],
      ),
    );
  }
}

