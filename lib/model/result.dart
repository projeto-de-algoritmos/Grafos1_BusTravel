class TravelResult {
  String from;
  String fromSymbol;
  String to;
  String toSymbol;
  double? cheapestTravel;
  int? shortestTravel;

  TravelResult({
    required this.from,
    required this.fromSymbol,
    required this.to,
    required this.toSymbol,
    required this.cheapestTravel,
    required this.shortestTravel,
  });
}
