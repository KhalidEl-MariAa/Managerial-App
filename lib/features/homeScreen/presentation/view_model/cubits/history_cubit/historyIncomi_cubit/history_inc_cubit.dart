

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/history_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/history_cubit/historyIncomi_cubit/history_incomi_state.dart';


class HistoryIncomingCubit extends Cubit<HistoryIncomState> {
  HistoryIncomingCubit(this.historyRepo) : super(HistoryIncomInitial());
 final HistoryRepo historyRepo;
 

  getOutHistorydata(){

  emit(HistoryIncomLoading());
  var result= historyRepo.getRecievedOrderHistoryDataRepo();
  result.fold(
    (l) {
     emit(HistoryIncomfailure());
      
    },
     (r) {
       emit(HistoryIncomSucess(incomStocksHis:r ));
      
      
     });
 }

delStock(index,context)async{
    try{
    var box = Hive.box<ordermodel>(UsableNames.outHistoryBoxName);
    await box.deleteAt(index);
    ScaffoldMessenger.of(context).showSnackBar
     (const SnackBar(content: Text('deleted Successfully'),duration: Duration(seconds: 2),));
   
    getOutHistorydata();
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar
                              (const SnackBar(content: Text('There was an Error,Try again!'),duration: Duration(seconds: 2),));
      
    }
    
  }
}
