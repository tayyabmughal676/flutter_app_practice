import 'package:flutter/material.dart';

class ProviderNotifierModel extends ChangeNotifier {
  String someValue = 'Provider';

  void doSomething() {
    someValue = 'Provider Example';
    print(someValue);
    notifyListeners();
  }
}

class MultiProviderModelOne with ChangeNotifier {
  //                        <--- Model class One
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class MultiProviderModelTwo with ChangeNotifier {
  //                   <--- Model Class Two
  int someValue = 0;

  void doSomething() {
    someValue += 5;
    print(someValue);
    notifyListeners();
  }
}

class ProviderModel {
  String someValue = 'Provider';

  void doSomething() {
    someValue = 'Provider Example';
    print(someValue);
  }
}

class ProxyProviderOne with ChangeNotifier {
  //                       <--- MyModel
  String someValue = 'Hello';

  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

class ProxyProviderTwo {
  //                                      <--- AnotherModel
  ProxyProviderOne _myModel;

  ProxyProviderTwo(this._myModel);

  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}
