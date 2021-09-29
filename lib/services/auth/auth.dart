import 'package:esi_2_2021/models/firebaseUser.dart';
import 'package:esi_2_2021/screens/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Create user object based on FirebaseUser
  FirebaseUser? _userFromFirebaseUser(User? user) {
    return user != null
        ? FirebaseUser(
            uid: user.uid,
            emailVerified: user.emailVerified,
          )
        : null;
  }

  /// Auth change user stream, return if the user is signed or not
  Stream<FirebaseUser?> get currentUser {
    return _auth.userChanges().map(_userFromFirebaseUser);
  }

  String? get currentUserUid {
    User? user = _auth.currentUser;
    print('User: $user');
    if (user != null) return user.uid;
    return null;
  }

  /// Update user state
  Future updateUserState() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      // _auth.userChanges();
      print('User: $user');
    }
    return _userFromFirebaseUser(user);
  }

  /// Sign in with email $ password
  Future signInWithEmailAndPassword(String email, String password) async {
    String _authException;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      User? user = result.user;
      return {'user': _userFromFirebaseUser(user), 'authException': null};
    } on FirebaseAuthException catch (e) {
      _authException = '';
      if (e.code == 'user-not-found') {
        _authException = 'Email não encontrado!';
      }
      if (e.code == 'wrong-password') {
        _authException = 'Senha incorreta!';
      }
      return {
        'user': null,
        'authException': _authException,
      };
    } catch (e) {
      print('$e');
      return null;
    }
  }

  /// Register with email and password
  Future registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String _authException;

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      User? user = result.user;
      return {
        'user': _userFromFirebaseUser(user),
        'authException': null,
      };
    } on FirebaseAuthException catch (e) {
      _authException = '';
      if (e.code == 'weak-password') {
        _authException = 'A senha é muito fraca.';
      }
      if (e.code == 'email-already-in-use') {
        _authException = 'Este email já está em uso.';
      }
      return {
        'user': null,
        'authException': _authException,
      };
    } catch (e) {
      print('$e');
      return null;
    }
  }

  /// Sign out
  Future signOut() async {
    try {
      return await _auth.signOut().then((value) => Get.offAll(Wrapper()));
    } catch (e) {
      print('$e');
      return null;
    }
  }

  /// Reset user password
  Future<bool> resetUserPassword(String email) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((value) => print('Email reset password sended'));
      return true;
    } catch (e) {
      print('$e');
      return false;
    }
  }
}
