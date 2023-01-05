class AllPokemonsModel {
  AllPokemonsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<Result> results;

  factory AllPokemonsModel.fromJson(Map<String, dynamic> json) {
    return AllPokemonsModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<Result>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
