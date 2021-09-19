import 'package:flutter_architecture/app/data/mappers/user.mapper.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/di/http_client.dart';
import 'package:flutter_architecture/app/data/remote/configs/endpoints.dart'
    as endpoints;
import 'package:flutter_architecture/core/di/injector_provider.dart';

class UserService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> list() async {
    HttpResponse response = HttpResponse();

    final String url = endpoints.myList.list;

    final ret = client.get(url);

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
