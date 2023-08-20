class SignUpException implements Exception {
  final String message;
  final String code;

  SignUpException({
    required this.message,
    required this.code
  });

  
}
