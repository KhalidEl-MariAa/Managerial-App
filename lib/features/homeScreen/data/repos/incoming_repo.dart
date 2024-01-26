import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';

class IncomingRepo {

  Either<String,List<ordermodel>> getIncomingsRepo(){
try{
  var box=Hive.box<ordermodel>(UsableNames.boxName);
  var stocks= box.values.toList();
  List<ordermodel> incomings=[];
  for (var e in stocks){
    if(e.iscoming==true){
    
      incomings.add(e);
    }
  }
  
  return right(incomings);
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