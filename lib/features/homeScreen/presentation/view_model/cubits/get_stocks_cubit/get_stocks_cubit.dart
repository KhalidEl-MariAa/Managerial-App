


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';


import 'package:kuhl_store/features/homeScreen/data/repos/home_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/get_stocks_cubit/get_stocks_state.dart';


class GetStocksCubit extends Cubit<GetStocksState> {
  GetStocksCubit(this.homeRepo) : super(GetStocksInitial());
 final HomeRepo homeRepo;
   getdata(){

  emit(GetStocksLoading());
  var result= homeRepo.getDataRepo();
  result.fold(
    (l) {
      emit(GetStocksFailure(errorMessge: l));
      
    },
     (r) {
      emit(GetStocksSucess(stocks: r));
      
     });
 }
  
  updateAmountByIncrease(index){
    try{
    var box = Hive.box<ordermodel>(UsableNames.boxName);
    var model= box.getAt(index);
    model!.currentAmount=model.currentAmount+1;
    box.putAt(index, model);
    getdata();
    }
    catch(e){
      emit(GetStocksFailure(errorMessge: 'Sorry there was a problem with your process'));
    }
    
  }

  updateAmountByDecrease(index,context){
    try{
    var box = Hive.box<ordermodel>(UsableNames.boxName);
    var model= box.getAt(index);
    
    model!.currentAmount=model.currentAmount-1;
    box.putAt(index, model);
    getdata();
    
    
    
    }
    catch(e){
      emit(GetStocksFailure(errorMessge: 'Sorry there was a problem with your process'));
    }
    
  }

 delStock(index)async{
    try{
    var box = Hive.box<ordermodel>(UsableNames.boxName);
    await box.deleteAt(index);
    getdata();
    }
    catch(e){
      emit(GetStocksFailure(errorMessge: 'Sorry there was a problem with your process'));
    }
    
  }
  
}
