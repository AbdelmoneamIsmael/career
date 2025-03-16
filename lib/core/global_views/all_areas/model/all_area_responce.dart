class AllAreasResponse {
  factory AllAreasResponse.fromJson(Map<String, dynamic> json) {
    return AllAreasResponse(
      pageIndex: json["pageIndex"],
      pageSize: json["pageSize"],
      count: json["count"],
      pagesCount: json["pagesCount"],
      itemsCount: json["itemsCount"],
      data: json["data"] == null
          ? []
          : List<Areas>.from(json["data"]!.map((x) => Areas.fromJson(x))),
    );
  }
  AllAreasResponse({
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
  final List<Areas> data;
}

class Areas {
  factory Areas.fromJson(Map<String, dynamic> json) {
    return Areas(
      id: json["id"],
      name: json["name"],
    );
  }
  Areas({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;
}
