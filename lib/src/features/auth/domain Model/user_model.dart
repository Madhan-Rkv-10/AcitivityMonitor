import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserResponseModel {
  final String email;
  final String name;
  final String profilePic;
  final String token;
  final String uid;
  UserResponseModel({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.token,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'profilePic': profilePic,
      'token': token,
      'uid': uid,
    };
  }

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      token: map['token'] ?? '',
      uid: map['_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromJson(String source) =>
      UserResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserResponseModel copyWith({
    String? email,
    String? name,
    String? proilePic,
    String? token,
    String? uid,
  }) {
    return UserResponseModel(
      email: email ?? this.email,
      name: name ?? this.name,
      profilePic: proilePic ?? this.profilePic,
      token: token ?? this.token,
      uid: uid ?? this.uid,
    );
  }
}
