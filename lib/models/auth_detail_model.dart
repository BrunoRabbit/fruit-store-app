class AuthDetailModel {
  final bool isValid;
  final String? uid;
  final String? photoUrl;
  final String? email;
  final String? name;

  AuthDetailModel({
    required this.isValid,
    this.uid,
    this.photoUrl,
    this.email,
    this.name,
  });

  AuthDetailModel copyWith({
    bool? isValid,
    String? uid,
    String? photoUrl,
    String? email,
    String? name,
  }) {
    return AuthDetailModel(
      isValid: isValid ?? this.isValid,
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}
