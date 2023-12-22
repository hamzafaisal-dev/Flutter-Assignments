// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FriendModel {
  const FriendModel({
    required this.friendId,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.profileAvatar,
    required this.createdTime,
  });

  final String friendId;
  final String name;
  final String email;
  final String contactNumber;
  final String profileAvatar;
  final DateTime createdTime;

  FriendModel copyWith({
    String? friendId,
    String? name,
    String? email,
    String? contactNumber,
    String? profileAvatar,
    DateTime? createdTime,
  }) {
    return FriendModel(
      friendId: friendId ?? this.friendId,
      name: name ?? this.name,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      profileAvatar: profileAvatar ?? this.profileAvatar,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'friendId': friendId,
      'name': name,
      'email': email,
      'contactNumber': contactNumber,
      'profileAvatar': profileAvatar,
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      friendId: map['friendId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      contactNumber: map['contactNumber'] as String,
      profileAvatar: map['profileAvatar'] as String,
      createdTime: DateTime.now(),
      // DateTime.fromMillisecondsSinceEpoch(map['createdTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendModel.fromJson(String source) =>
      FriendModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FriendModel(friendId: $friendId, name: $name, email: $email, contactNumber: $contactNumber, profileAvatar: $profileAvatar, createdTime: $createdTime)';
  }
}
