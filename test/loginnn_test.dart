import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  Future<UserCredential> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to log in: ${e.message}');
    }
  }
}
class FirebaseService {
  static late FirebaseFirestore db;
  final FirebaseAuth firebaseAuth;

  FirebaseService({required this.firebaseAuth});

  static void init() {
    db = FirebaseFirestore.instance;
  }
}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}