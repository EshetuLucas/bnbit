#  All custom exceptions goes here 

# We handle all exceptions and rethrow them with our custom exceptions to the caller function.

### You can add a custom exception like the code below 

class ApiException implements Exception {
   ///... You code goes here 
  final String? message;

  ApiException({required this.message});

  @override
  String toString() => message ?? 'unknown error';
    ....///
}

