class UserModel {
  final String id; // Ensure this field is used
  final String firstname;
  final String lastname;
  final String email;
  final DateTime? dateOfBirth;
  final String? profileImg;

  UserModel({
    required this.id, // Add required id parameter
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.dateOfBirth,
    this.profileImg,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String, // Adjusted the key to '_id' from 'id'
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
      '_id':
          id, // Ensure this key is used in the output JSON (changed 'id' to '_id')
      'firstName': firstname,
      'lastName': lastname,
      'Email': email,
      'BirthDay': dateOfBirth?.toIso8601String(),
      'image': profileImg,
    };
  }

  UserModel copyWith({
    String? id, // Allow changing the id through copyWith
    String? firstname,
    String? lastname,
    String? email,
    DateTime? dateOfBirth,
    String? profileImg,
  }) {
    return UserModel(
      id: id ?? this.id, // Copy the id if it's not passed
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profileImg: profileImg ?? this.profileImg,
    );
  }
}
