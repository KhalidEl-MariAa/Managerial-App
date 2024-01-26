import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/features/homeScreen/data/repos/incoming_repo.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/bottom_nav_bar.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/history_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/incoming_views/incoming_views.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/orders_view/orders_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/stocks_view/stocks_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/incomings_cubit/cubit/incomings_cubit.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

int currentIndex = 0;
List views =  [
  const StocksView(),
  const OrdersView(),
  BlocProvider(
    create:  (context) => IncomingsCubit(IncomingRepo())..getIncomingsdata(),
      
    
    child:const IncomingsView(),
  ),
  const HistoryView()
];

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: views[currentIndex],
            bottomNavigationBar: BottomNavBar(
              ontap: (p0) {
                setState(() {
                  currentIndex = p0;
                });
              },
            )));
  }
}
