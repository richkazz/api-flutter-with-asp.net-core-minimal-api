class ErrorResponse {
  final int statusCode;
  final String statusPhrase;
  final List<String> errors;
  final String timeStamp;

  ErrorResponse({
    required this.statusCode,
    required this.statusPhrase,
    required this.errors,
    required this.timeStamp,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json['statusCode'],
      statusPhrase: json['statusPharase'],
      errors: List<String>.from(json['errors']),
      timeStamp: json['timeStamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'statusPharase': statusPhrase,
      'errors': errors,
      'timeStamp': timeStamp,
    };
  }
}
