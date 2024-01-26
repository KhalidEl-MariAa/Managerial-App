

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuhl_store/core/awesome_dialogs.dart';
import 'package:kuhl_store/core/usable_names.dart';

import 'package:kuhl_store/features/homeScreen/presentation/view/widgets/incoming_views/custom_incoming_view.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view_model/cubits/incomings_cubit/cubit/incomings_cubit.dart';

class IncomingsView extends StatelessWidget {
  const IncomingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomingsCubit, IncomingsState>(
        builder: (context, state) {
      if (state is IncomingsSucess) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
                backgroundColor: UsableNames.col,
                centerTitle: true,
                title: Text(
                  'Incomings',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                )),
            state.incomings.isEmpty
                ? const SliverFillRemaining(
                    child: Center(
                    child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Empty...There is no incomings',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ))
                : SliverList.builder(
                    itemCount: state.incomings.length,
                    itemBuilder: (context, index) =>
                        CustomIncomingCard(
                            handshakeOnPressed: ()async {
                    state.incomings[index].incomingDate=DateTime.now();
                              try{
                
                await BlocProvider.of<IncomingsCubit>(context).addIncomingToHistory(state.incomings[index],context);
                
                              }
                              catch(e){
                          AwesomeDialogs.buildAwesomeDialogForHistoryFailure(context, 'Sorry...There was a problem with your process').show();
                              }
                              
                            },
                            order: state.incomings[index]))
          ],
        );
      } else if (state is IncomingsFailure) {
        AwesomeDialogs.buildAwesomeDialogFailure(context: context,state:  state,title: 'Sorry The process is failed').show();
        return const Center(child: Text('Sorry'));
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: Color.fromRGBO(97, 65, 153, 1),
          ),
        );
      }
    });
  }
}
