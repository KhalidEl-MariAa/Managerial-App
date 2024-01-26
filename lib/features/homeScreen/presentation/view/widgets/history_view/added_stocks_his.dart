import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/history_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/custom_added_no_Inco.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/history_cubit/historyIN_cubit/history_IN_cubit.dart';

class HistoryAddedStockView extends StatelessWidget {
  const HistoryAddedStockView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => HistoryINCubit(HistoryRepo())..getInHistorydata(),
      child: Scaffold(
        body: BlocBuilder<HistoryINCubit, HistoryINState>(
          builder: (context, state) {
            if(state is HistoryINSucess){
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                    backgroundColor: UsableNames.col,
                    centerTitle: true,
                    title: Text(
                      'Added History',
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    )),
                state.addedStocksHis.isEmpty
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
                        itemCount: state.addedStocksHis.length,
                        itemBuilder: (context, index) =>  Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: CustomAddedStocksHistoryINCView(
                            delOnpressed: (){
                              BlocProvider.of<HistoryINCubit>(context).delStock(index, context);
                            },
                            index: index,
                            order: state.addedStocksHis[index],
                          ),
                        ),
                      )
              ],
            );
          } 
          else if (state is HistoryINfailure){
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
