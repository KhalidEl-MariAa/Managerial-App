import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/added_stocks_his.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/history_view/recieved_stocks_his.dart';

import 'core/routes.dart';
import 'features/addOrderScreen/presentation/view/add_stock_screen.dart';
import 'features/homeScreen/presentation/view/home_screen_view.dart';
import 'features/welcomeScrreen/presentation/view/welcome_screen_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ordermodelAdapter());

  await Hive.openBox<ordermodel>(UsableNames.boxName);
  await Hive.openBox<ordermodel>(UsableNames.inHistoryBoxName);
  await Hive.openBox<ordermodel>(UsableNames.outHistoryBoxName);
  await Hive.openBox<ordermodel>(UsableNames.ordersHistoryBoxName);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        Routes.welcomeScreenView: (context) => const WelcomeScreenView(),
        Routes.homeScreenView: (context) => const HomeScreenView(),
        Routes.addStockView: (context) =>  const   AddStockView(),
        Routes.addedStockHistoryView:(context) => const HistoryAddedStockView(),
        Routes.orderedStockHistoryView:(context) => const HistoryRecievedOrderedStockView()
      },
      initialRoute: Routes.homeScreenView,
    );
  }
}
