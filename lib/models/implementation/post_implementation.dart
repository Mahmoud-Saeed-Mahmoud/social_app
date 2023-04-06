// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  String? uid;
  String? author;
  String? profileImage;
  String? postContent;
  String? postTime;
  PostModel({
    this.uid = '',
    this.author = '',
    this.profileImage = '',
    this.postContent = '',
    this.postTime = '',
  });

  PostModel copyWith({
    String? uid,
    String? postId,
    String? author,
    String? profileImage,
    String? postContent,
    String? postTime,
  }) {
    return PostModel(
      uid: uid ?? this.uid,
      author: author ?? this.author,
      profileImage: profileImage ?? this.profileImage,
      postContent: postContent ?? this.postContent,
      postTime: postTime ?? this.postTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'author': author,
      'profileImage': profileImage,
      'postContent': postContent,
      'postTime': postTime,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
      postContent:
          map['postContent'] != null ? map['postContent'] as String : null,
      postTime: map['postTime'] != null ? map['postTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(uid: $uid, author: $author, profileImage: $profileImage, postContent: $postContent, postTime: $postTime)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.author == author &&
        other.profileImage == profileImage &&
        other.postContent == postContent &&
        other.postTime == postTime;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        author.hashCode ^
        profileImage.hashCode ^
        postContent.hashCode ^
        postTime.hashCode;
  }
}
