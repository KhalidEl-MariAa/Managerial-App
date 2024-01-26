
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/core/awesome_dialogs.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';
import 'package:kuhl_store/features/addOrderScreen/presentation/view/widgets/custom_TextField.dart';
import 'package:kuhl_store/features/addOrderScreen/presentation/view/widgets/topics.dart';
import 'package:kuhl_store/features/addOrderScreen/presentation/view_model/cubit/add_stock_cubit.dart';

class AddStockView extends StatefulWidget {
  const AddStockView({super.key});

  @override
  State<AddStockView> createState() => _AddStockViewState();
}


class _AddStockViewState extends State<AddStockView> {
  DateTime? entrydate;
  DateTime? expirydate;
  GlobalKey<FormState> form = GlobalKey();
  late String stockname;
  late String? lotNum='';
  late int? daysremains;
  late double amount;
  String packets = '1';
  String elementsNumber = '1';
  late String orderLimit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: UsableNames.col,
      ),
      body: Form(
        key: form,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Topic(topicName: 'Stock Data :', topPadding: 25),
                  CustomTextField(
                    validate: true,
                    onchanged: (p0) {
                      stockname = p0;
                    },
                    labeltext: 'Stock Name',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      hinttext:
                          'Something make your stock special:code number',
                      validate: true,
                      onchanged: (p0) {
                        lotNum = p0;
                      },
                      labeltext: 'Unique ID'),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 65,
                  ),
                  const Topic(
                    topicName: 'Entry date :',
                    topPadding: 0,
                  ),
                  CustomTextField(
                    validate: false,
                    readonly: true,
                    onchanged: (p0) {},
                    hinttext: entrydate == null
                        ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                        : '${entrydate!.day}/${entrydate!.month}/${entrydate!.year}',
                    ontap: () async {
                      entrydate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2090),
                      );
                      entrydate ??= DateTime.now();
                      setState(() {});
                    },
                  ),
                  const Topic(
                    topicName: 'Expiry date :',
                    topPadding: 20,
                  ),
                  CustomTextField(
                    validate: false,
                    readonly: true,
                    onchanged: (p0) {},
                    hinttext: expirydate == null
                        ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                        : '${expirydate!.day}/${expirydate!.month}/${expirydate!.year}',
                    ontap: () async {
                      expirydate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2090),
                      );
                      expirydate ??= DateTime.now();
                      setState(() {});
                    },
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 65,
                  ),
                  const Topic(
                    topicName: 'Amount :',
                    topPadding: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: CustomTextField(
                            keyboardType: TextInputType.number,
                            labeltext: 'Packets',
                            hinttext: 'Default 1',
                            onchanged: (p0) {
                              packets = p0;
                            },
                            validate: true),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: CustomTextField(
                            keyboardType: TextInputType.number,
                            labeltext: 'Elments Number ',
                            hinttext: 'Default 1',
                            onchanged: (p0) {
                              elementsNumber = p0;
                            },
                            validate: true),
                      ),
                    ],
                  ),  
                  const SizedBox(height: 20,),
                  SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: CustomTextField(
                            keyboardType: TextInputType.number,
                            labeltext: 'Least amount',
                            hinttext: 'When you will need order',
                            onchanged: (p0) {
                              orderLimit = p0;
                            },
                            validate: true),
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocListener<AddStockCubit, AddStockState>(
                    listener: (context, state) {
                      if(state is AddStockSucess){
                        AwesomeDialogs.buildAwesomeDialogSucess(
                          context: context,onpressed: (){},
                          title: 'Your Stock has been added Sucessfully!',
                          desc: 'Keep working').show();
                        Future.delayed(const Duration(seconds: 2),() {
                          Navigator.pop(context);
                          Navigator.pop(context,true);
                        },);
                      }
                      else if (state is AddStockFailure){
                        AwesomeDialogs.buildAwesomeDialogFailure(context: context,state:  state,title: 'Sorry The process is failed').show();
                      }
                    },

                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: UsableNames.col),
                          onPressed: () async{
                            if (form.currentState!.validate()) {
                              ordermodel stock = ordermodel(
                                orderLimit: int.parse(orderLimit) ,
                                stockName: stockname,
                                lotNum: lotNum??'',
                                entryDate: entrydate?? DateTime.now(),
                                expiryDate: expirydate??DateTime.now(),
                                initialAmount: int.parse(packets) * int.parse(elementsNumber),
                                currentAmount: int.parse(packets) * int.parse(elementsNumber)
                              );
                        await BlocProvider.of<AddStockCubit>(context).addStockToHive(order: stock);
                            }
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

/*
 CustomTextField(
                    readonly: true,
                    onchanged: (p0){}, 
                hinttext: entrydate==null?
                 '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}':
                 '${entrydate!.day}/${entrydate!.month}/${entrydate!.year}',
                    ontap: () async{
                     entrydate = await showDatePicker(context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(1523),
                       lastDate: DateTime(1590),
                       );
                       setState(() {
                         
                       });
                    },),
                    */