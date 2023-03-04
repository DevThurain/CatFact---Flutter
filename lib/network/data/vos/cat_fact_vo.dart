import 'package:json_annotation/json_annotation.dart';
part 'cat_fact_vo.g.dart';

@JsonSerializable()
class CatFactVO {
  @JsonKey(name: "fact")
  String? fact;

  CatFactVO({this.fact});

  factory CatFactVO.fromJson(Map<String, dynamic> json) =>
      _$CatFactVOFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactVOToJson(this);
}
