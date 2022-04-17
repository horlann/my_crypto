import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    final String? name,
    final String? email,
    final String? uuid,
    final String? password,
    final String? imageLink,
  }) : super(
          uuid: uuid ?? '',
          name: name ?? '',
          email: email ?? '',
          password: password ?? '',
          imageLink: imageLink ?? 'https://cdn.mos.cms.futurecdn.net/Ev3irSe2WxYCdyGSx6rDES-320-80.jpg',
        );

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      name: documentSnapshot.get('name'),
      uuid: documentSnapshot.get('uuid'),
      email: documentSnapshot.get('email'),
      imageLink: documentSnapshot.get('imageLink'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {"uuid": uuid, "email": email, "name": name, 'password': password, 'imageLink': imageLink};
  }
}
