import 'package:dio_practice/model/User.dart';
import 'package:json_serializable/builder.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SingleUserResponse.g.dart';

@JsonSerializable()
class SingleUserResponse{
  SingleUserResponse();

  @JsonKey(name: "data")
  User? user;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) => _$SingleUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);
}