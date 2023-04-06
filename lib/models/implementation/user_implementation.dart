import 'dart:convert';

class UserModel {
  String? uid;
  String? email;
  String? username;
  String? number;
  String? bio;
  String? profileImage;
  String? coverImage;
  UserModel({
    this.uid,
    this.email,
    this.username,
    this.number,
    this.bio,
    this.profileImage,
    this.coverImage,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? username,
    String? number,
    String? bio,
    String? profileImage,
    String? coverImage,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      number: number ?? this.number,
      bio: bio ?? this.bio,
      profileImage: profileImage ?? this.profileImage,
      coverImage: coverImage ?? this.coverImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'username': username,
      'number': number,
      'bio': bio,
      'profileImage': profileImage,
      'coverImage': coverImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
      coverImage:
          map['coverImage'] != null ? map['coverImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, username: $username, number: $number, bio: $bio, profileImage: $profileImage, coverImage: $coverImage)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.username == username &&
        other.number == number &&
        other.bio == bio &&
        other.profileImage == profileImage &&
        other.coverImage == coverImage;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        username.hashCode ^
        number.hashCode ^
        bio.hashCode ^
        profileImage.hashCode ^
        coverImage.hashCode;
  }
}
