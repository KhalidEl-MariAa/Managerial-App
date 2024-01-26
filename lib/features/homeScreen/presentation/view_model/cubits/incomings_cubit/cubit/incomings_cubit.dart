

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/awesome_dialogs.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/incoming_repo.dart';

part 'incomings_state.dart';

class IncomingsCubit extends Cubit<IncomingsState> {
  IncomingsCubit(this.incomingRepo) : super(IncomingsInitial());
IncomingRepo incomingRepo;

  
  getIncomingsdata(){

  emit(Incomingsoading());
  var result= incomingRepo.getIncomingsRepo();
  result.fold(
    (l) {
      emit(IncomingsFailure(errorMessge: l));
      
    },
     (r) {
      emit(IncomingsSucess(incomings: r));
      
     });
 }

  Future<void> addIncomingToHistory(ordermodel order,context)async {
  
   var historyBox = Hive.box<ordermodel>(UsableNames.outHistoryBoxName);
   
   for (var e in historyBox.values.toList()){
    if(order.lotNum == e.lotNum){
     await AwesomeDialogs.buildAwesomeDialogForHistoryFailure( context,  'You have recieved this order before').show();
    return;
    }
   }
     order.recieved=true;
     await historyBox.add(order);
    AwesomeDialogs.buildAwesomeDialogForHistorySucess(context).show();
   
  
  
   
 }
 
   
 }
  

