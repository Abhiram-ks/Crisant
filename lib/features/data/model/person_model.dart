import 'package:crisent_pannel/features/domain/entity/person_entity.dart';

class PersonModel extends PersonEntity {
  PersonModel({
    required super.uid,
    required super.userName,
    required super.email,
    required super.image,
    required super.fcmToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
      'image': image,
      'fcmToken': fcmToken,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      uid: map['uid'] ?? 'unknown',
      userName: map['userName'] ?? 'unknown user',
      email: map['email'] ?? 'unknown email',
      image: map['image'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
    );
  }
  
  PersonEntity toEntity() {
    return PersonEntity(
      uid: uid,
      userName: userName,
      email: email,
      image: image,
      fcmToken: fcmToken,
    );
  }
}