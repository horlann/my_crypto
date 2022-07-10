import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';

class UserTableModel extends UserEntity {
  UserTableModel({
    final String? name,
    final String? email,
    final String? uuid,
    final String? password,
    final String? imageLink,
    final List<String>? favouriteCoins,
  }) : super(
          uuid: uuid ?? '',
          name: name ?? '',
          email: email ?? '',
          password: password ?? '',
          imageLink: imageLink ?? 'https://cdn.mos.cms.futurecdn.net/Ev3irSe2WxYCdyGSx6rDES-320-80.jpg',
          favouriteCoins: favouriteCoins ?? [],
        );

  factory UserTableModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserTableModel(
      name: documentSnapshot.get('name'),
      uuid: documentSnapshot.get('uuid'),
      email: documentSnapshot.get('email'),
      imageLink: documentSnapshot.get('imageLink'),
      favouriteCoins: (documentSnapshot.data() as Map<String, dynamic>).containsKey("favouriteCoins")
          ? (documentSnapshot.get('favouriteCoins'))
          : [],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uuid": uuid,
      "email": email,
      "name": name,
      'password': password,
      'imageLink': imageLink,
      'favouriteCoins': favouriteCoins
    };
  }

  factory UserTableModel.fromEntity(UserEntity userEntity) {
    return UserTableModel(
      name: userEntity.name,
      uuid: userEntity.uuid,
      email: userEntity.email,
      imageLink: userEntity.imageLink,
      favouriteCoins: userEntity.favouriteCoins,
    );
  }
}
