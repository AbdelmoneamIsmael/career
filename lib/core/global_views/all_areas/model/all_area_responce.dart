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

  final num? pageIndex;
  final num? pageSize;
  final num? count;
  final num? pagesCount;
  final num? itemsCount;
  final List<Areas> data;

  AllAreasResponse copyWith({
    num? pageIndex,
    num? pageSize,
    num? count,
    num? pagesCount,
    num? itemsCount,
    List<Areas>? data,
  }) {
    return AllAreasResponse(
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      pagesCount: pagesCount ?? this.pagesCount,
      itemsCount: itemsCount ?? this.itemsCount,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "count": count,
        "pagesCount": pagesCount,
        "itemsCount": itemsCount,
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$pageIndex, $pageSize, $count, $pagesCount, $itemsCount, $data, ";
  }
}

class Areas {
  factory Areas.fromJson(Map<String, dynamic> json) {
    return Areas(
      id: json["id"],
      name: json["name"],
      governorateId: json["governorateId"],
    );
  }
  Areas({
    required this.id,
    required this.name,
    required this.governorateId,
  });

  final int? id;
  final String? name;
  final num? governorateId;

  Areas copyWith({
    int? id,
    String? name,
    num? governorateId,
  }) {
    return Areas(
      id: id ?? this.id,
      name: name ?? this.name,
      governorateId: governorateId ?? this.governorateId,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "governorateId": governorateId,
      };

  @override
  String toString() {
    return "$id, $name, $governorateId, ";
  }
}
