enum ErrorType { network, validation, server, notFound, unknown }

extension ErrorTypeMessage on ErrorType {
  String get message {
    switch (this) {
      case ErrorType.network:
        return "Network connection failed";
      case ErrorType.validation:
        return "Validation error";
      case ErrorType.server:
        return "Server error occurred";
      case ErrorType.notFound:
        return "Resource not found";
      case ErrorType.unknown:
        return "An unexpected error occured";
    }
  }
}

  class AppError {
    final ErrorType type;
    final String? message;  // Optionnel, custom message

    AppError({required this.type, this.message});

    // Si pas de message custom, utiliser celui de l'enum
    String get errorMessage => message ?? type.message;
  }
