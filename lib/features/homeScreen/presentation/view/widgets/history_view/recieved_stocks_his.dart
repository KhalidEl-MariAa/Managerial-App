import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/history_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/custom_added_stock_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/history_cubit/historyIncomi_cubit/history_inc_cubit.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/history_cubit/historyIncomi_cubit/history_incomi_state.dart';

class HistoryRecievedOrderedStockView extends StatelessWidget {
  const HistoryRecievedOrderedStockView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => HistoryIncomingCubit(HistoryRepo())..getOutHistorydata(),
      child: Scaffold(
        body: BlocBuilder<HistoryIncomingCubit, HistoryIncomState>(
          builder: (context, state) {
            if(state is HistoryIncomSucess){
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                    backgroundColor: UsableNames.col,
                    centerTitle: true,
                    title: Text(
                      'Recieved Orders History',
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    )),
                state.incomStocksHis.isEmpty
                    ? const SliverFillRemaining(
                        child: Center(
                        child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Empty...',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ))
                    : SliverList.builder(
                        itemCount: state.incomStocksHis.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: CustomAddedStocksHistoryView(
                            delOnpressed: (){
                              
                              BlocProvider.of<HistoryIncomingCubit>(context).delStock(index, context);
                            
                            },
                            order: state.incomStocksHis[index],
                             index: index)
                        ),
                      )
              ],
            );
          } 
          else if (state is HistoryIncomfailure){
             return const Center(child:Text('Sorry for that...There was an error',style:TextStyle(fontWeight: FontWeight.bold) ,));
          }
          else{
            return const Center(child: CircularProgressIndicator(color: Color(0xFF614199),),);
          }
          },
        ),
      ),
    );
  }
}
