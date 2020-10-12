class IndiaAPIObject {
  final int deathsIndia;
  final int discharged;
  final int total;

  IndiaAPIObject({this.deathsIndia, this.discharged, this.total});

  factory IndiaAPIObject.fromJson(Map<String, dynamic> json) {
    return IndiaAPIObject(
      deathsIndia: json['data']['summary']['deaths'],
      discharged: json['data']['summary']['discharged'],
      total: json['data']['summary']['total'],
    );
  }
}