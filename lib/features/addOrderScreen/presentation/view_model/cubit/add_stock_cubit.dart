import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';


part 'add_stock_state.dart';

class AddStockCubit extends Cubit<AddStockState> {
  AddStockCubit() : super(AddStockInitial());

addStockToHive({required ordermodel order,context})async{

emit(AddStockLoading());
var databox = Hive.box<ordermodel>(UsableNames.boxName);
  var historyBox = Hive.box<ordermodel>(UsableNames.inHistoryBoxName);
try {
  
  for (var e in databox.values.toList()){
    if(order.lotNum == e.lotNum ){
       
      emit(AddStockFailure(errorMessgae: 'Item with ID ${order.lotNum} already exists.'));
      return;
    }
  }
  await historyBox.add(order);
  ordermodel newOrder = order;
  await databox.add(newOrder);
  emit(AddStockSucess());
  
}

 catch (e) {
  emit(AddStockFailure(errorMessgae: 'Error'));
}
}
}
