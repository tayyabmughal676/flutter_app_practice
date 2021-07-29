import 'package:dio/dio.dart';
import 'package:super_dio_practice/models/allUsers.dart';
// import 'package:super_dio_practice/models/userData.dart';

class NewsApiService {
  // static String _apiKey = "6a558f6972424b449cec44819ff819e4";
  // String _url =
  //     "https://newsapi.org/v2/everything?q=tesla&from=2021-06-28&sortBy=publishedAt&apiKey=$_apiKey";

  late Dio _dio;
  String _URL_Link = "https://reqres.in/api/users/3";

  String _All_User_Link = "https://reqres.in/api/users?page=2";

  NewsApiService() {
    _dio = Dio();
  }

  // Future<Data?> fetchNewsArticle() async {
  //   try {
  //     Response response = await _dio.get(_URL_Link);
  //     print("Response: ${response.data.toString()}");
  //     userData newsResponse = userData.fromJson(response.data);
  //     print("First name is: ${newsResponse.data!.firstName}");
  //     return newsResponse.data;
  //   } on DioError catch (e) {
  //     print(e);
  //      return null;
  //   }
  // }

  Future<List<Data>> fetchAllUsers() async {
    try {
      Response response = await _dio.get(_All_User_Link);
      // print("Response: ${response.data.toString()}");
      AllUsers allUsers = AllUsers.fromJson(response.data);
      // print("First name is: ${allUsers.data}");
      return allUsers.data!;
    } on DioError catch (e) {
      print(e);
      return [];
    }
  }
}
