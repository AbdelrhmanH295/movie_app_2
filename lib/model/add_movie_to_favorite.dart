class AddMovieToFavoriteResponse {
  final int statusCode;
  final String message;

  AddMovieToFavoriteResponse({
    required this.statusCode,
    required this.message,
  });

  factory AddMovieToFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return AddMovieToFavoriteResponse(
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
    };
  }
}
