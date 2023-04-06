import 'dart:convert';

class MessageModel {
  String? snederId;
  String? senderProfileImage;
  String? receiverId;
  String? receiverProfileImage;
  String? message;
  String? timeStamps;
  MessageModel({
    this.snederId,
    this.senderProfileImage,
    this.receiverId,
    this.receiverProfileImage,
    this.message,
    this.timeStamps,
  });

  MessageModel copyWith({
    String? snederId,
    String? senderProfileImage,
    String? receiverId,
    String? receiverProfileImage,
    String? message,
    String? timeStamps,
  }) {
    return MessageModel(
      snederId: snederId ?? this.snederId,
      senderProfileImage: senderProfileImage ?? this.senderProfileImage,
      receiverId: receiverId ?? this.receiverId,
      receiverProfileImage: receiverProfileImage ?? this.receiverProfileImage,
      message: message ?? this.message,
      timeStamps: timeStamps ?? this.timeStamps,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'snederId': snederId,
      'senderProfileImage': senderProfileImage,
      'receiverId': receiverId,
      'receiverProfileImage': receiverProfileImage,
      'message': message,
      'timeStamps': timeStamps,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      snederId: map['snederId'] != null ? map['snederId'] as String : null,
      senderProfileImage: map['senderProfileImage'] != null
          ? map['senderProfileImage'] as String
          : null,
      receiverId:
          map['receiverId'] != null ? map['receiverId'] as String : null,
      receiverProfileImage: map['receiverProfileImage'] != null
          ? map['receiverProfileImage'] as String
          : null,
      message: map['message'] != null ? map['message'] as String : null,
      timeStamps:
          map['timeStamps'] != null ? map['timeStamps'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(snederId: $snederId, senderProfileImage: $senderProfileImage, receiverId: $receiverId, receiverProfileImage: $receiverProfileImage, message: $message, timeStamps: $timeStamps)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.snederId == snederId &&
        other.senderProfileImage == senderProfileImage &&
        other.receiverId == receiverId &&
        other.receiverProfileImage == receiverProfileImage &&
        other.message == message &&
        other.timeStamps == timeStamps;
  }

  @override
  int get hashCode {
    return snederId.hashCode ^
        senderProfileImage.hashCode ^
        receiverId.hashCode ^
        receiverProfileImage.hashCode ^
        message.hashCode ^
        timeStamps.hashCode;
  }
}
