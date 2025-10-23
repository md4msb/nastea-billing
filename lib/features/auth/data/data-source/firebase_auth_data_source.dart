import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:nastea_billing/core/extensions/firebase_firestore_extension.dart';
import 'package:nastea_billing/features/auth/data/model/firebase_user.dart';
import 'auth_data_source.dart';

class FirebaseAuthDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  FirebaseAuthDataSource({
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
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException error) {
          throw error;
        },
        codeSent: (verificationId, forceResendingToken) {},
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
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

      // Sign in the user with the credential
      /* final cred = */
      await _firebaseAuth.signInWithCredential(credential);
      // if (cred.user == null) {
      //   throw Exception('User not created');
      // }

      // final userId = cred.user?.uid;
      // await _firestore
      //     .collection('users')
      //     .doc(userId)
      //     .set(fireBaseUser.toDoc());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
