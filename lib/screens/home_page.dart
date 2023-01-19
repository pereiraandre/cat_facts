import 'package:cat_facts/cubit/get_facts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Text(
              'Cat Facts',
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
            const Spacer(),
            BlocConsumer<GetFactsCubit, GetFactsState>(
              listenWhen: (oldState, newState) => newState is GetFactsError ,
              listener: (context, state){
                if (state is GetFactsError) {
                Fluttertoast.showToast(msg: state.errorMessage.toString(),
                gravity: ToastGravity.BOTTOM);
                }
              },
              buildWhen: (oldState, newState) => newState is GetFactsLoading || newState is GetFactsLoaded,
              builder: (context, state) {
                String finalFacts = 'Tap the button below to fetch a cat fact.';
                if (state is GetFactsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  );
                } else if (state is GetFactsLoaded) {
                  finalFacts = state.catFacts.facts;
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Text(
                    finalFacts,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GetFactsCubit>(context).getFacts();
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              child: const Text(
                'Gimme that fact!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            const SizedBox(height: 50.0,),
          ],
        ),
      ),
    ));
  }
}
