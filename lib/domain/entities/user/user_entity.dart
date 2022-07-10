import 'package:my_crypto/data/api/models/user_model.dart';

class UserEntity {
  final String uuid;
  final String name;
  final String imageLink;
  final String email;
  final String password;
  final List<String> favouriteCoins; //listt of their slugs

//<editor-fold desc="Data Methods">

  const UserEntity({
    required this.uuid,
    required this.name,
    required this.imageLink,
    required this.email,
    required this.password,
    required this.favouriteCoins,
  });

//lis@override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          name == other.name &&
          imageLink == other.imageLink &&
          email == other.email &&
          password == other.password &&
          favouriteCoins == other.favouriteCoins);

  @override
  int get hashCode =>
      uuid.hashCode ^ name.hashCode ^ imageLink.hashCode ^ email.hashCode ^ password.hashCode ^ favouriteCoins.hashCode;

  @override
  String toString() {
    return 'UserEntity{' +
        ' uuid: $uuid,' +
        ' name: $name,' +
        ' imageLink: $imageLink,' +
        ' email: $email,' +
        ' password: $password,' +
        ' favouriteCoins: $favouriteCoins,' +
        '}';
  }

  UserEntity copyWith({
    String? uuid,
    String? name,
    String? imageLink,
    String? email,
    String? password,
    List<String>? favouriteCoins,
  }) {
    return UserEntity(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      imageLink: imageLink ?? this.imageLink,
      email: email ?? this.email,
      password: password ?? this.password,
      favouriteCoins: favouriteCoins ?? this.favouriteCoins,
    );
  }

  factory UserEntity.fromTableModel(UserTableModel userTableModel) {
    return UserTableModel(
      name: userTableModel.name,
      uuid: userTableModel.uuid,
      email: userTableModel.email,
      imageLink: userTableModel.imageLink,
      favouriteCoins: userTableModel.favouriteCoins,
    );
  }

//</editor-fold>

}
