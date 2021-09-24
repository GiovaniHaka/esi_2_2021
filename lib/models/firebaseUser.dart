class FirebaseUser {
  final String? uid;
  bool? emailVerified;

  FirebaseUser({
    this.uid,
    this.emailVerified,
  });

  @override
  String toString() => 'FirebaseUser(uid: $uid, emailVerified: $emailVerified)';
}
