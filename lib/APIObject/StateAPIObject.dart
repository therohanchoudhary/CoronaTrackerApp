class StateAPIObject {
  final int totalConfirmed;
  final int discharged;
  final int deaths;

  final int stateNumber;
  StateAPIObject({this.totalConfirmed, this.discharged, this.deaths,this.stateNumber});

  factory StateAPIObject.fromJson(Map<String, dynamic> json, int stateNumber) {
    return StateAPIObject(
      totalConfirmed: json['data']['regional'][stateNumber]['totalConfirmed'],
      discharged: json['data']['regional'][stateNumber]['discharged'],
      deaths: json['data']['regional'][stateNumber]['deaths'],
    );
  }
}
