import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/history_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/custom_Ordered_his_item.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/history_cubit/historyIncomi_cubit/history_incomi_state.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/history_cubit/ordersHistory_cubit/cubit/orders_history_cubit.dart';

class OrderedHistoryView extends StatelessWidget {
  const OrderedHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => OrdersHistoryCubit(HistoryRepo())..getOrderedHistorydata(),
      child: Scaffold(
        body: BlocBuilder<OrdersHistoryCubit, OrdersHistoryState>(
          builder: (context, state) {
            if(state is OrderHistorySucess){
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                    backgroundColor: UsableNames.col,
                    centerTitle: true,
                    title: Text(
                      'Orders History',
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    )),
                state.orderedStocksHis.isEmpty
                    ? const SliverFillRemaining(
                        child: Center(
                        child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Empty...',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ))
                    : SliverList.builder(
                        itemCount: state.orderedStocksHis.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: CustomOrderedStocksHistoryView(
                            delOnpressed: (){
                              
                              BlocProvider.of<OrdersHistoryCubit>(context).delStock(index, context);
                            
                            },
                            order: state.orderedStocksHis[index],
                             index: index)
                        ),
                      )
              ],
            );
          } 
          else if (state is HistoryIncomfailure){
             return const Center(child:Text('Sorry for that...There was an error',style:TextStyle(fontWeight: FontWeight.bold) ,));
          }
          else{
            return const Center(child: CircularProgressIndicator(color: Color(0xFF614199),),);
          }
          },
        ),
      ),
    );
  }
}
