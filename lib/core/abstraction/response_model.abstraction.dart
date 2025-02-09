 class ResponseModelAbstraction<T> {
  int? statusCode;
  String? message;
  T? data;

  ResponseModelAbstraction({
    this.statusCode,
    this.message,
    this.data,
  });
}
