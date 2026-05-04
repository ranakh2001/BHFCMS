class LoginRequestModel {
  final String email;
  final String password;
  final String lang;

  const LoginRequestModel({
    required this.email,
    required this.password,
    this.lang = 'ar',
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'lang': lang,
      };
}
