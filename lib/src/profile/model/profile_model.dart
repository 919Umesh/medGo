// lib/src/profile/model/profile_model.dart
class ProfileModel {
  final String profileId;
  final DateTime createdAt;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String? profilePicture;
  final String gender;

  ProfileModel({
    required this.profileId,
    required this.createdAt,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    this.profilePicture,
    required this.gender,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      profileId: json['profile_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      profilePicture: json['profile_picture'] as String?,
      gender: json['gender'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile_id': profileId,
      'created_at': createdAt.toIso8601String(),
      'full_name': fullName,
      'phone_number': phoneNumber,
      'email': email,
      'profile_picture': profilePicture,
      'gender': gender,
    };
  }
}
