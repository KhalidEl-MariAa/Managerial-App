import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';

class OrderRepo {

  Either<String,List<ordermodel>> getOrdersRepo(){
try{
  var box=Hive.box<ordermodel>(UsableNames.boxName);
  var stocks= box.values.toList();
  List<ordermodel> orders=[];
  for (var e in stocks){
    if(e.currentAmount<=e.orderLimit){
      orders.add(e);
    }
  }
  
  return right(orders);
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