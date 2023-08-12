import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../services/firebase_service.dart';
class AuthRepository {
  CollectionReference<UserModel> userRef =
  FirebaseService.db.collection("users").withConverter<UserModel>(
    fromFirestore: (snapshot, _) {
      return UserModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Future<UserCredential?> register(UserModel user) async {
    try {
      final response =
      await userRef.where("username", isEqualTo: user.username!).get();
      if (response.size != 0) {
        throw Exception("Username already exists");
      }