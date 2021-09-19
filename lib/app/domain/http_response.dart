class HttpResponse {
  int statusCode;
  String message;
  dynamic data;

  HttpResponse({this.statusCode=200, this.message = "", this.data});
}
