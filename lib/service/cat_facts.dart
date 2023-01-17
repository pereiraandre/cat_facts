import 'package:cat_facts/service/network.dart';

import '../model/facts_model.dart';

class FactsService {
  
  Future<FactsModel?> getFacts() async {
    NetworkHelper networkHelper = NetworkHelper('https://catfact.ninja/fact');
    var catFacts = await networkHelper.getData();
    if(catFacts == null){
      return null;
    }
    FactsModel factsModel = FactsModel.fromJson(catFacts);
    return factsModel;
    
  }
}