import 'package:flutter/material.dart';
import 'package:flutter_provider/models/ProviderModel.dart';
import 'package:flutter_provider/screens/FourthScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MultiProviderModelOne>(
          create: (context) => MultiProviderModelOne(),
        ),
        ChangeNotifierProvider<MultiProviderModelTwo>(
            create: (context) => MultiProviderModelTwo()),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("Multi Provider"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<MultiProviderModelOne>(
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
                    child: Consumer<MultiProviderModelOne>(
                      //  <--- Consumer
                      builder: (context, myModel, child) {
                        return Text(
                          myModel.someValue,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                      child: Consumer<MultiProviderModelTwo>(
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
                    child: Consumer<MultiProviderModelTwo>(
                      //  <--- Consumer
                      builder: (context, myModel, child) {
                        return Text(
                          "${myModel.someValue}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
