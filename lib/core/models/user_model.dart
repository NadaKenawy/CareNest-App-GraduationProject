class UserModel {
  final String firstname;
  final String lastname;
  final String email;
  final DateTime? dateOfBirth;
  final String? profileImg;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.dateOfBirth,
    this.profileImg,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstName'] as String,
      lastname: json['lastName'] as String,
      email: json['Email'] as String,
      dateOfBirth: json['BirthDay'] != null
          ? DateTime.tryParse(json['BirthDay'] as String)
          : null,
      profileImg: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstname,
      'lastName': lastname,
      'Email': email,
      'BirthDay': dateOfBirth?.toIso8601String(),
      'image': profileImg,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    DateTime? dateOfBirth,
    String? profileImg,
  }) {
    return UserModel(
      firstname: name ?? firstname,
      lastname: lastname,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth,
      profileImg: profileImg ?? this.profileImg,
    );
  }
}
