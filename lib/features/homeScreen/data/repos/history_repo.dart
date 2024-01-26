import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';

class HistoryRepo{

Either<String,List<ordermodel>> getInHistoryDataRepo(){
try{
  var box=Hive.box<ordermodel>(UsableNames.inHistoryBoxName);
  var stocks= box.values.toList();
  
  return right(stocks);
  }
  catch(e){
    if(e is HiveError){
      return left('Sorry...Problem in storage ');
    }
    else{
      return left('Sorry...There is a problem but not in storage ');
    }
  }


}

Either<String,List<ordermodel>> getRecievedOrderHistoryDataRepo(){
try{
  var box=Hive.box<ordermodel>(UsableNames.outHistoryBoxName);
  var stocks= box.values.toList();
  
  return right(stocks);
  }
  catch(e){
    if(e is HiveError){
      return left('Sorry...Problem in storage ');
    }
    else{
      return left('Sorry...There is a problem but not in storage ');
    }
  }


}

Either<String,List<ordermodel>> getOrderedHistoryDataRepo(){
try{
  var box=Hive.box<ordermodel>(UsableNames.ordersHistoryBoxName);
  var stocks= box.values.toList();
  
  return right(stocks);
  }
  catch(e){
    if(e is HiveError){
      return left('Sorry...Problem in storage ');
    }
    else{
      return left('Sorry...There is a problem but not in storage ');
    }
  }


}

}
