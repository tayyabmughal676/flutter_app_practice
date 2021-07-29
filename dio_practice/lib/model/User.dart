import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {

  User();

  @JsonKey(name : "id")
  int? id;

  @JsonKey(name : "email")
  String? email;

  @JsonKey(name : "first_name")
  String? firstName;

  @JsonKey(name : "last_name")
  String? lastName;

  @JsonKey(name : "avatar")
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}

// int? id;
// String? email;
// String? firstName;
// String? lastName;
// String? avatar;
//
// User({this.id, this.email, this.firstName, this.lastName, this.avatar});
//
// User.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   email = json['email'];
//   firstName = json['first_name'];
//   lastName = json['last_name'];
//   avatar = json['avatar'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['email'] = this.email;
//   data['first_name'] = this.firstName;
//   data['last_name'] = this.lastName;
//   data['avatar'] = this.avatar;
//   return data;
// }
