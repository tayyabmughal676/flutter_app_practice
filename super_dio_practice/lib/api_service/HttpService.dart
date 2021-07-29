import 'package:dio/dio.dart';
import 'package:super_dio_practice/models/userData.dart';

class HttpService {
  late Dio _dio;
  final baseUrl = "https://reqres.in/";
  String _URL_Link = "https://reqres.in/api/users/2";


  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    // initInterceptors();
  }

  Future<Data?> getSingleUser() async {
    try {
      Response response = await _dio.get(_URL_Link);
      print("Response: ${response.data.toString()}");
      userData newsResponse = userData.fromJson(response.data);
      print("First name is: ${newsResponse.data!.firstName}");
      return newsResponse.data;
    } on DioError catch (e) {
      print(e);
      return null;
    }
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
