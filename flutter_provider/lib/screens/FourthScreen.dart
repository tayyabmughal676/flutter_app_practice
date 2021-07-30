import 'package:flutter/material.dart';
import 'package:flutter_provider/models/ProviderModel.dart';
import 'package:provider/provider.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProxyProviderOne>(
            create: (context) => ProxyProviderOne()),
        ProxyProvider<ProxyProviderOne, ProxyProviderTwo>(
          update: (context, myModel, proxyProviderTwo) =>
              ProxyProviderTwo(myModel),
        )
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("Proxy Provider"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.green[200],
                          child: Consumer<ProxyProviderOne>(
                            //   <--- Consumer
                            builder: (context, myModel, child) {
                              return ElevatedButton(
                                child: Text('Click Me :)'),
                                onPressed: () {
                                  // We have access to the model.
                                  myModel.doSomething("Proxy Provider One");
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
                        child: Consumer<ProxyProviderOne>(
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.green[200],
                          child: Consumer<ProxyProviderTwo>(
                            //   <--- Consumer
                            builder: (context, myModel, child) {
                              return ElevatedButton(
                                child: Text('Click Me :)'),
                                onPressed: () {
                                  // We have access to the model.
                                  myModel.doSomethingElse();
                                },
                              );
                            },
                          )),
                    ],
                  ),
                ],
              ))),
    );
  }
}
