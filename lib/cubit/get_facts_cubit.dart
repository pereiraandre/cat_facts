import 'package:bloc/bloc.dart';
import 'package:cat_facts/model/facts_model.dart';
import 'package:cat_facts/service/cat_facts.dart';
import 'package:meta/meta.dart';

part 'get_facts_state.dart';

class GetFactsCubit extends Cubit<GetFactsState> {
  GetFactsCubit() : super(GetFactsInitial());
  FactsService factsService = FactsService();

  void getFacts() {
    emit(GetFactsLoading());
    Future.delayed(const Duration(seconds: 3), () async {
      try {
        final FactsModel? facts = await factsService.getFacts();
        emit(GetFactsLoaded(catFacts: facts));
      } catch (e) {
        emit(GetFactsError(errorMessage: e.toString()));
      }
    });
  }
}
