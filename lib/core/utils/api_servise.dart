import 'package:dio/dio.dart';

class ApiServise {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      String? contentType}) async {
    var response = await dio.post(
      url,
      data: body,
      options:
          Options(headers: {"Authorization": token}, contentType: contentType),
    );

    return response;
  }
}
