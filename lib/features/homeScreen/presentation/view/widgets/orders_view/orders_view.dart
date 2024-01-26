import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/core/awesome_dialogs.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/order_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/orders_view/custom_order_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/orders_cubit/cubit/orders_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
   
    return BlocProvider(
      create: (context) => OrdersCubit(OrderRepo())..getOrdersdata(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if(state is OrderSucess){
          return CustomScrollView(
            slivers: [
             const SliverAppBar(
                  backgroundColor: UsableNames.col,
                  centerTitle: true,
                  title: Text(
                    'Orders',
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  )),
              state.orders.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(
                      child: Opacity(
                          opacity: 0.5,
                          child: Text(
                            'Empty...There is no needed orders',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ))
                  : SliverList.builder(
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) =>
                          CustomOrderCard(
                            order: state.orders[index],
                            toTrueOnPressed: () {
                              
                              BlocProvider.of<OrdersCubit>(context).addOrderToOrderHistory(state.orders[index], context,index);
                            },)
                    )
            ],
          );} 
          else if(state is OrderFailure){
           AwesomeDialogs.buildAwesomeDialogFailure(context: context, state: state,title: 'Sorry The process is failed').show();
          return const Center(child: Text('Sorry'));
         
          
        }
        else{
          return const Center(child: CircularProgressIndicator(color:Color.fromRGBO(97, 65, 153, 1) ,),);
        }
                 },
      ),
    );
  }
}
