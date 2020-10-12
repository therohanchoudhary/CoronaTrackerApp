class APIObject {
  final int totalConfirmed;
  final int totalDeaths;
  final int totalRecovered;
  APIObject({this.totalConfirmed, this.totalDeaths, this.totalRecovered});

  factory APIObject.fromJson(Map<String, dynamic> json) {
    return APIObject(
      totalConfirmed: json['Global']['TotalConfirmed'],
      totalDeaths: json['Global']['TotalDeaths'],
      totalRecovered: json['Global']['TotalRecovered'],
    );
  }
}
