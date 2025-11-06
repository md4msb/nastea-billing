import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:nastea_billing/core/extensions/extensions.dart';
import '../models/firebase_user.dart';
import 'auth_data_source.dart';

class FirebaseAuthDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  const FirebaseAuthDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  }) : _firebaseAuth = firebaseAuth,
       _firestore = firestore;

  @override
  Future<FirebaseUser> getLoggedInUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }
      final userId = user.uid;
      final userDoc = await _firestore.userDocument(userId).get();

      if (!userDoc.exists) {
        throw Exception('User not found');
      }
      final firebaseUser = FirebaseUser.fromDoc(userDoc);
      return firebaseUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool checkUserAuthenticated() {
    final isAuthenticated = _firebaseAuth.currentUser != null;
    return isAuthenticated;
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> verifyPhoneNumber(String phoneNumber) async {
    try {
      final completer = Completer<String>();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 20),
        verificationCompleted: (PhoneAuthCredential credential) {},

        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) completer.completeError(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          if (!completer.isCompleted) completer.complete(verificationId);
        },

        codeAutoRetrievalTimeout: (String verificationId) {
          if (!completer.isCompleted) completer.complete(verificationId);
        },
      );

      return completer.future;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logInWithPhoneNumber(
    String verificationId,
    String smsCode,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      final cred = await _firebaseAuth.signInWithCredential(credential);
      if (cred.user == null) {
        throw Exception('User not created');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> registerUser(String displayName) async {
    try {
      final authUser = _firebaseAuth.currentUser;
      if (authUser == null) {
        throw Exception('User not found');
      }
      final user = FirebaseUser(
        id: authUser.uid,
        phoneNumber: authUser.phoneNumber ?? '',
        name: displayName,
        role: 'distributor',
        appAccess: 'requested'
      );
      await _firestore.userDocument(user.id).set(user.toDoc());
    } catch (e) {
      rethrow;
    }
  }
}
