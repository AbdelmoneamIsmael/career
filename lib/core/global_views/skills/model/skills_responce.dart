import 'package:equatable/equatable.dart';

class SkillsResponse {
  factory SkillsResponse.fromJson(Map<String, dynamic> json) {
    return SkillsResponse(
      pageIndex: json["pageIndex"],
      pageSize: json["pageSize"],
      count: json["count"],
      pagesCount: json["pagesCount"],
      itemsCount: json["itemsCount"],
      data: json["data"] == null
          ? []
          : List<Skill>.from(json["data"]!.map((x) => Skill.fromJson(x))),
    );
  }
  SkillsResponse({
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
  final List<Skill> data;
}

class Skill extends Equatable {
  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json["id"],
      name: json["name"],
    );
  }
  const Skill({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
