class AllGovernoratesResponse {
  factory AllGovernoratesResponse.fromJson(Map<String, dynamic> json) {
    return AllGovernoratesResponse(
      pageIndex: json["pageIndex"],
      pageSize: json["pageSize"],
      count: json["count"],
      pagesCount: json["pagesCount"],
      itemsCount: json["itemsCount"],
      data: json["data"] == null
          ? []
          : List<Governerates>.from(json["data"]!.map((x) => Governerates.fromJson(x))),
    );
  }
  AllGovernoratesResponse({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.pagesCount,
    required this.itemsCount,
    required this.data,
  });

  final int? pageIndex;
  final int? pageSize;
  final int? count;
  final int? pagesCount;
  final int? itemsCount;
  final List<Governerates> data;
}

class Governerates {
  factory Governerates.fromJson(Map<String, dynamic> json) {
    return Governerates(
      id: json["id"],
      name: json["name"],
    );
  }
  Governerates({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;
}
