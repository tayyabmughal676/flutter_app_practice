import 'package:dio/dio.dart';
import 'package:dio_practice/HttpClient/HttpService.dart';
import 'package:dio_practice/model/SingleUserResponse.dart';
import 'package:dio_practice/model/User.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({Key? key}) : super(key: key);

  @override
  _SingleUserScreenState createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {

  HttpService _httpService = HttpService();

  // late SingleUserResponse _singleUserResponse;
  // late User _user;
  // bool isDataLoading = false;

  // Future getUser() async {
  //   Response _response;
  //   try {
  //     isLoading = true;
  //     _response = await _httpService.getRequest("/api/users/2");
  //     isLoading = false;
  //     if (_response.statusCode == 200) {
  //       setState(() {
  //         _singleUserResponse = SingleUserResponse.fromJson(_response.data);
  //         _user = _singleUserResponse.user!;
  //       });
  //     } else {
  //       print("there is some error in the response");
  //     }
  //   } on Exception catch (e) {
  //     isLoading = false;
  //     print(e);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Single User"),
      ),
      body:Container(
        child: CircularProgressIndicator(),
      )
    );
  }
}

//
// isDataLoading
// ? Center(child: CircularProgressIndicator())
// : Container(
// width: double.infinity,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.network(_user.avatar!),
// Container(height: 16),
// Text("Hello, ${_user.firstName}")
// ],
// ),
// ),