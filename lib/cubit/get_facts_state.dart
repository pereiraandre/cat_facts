part of 'get_facts_cubit.dart';

@immutable
abstract class GetFactsState {}

class GetFactsInitial extends GetFactsState {}

class GetFactsLoading extends GetFactsState {}

class GetFactsLoaded extends GetFactsState {
  var catFacts;
  
  GetFactsLoaded({required this.catFacts});
}

class GetFactsError extends GetFactsState {
  final String errorMessage;
  
  GetFactsError({required this.errorMessage});
}
