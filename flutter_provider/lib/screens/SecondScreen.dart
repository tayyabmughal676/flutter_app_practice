import 'package:flutter/material.dart';
import 'package:flutter_provider/models/ProviderModel.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  final String? getTitle;

  SecondScreen({Key? key, this.getTitle}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // final myModel = Provider.of<ProviderNotifierModel>(context, listen: false);
    // Use this if you don't want to use Consumer

    return ChangeNotifierProvider<ProviderNotifierModel>(
      create: (context) => ProviderNotifierModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Change Notifier Provider"),
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
                          child: Consumer<ProviderNotifierModel>(
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
                        child: Consumer<ProviderNotifierModel>(
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
