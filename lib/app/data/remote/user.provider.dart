import 'package:flutter_architecture/app/data/mappers/user_mapper.dart';
import 'package:flutter_architecture/app/domain/entities/http_response.dart';
import 'package:flutter_architecture/core/di/http_client.dart';
import 'package:flutter_architecture/app/data/remote/configs/endpoints.dart'
    as endpoints;

class UserProvider {
 final HttpClient _client;
  UserProvider(this._client);
  Future<HttpResponse> list() async {
    HttpResponse response = HttpResponse();

    final String url = endpoints.myList.list;

    final ret = _client.get(url);

    await ret.then((res) {
      response.statusCode = res.statusCode ?? 200;
      response.data = UserMapper.fromJsonList(res.data);
      response.message = res.statusMessage ?? "";
    }).catchError((e) {
      response.statusCode = 500;
      response.data = e;
      response.message = "Server Error";
    });

    return response;
  }
}
