import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier{

  int mIndex = 0;
  BuildContext? context;

  init({required BuildContext? context, required int? index}){
    this.context = context;
    mIndex = index!;
  }

  setCurrentIndex(int index){
    this.mIndex = index;
    notifyListeners();
  }
}