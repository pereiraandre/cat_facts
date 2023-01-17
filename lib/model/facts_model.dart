class FactsModel {
  final String? facts;
  FactsModel(this.facts);

  FactsModel.fromJson(Map<String, dynamic> json)
  : facts = json['fact'];

  Map<String, dynamic> toJson() => {
    'fact' : facts
  };

}