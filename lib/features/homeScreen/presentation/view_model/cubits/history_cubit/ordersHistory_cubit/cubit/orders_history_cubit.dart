import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/history_repo.dart';
import 'package:meta/meta.dart';

part 'orders_history_state.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryState> {
  OrdersHistoryCubit(this.historyRepo) : super(OrdersHistoryInitial());
   final HistoryRepo historyRepo;
   getOrderedHistorydata(){

  emit(OrderHistoryLoading());
  var result= historyRepo.getOrderedHistoryDataRepo();
  result.fold(
    (l) {
     emit(OrderHistoryfailure());
      
    },
     (r) {
       emit(OrderHistorySucess(orderedStocksHis:r ));
      
      
     });
 }

delStock(index,context)async{
    try{
    var box = Hive.box<ordermodel>(UsableNames.ordersHistoryBoxName);
    await box.deleteAt(index);
    ScaffoldMessenger.of(context).showSnackBar
     (const SnackBar(content: Text('deleted Successfully'),duration: Duration(seconds: 2),));
   
    getOrderedHistorydata();
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar
                              (const SnackBar(content: Text('There was an Error,Try again!'),duration: Duration(seconds: 2),));
      
    }
    
  }
}
