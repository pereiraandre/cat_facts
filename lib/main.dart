import 'package:cat_facts/cubit/get_facts_cubit.dart';
import 'package:cat_facts/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetFactsCubit>(
      create: (context) => GetFactsCubit(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

