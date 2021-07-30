import 'package:flutter/material.dart';
import 'package:flutter_provider/models/ProviderModel.dart';
import 'package:flutter_provider/models/TaskData.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  /*
  * Simple Provider Example
  * Provider
  * Model class
  * Consumer
  *
  * */

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ProviderModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("First Screen"),
            backgroundColor: Colors.deepOrange,
          ),
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.green[200],
                          child: Consumer<ProviderModel>(
                            //   <--- Consumer
                            builder: (context, myModel, child) {
                              return ElevatedButton(
                                child: Text('Click Me :)'),
                                onPressed: () {
                                  // We have access to the model.
                                  myModel.doSomething();
                                },
                              );
                            },
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.deepOrange,
                        ),
                        child: Consumer<ProviderModel>(
                          //  <--- Consumer
                          builder: (context, myModel, child) {
                            return Text(
                              myModel.someValue,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
