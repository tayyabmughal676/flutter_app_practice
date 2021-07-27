import 'package:flutter/material.dart';
import 'package:flutter_notes/database/database_helper.dart';
import 'package:flutter_notes/models/Task.dart';
import 'package:flutter_notes/screens/taskpage.dart';
import 'package:flutter_notes/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Color(0xFFF6F6F6),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 32.0, top: 32.0),
                        child:
                            Image(image: AssetImage('assets/images/logo.png'))),
                    Expanded(
                      child: FutureBuilder(
                          initialData: [],
                          future: _dbHelper.getTasks(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return ScrollConfiguration(
                              behavior: NoGlowBehaviour(),
                              child: ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => TaskPage(
                                                    task: snapshot.data[index],
                                                  )),
                                        );
                                      },
                                      child: TaskCardWidget(
                                        title: snapshot.data[index]!.title,
                                      ),
                                    );
                                  }),
                            );
                          }),
                    )
                  ],
                ),
                Positioned(
                  bottom: 24.0,
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskPage(
                                  task: Task(
                                      id: null, title: null, description: null),
                                )),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF7349FE), Color(0xFF643FDB)],
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, 1.0)),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Image(
                          image: AssetImage('assets/images/add_icon.png'),
                        )),
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
