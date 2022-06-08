class GoodsRepositoryException implements Exception {
  final int code;
  final String message;
  GoodsRepositoryException({
    required this.code,
    required this.message,
  });
}
