import 'package:json_annotation/json_annotation.dart';
part 'get_online_users_response.g.dart';
@JsonSerializable()
class GetOnlineUsersResponse {
  final String status;
  final int results;
  final List<User> data;

  GetOnlineUsersResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory GetOnlineUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOnlineUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOnlineUsersResponseToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'Email')
  final String email;
  final String firstName;
  final String lastName;
  final String ? image;
  final String lastSeen;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
     this.image,
    required this.lastSeen,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

