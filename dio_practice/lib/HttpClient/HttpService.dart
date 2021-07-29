import 'package:dio/dio.dart';

class HttpService{
  late Dio _dio;
  final baseUrl = "https://reqres.in/";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    // initInterceptors();
  }

  // initInterceptors(){
  //   _dio.interceptors.add(InterceptorsWrapper(
  //       onError: (error, errorInterceptorHandler ){
  //         print(error.message);
  //       },
  //       onRequest: (request, requestInterceptorHandler){
  //         print("${request.method} | ${request.path}");
  //       },
  //       onResponse: (response, responseInterceptorHandler) {
  //         print('${response.statusCode} ${response.statusCode} ${response.data}');
  //       }
  //   ));


  // }

  Future<Response> getRequest(String endPoint) async{
    Response response;
    try{
      response = await _dio.get(endPoint);
    } on DioError catch(e){
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}