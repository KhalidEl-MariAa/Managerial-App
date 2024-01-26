

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/awesome_dialogs.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/order_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.orderRepo) : super(OrdersInitial());
  final OrderRepo orderRepo;
   getOrdersdata(){

  emit(OrderLoading());
  var result= orderRepo.getOrdersRepo();
  result.fold(
    (l) {
      emit(OrderFailure(errorMessge: l));
      
    },
     (r) {
      emit(OrderSucess(orders: r));
      
     });
 }
  
   updateIscomingToTrue(index,context)async{
    try{
    var box = Hive.box<ordermodel>(UsableNames.boxName);
    var model= box.getAt(index);
    model!.iscoming=true;
    
    model.isOrdered=true;
    await box.putAt(index, model);
    getOrdersdata();
    }
    catch(e){
      emit(OrderFailure(errorMessge: 'Sorry there was a problem with your process'));
    }
    
  }

   

    Future<void> addOrderToOrderHistory(ordermodel order,context,index)async {
  
   var historyBox = Hive.box<ordermodel>(UsableNames.ordersHistoryBoxName);
   var historyBoxList = historyBox.values.toList();
   
   
 
   
   try{
    for (var e in historyBoxList){
      if(e.lotNum==order.lotNum){
        AwesomeDialogs.buildAwesomeDialogForHistoryFailure( context, "You ordered this order before",).show();
      return;
      }
    }    
     await updateIscomingToTrue(index, context);
     await historyBox.add(order);
     var model= historyBox.getAt(index);
    model!.orderedDate=DateTime.now();
    await historyBox.putAt(index, model);
    AwesomeDialogs.buildAwesomeDialogSucess(
      onpressed: () {
      Navigator.pop(context);
    },
     context: context, 
     title: "Done", 
     desc: 'Check your Incomings and Orders history!').show();
   }
   catch(e){
    AwesomeDialogs.buildAwesomeDialogFailure(context: context, title: "There was an Error").show();
   }
  
  
   
 }

}
