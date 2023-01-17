import 'package:cat_facts/cubit/get_facts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Cat Facts',
          style: TextStyle(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 50),
        ),
      ),
      body: BlocBuilder<GetFactsCubit, GetFactsState>(
        builder: (context, state) {
          String finalFacts = 'Tap the button below to fetch a cat fact.';
          if (state is GetFactsLoaded) {
            finalFacts = state.catFacts.facts;
          } else if (state is GetFactsError) {
            finalFacts = state.errorMessage;
          }
          return Center(
            child: Column(
              children: [
                const Spacer(),
                Center(
                  child: Text(
                    finalFacts,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(height: 20,),
                BlocBuilder<GetFactsCubit, GetFactsState>(builder: (context, state){
                  if(state is GetFactsLoading){
                    return const CircularProgressIndicator();
                  }return Container();}),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<GetFactsCubit>(context).getFacts();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey.shade300)),
                  child: const Text('Gimme that fact!',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
