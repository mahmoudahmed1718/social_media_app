class CustomExcption implements Exception {
  final String message;

  CustomExcption(this.message);

  @override
  String toString() {
    return 'CustomExcption: $message';
  }
}
