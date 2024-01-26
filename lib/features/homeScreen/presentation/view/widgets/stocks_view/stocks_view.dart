import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/core/AnimatedNavigation.dart';
import 'package:kuhl_store/core/awesome_dialogs.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/presentation/view/add_stock_screen.dart';
import 'package:kuhl_store/features/addOrderScreen/presentation/view_model/cubit/add_stock_cubit.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/home_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/stocks_view/custom_stock_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/get_stocks_cubit/get_stocks_cubit.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/get_stocks_cubit/get_stocks_state.dart';

class StocksView extends StatefulWidget {
  const StocksView({super.key});

  @override
  State<StocksView> createState() => _StocksViewState();
}

class _StocksViewState extends State<StocksView> {

  @override
  void initState() {
    super.initState();
   
  }


  
  @override
  Widget build(BuildContext context) {
    
    return 
    BlocProvider(
      create: (context) {
        return GetStocksCubit(HomeRepo())..getdata();
              },
      child: BlocBuilder<GetStocksCubit,GetStocksState>(
        
        builder: (context, state) {
        if(state is GetStocksSucess ){
             
           return CustomScrollView(
               slivers: [
            SliverAppBar(
              backgroundColor:UsableNames.col,
              centerTitle: true,
              title: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: ()async{
                  
                var x= await  Navigator.of(context).push(AnimatedTransition(page: BlocProvider(
                  create: (context) => AddStockCubit(),
                  child: const AddStockView())));
                if(x==true){
                  // ignore: use_build_context_synchronously
                  BlocProvider.of<GetStocksCubit>(context).getdata();}
               
                },
                 child: const Text('Add new stock',style: TextStyle(color:Colors.black,fontStyle: FontStyle.italic),)
              ),
              ),
              
              state.stocks.isEmpty? 
              const SliverFillRemaining(
                child: Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: Text('Empty...There is no stocks',style: TextStyle(fontWeight: FontWeight.bold),)),
                  )
              )
              :
              SliverList.builder(
                
                itemCount: state.stocks.length,
                itemBuilder: (context, index) => CustomStockCard(
                  delOnPressed:(){
               BlocProvider.of<GetStocksCubit>(context).delStock(index);
                  },
                   addOnpressed: () {
                           
                              BlocProvider.of<GetStocksCubit>(context).updateAmountByIncrease(index);
                            },
                            minusOnpressed: () {
                              if(state.stocks[index].currentAmount>0){
                              BlocProvider.of<GetStocksCubit>(context).updateAmountByDecrease(index,context);
                              }
                              else{
      AwesomeDialogs.buildAwesomeDialogDecreaseFailure(context: context, title: "Can't use Negative Numbers").show();
    }
                            },
                  order: state.stocks[index],
                  ),
                )
              
            ],
             );
         
        }
      
        else if(state is GetStocksFailure){
           AwesomeDialogs.buildAwesomeDialogFailure(context: context,state: state,title: 'Sorry The process is failed').show();
          return const Center(child: Text('Sorry'));
         
          
        }
        else{
          return const Center(child: CircularProgressIndicator(color:Color.fromRGBO(97, 65, 153, 1) ,),);
        }
      },),
    );
  }
}
