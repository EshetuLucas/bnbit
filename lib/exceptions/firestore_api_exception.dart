/// Thrown from a FirestoreApi class and provides a detailed actionable message
/// for the developer to use in their code
class FirestoreApiException implements Exception {
  final String message;
  final String devDetails;

  FirestoreApiException({
    required this.message,
    required this.devDetails,
  });

  @override
  String toString() {
    return '''FirestoreApiException | $message 
    Dev Details: $devDetails''';
  }
}

class EmailNotFoundException implements Exception {
  String? message;
  EmailNotFoundException({String? message});
}
