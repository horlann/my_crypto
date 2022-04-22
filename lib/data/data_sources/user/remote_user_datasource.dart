import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_crypto/data/api/models/user_model.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/main.dart';

abstract class IRemoteUserDataSource {
  Future<Either<Failure, UserEntity>> signIn(String email, String password);

  Future<Either<Failure, UserEntity>> signUp(UserEntity userEntity);

  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, UserEntity?>> loadUser();
}

class RemoteUserDataSource extends IRemoteUserDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  RemoteUserDataSource(this.auth, this.firestore);

  @override
  Future<Either<Failure, UserEntity>> signIn(String email, String password) async {
    UserEntity? userEntity;
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: 'tortos121@gmail.com', password: '123456');
      try {
        final userCollectionRef = firestore.collection("users");
        final uuid = auth.currentUser!.uid;
        await userCollectionRef.doc(uuid).get().then((value) {
          userEntity = UserModel.fromSnapshot(value);
        });
        if (userEntity != null) {
          return Right(userEntity!);
        } else {
          return Left(ServerFailure());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          logger.e('The email address is badly formatted.');
        } else if (e.code == 'wrong-password') {
          logger.e('The password is invalid or the user does not have a password.');
        }
        return Left(ServerFailure());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        logger.e('The email address is badly formatted.');
      } else if (e.code == 'wrong-password') {
        logger.e('The password is invalid or the user does not have a password.');
      } else if (e.code == 'too-many-requests') {
        logger.e('We have blocked all requests from this device due to unusual activity. Try again later.');
      }
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> loadUser() async {
    try {
      if (auth.currentUser != null) {
        final userCollectionRef = firestore.collection("users");
        final uuid = auth.currentUser!.uid;
        try {
          UserEntity userEntity = await userCollectionRef.doc(uuid).get().then((value) {
            return UserModel.fromSnapshot(value);
          });
          return Right(userEntity);
        } catch (e) {
          logger.e(e);
          return Left(ServerFailure());
        }
      } else {
        return const Right(null);
      }
    } on Exception catch (e) {
      logger.e(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await auth.signOut();
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(UserEntity userEntity) async {
    try {
      UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(email: userEntity.email, password: userEntity.password);
      try {
        final userCollectionRef = firestore.collection("users");
        final uuid = auth.currentUser!.uid;
        await userCollectionRef.doc(uuid).get().then((value) {
          final newUser = UserModel(
                  uuid: uuid,
                  email: userEntity.email,
                  name: userEntity.name,
                  imageLink: userEntity.imageLink,
                  password: userEntity.password)
              .toDocument();
          if (!value.exists) {
            userCollectionRef.doc(uuid).set(newUser);
          }
          return;
        });
      } catch (e) {
        logger.e(e);
        await auth.currentUser!.delete();
        return Left(ServerFailure());
      }
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger.e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        logger.e('The account already exists for that email.');
      }
      return Left(ServerFailure());
    }
  }
}
