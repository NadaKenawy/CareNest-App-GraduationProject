class UserModel {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final DateTime? dateOfBirth;
  final String? profileImg;
  final bool createFeedback;
  final String? babyImage;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.dateOfBirth,
    this.profileImg,
    required this.createFeedback,
    this.babyImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String,
      firstname: json['firstName'] as String,
      lastname: json['lastName'] as String,
      email: json['Email'] as String,
      dateOfBirth: json['BirthDay'] != null
          ? DateTime.tryParse(json['BirthDay'] as String)
          : null,
      profileImg: json['image'] as String?,
      createFeedback: json['createFeedback'] ?? false,
      babyImage: json['babyImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstname,
      'lastName': lastname,
      'Email': email,
      'BirthDay': dateOfBirth?.toIso8601String(),
      'image': profileImg,
      'createFeedback': createFeedback,
      'babyImage': babyImage,
    };
  }

  UserModel copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    DateTime? dateOfBirth,
    String? profileImg,
    bool? createFeedback,
    String? babyImage,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profileImg: profileImg ?? this.profileImg,
      createFeedback: createFeedback ?? this.createFeedback,
      babyImage: babyImage ?? this.babyImage,
    );
  }
}
