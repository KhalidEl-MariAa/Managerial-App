
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/history_repo.dart';

part 'history_IN_state.dart';

class HistoryINCubit extends Cubit<HistoryINState> {
  HistoryINCubit(this.historyRepo) : super(HistoryINInitial());
 final HistoryRepo historyRepo;
 getInHistorydata(){

  emit(HistoryINLoading());
  var result= historyRepo.getInHistoryDataRepo();
  result.fold(
    (l) {
     emit(HistoryINfailure());
      
    },
     (r) {
       emit(HistoryINSucess(addedStocksHis:r ));
      
      
     });
 }
delStock(index,context)async{
    try{
    var box = Hive.box<ordermodel>(UsableNames.inHistoryBoxName);
    await box.deleteAt(index);
   ScaffoldMessenger.of(context).showSnackBar
    (const SnackBar(content: Text('deleted Successfully'),duration: Duration(seconds: 2),));
    getInHistorydata();
    }
    catch(e){
     ScaffoldMessenger.of(context).showSnackBar
    (const SnackBar(content: Text('There was an Error, Try again!'),duration: Duration(seconds: 2),));
      
    }
    
  }
 
}