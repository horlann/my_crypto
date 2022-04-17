class UserEntity {
  final String uuid;
  final String name;
  final String imageLink;
  final String email;
  final String password;

//<editor-fold desc="Data Methods">

  const UserEntity({
    required this.uuid,
    required this.name,
    required this.imageLink,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          name == other.name &&
          imageLink == other.imageLink &&
          email == other.email &&
          password == other.password);

  @override
  int get hashCode => uuid.hashCode ^ name.hashCode ^ imageLink.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'UserEntity{' +
        ' uuid: $uuid,' +
        ' name: $name,' +
        ' imageLink: $imageLink,' +
        ' email: $email,' +
        ' password: $password,' +
        '}';
  }

  UserEntity copyWith({
    String? uuid,
    String? name,
    String? imageLink,
    String? email,
    String? password,
  }) {
    return UserEntity(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      imageLink: imageLink ?? this.imageLink,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': this.uuid,
      'name': this.name,
      'imageLink': this.imageLink,
      'email': this.email,
      'password': this.password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      imageLink: map['imageLink'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
