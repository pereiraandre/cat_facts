import 'package:bloc/bloc.dart';
import 'package:cat_facts/service/cat_facts.dart';
import 'package:meta/meta.dart';

part 'get_facts_state.dart';

class GetFactsCubit extends Cubit<GetFactsState> {
  GetFactsCubit() : super(GetFactsInitial());

  void getFacts() {
    emit(GetFactsLoading());
    Future.delayed(const Duration(seconds: 3), () async {
      try {
        emit(GetFactsLoaded(catFacts: await FactsService().getFacts()));
      } catch (e) {
        emit(GetFactsError(errorMessage: e.toString()));
      }
    });
  }
}
