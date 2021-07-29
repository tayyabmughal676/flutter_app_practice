import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_dio_practice/api_service/NewsApiServices.dart';
import 'package:super_dio_practice/models/allUsers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsApiService _newsApiService = NewsApiService();

  List<Data> mAllUserData = [];

  @override
  void initState() {
    var data = _newsApiService.fetchAllUsers();
    print("All_Users: ${data}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Discover...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: FutureBuilder<List<Data>>(
              future: _newsApiService.fetchAllUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 32.0, horizontal: 24.0),
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: ListTile(
                                    leading: Image.network(
                                        snapshot.data![index].avatar!),
                                    title:
                                        Text(snapshot.data![index].firstName!),
                                    subtitle:
                                        Text(snapshot.data![index].email!),
                                    trailing:
                                        Text(snapshot.data![index].lastName!),
                                    onTap: () {
                                      print(
                                          "Tapped: ${snapshot.data![index].id!}");
                                    },
                                  ));
                            })),
                  );
                }
              },
            ),
// ),
          )
        ],
      ),
    );
  }
}

// Image.network(
// snapshot.data![index].avatar!,
// frameBuilder: (BuildContext context,
//     Widget child,
// int? frame,
//     bool wasSynchronouslyLoaded) {
// if (wasSynchronouslyLoaded) {
// return child;
// }
// return AnimatedOpacity(
// child: child,
// opacity: frame == null ? 0 : 1,
// duration:
// const Duration(seconds: 1),
// curve: Curves.easeOut,
// );
// },
// ),
// Text("${snapshot.data![index].firstName}",
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.bold)),
// Text("${snapshot.data![index].lastName}",
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.bold)),
// Text("${snapshot.data![index].email}",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold)),

// Expanded(
// child: FutureBuilder<List<Data>>(
// future: _newsApiService.fetchAllUsers(),
// builder: (context, snapshot) {
// if (!snapshot.hasData) {
// return Center(child: CircularProgressIndicator());
// } else {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// width: double.infinity,
// margin: EdgeInsets.only(bottom: 10.0),
// padding: EdgeInsets.symmetric(
// vertical: 32.0, horizontal: 24.0),
// decoration: BoxDecoration(
// color: Colors.deepOrange,
// borderRadius: BorderRadius.circular(10.0)),
// child: Column(
// children: [
// Image.network(snapshot.data!.avatar!),
// Text("${snapshot.data!.firstName}",
// style: TextStyle(
// fontSize: 30, fontWeight: FontWeight.bold)),
// Text("${snapshot.data!.lastName}",
// style: TextStyle(
// fontSize: 30, fontWeight: FontWeight.bold)),
// Text("${snapshot.data!.email}",
// style: TextStyle(
// fontSize: 20, fontWeight: FontWeight.bold)),
// ],
// )),
// );
// }
// },
// ),
// ),

// class NewsTile extends StatelessWidget {
//   final Article article;
//
//   const NewsTile({Key? key, required this.article}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(7),
//       child: ListTile(
//         onTap: () async {
//           await canLaunch(article.url)
//               ? await launch(article.url)
//               : throw 'Could not launch ${article.url}';
//         },
//         title: Text(
//           article.title,
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: Text(
//           article.description,
//           maxLines: 4,
//           overflow: TextOverflow.ellipsis,
//         ),
//         leading: article.urlToImage != null
//             ? Container(
//                 width: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                     image: NetworkImage(article.urlToImage),
//                   ),
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }
