import 'package:flutter/cupertino.dart';

class ProductVM extends ChangeNotifier {
  int pageIndex = 0;

  setPageIndex(int value) {
    pageIndex = value;
    notifyListeners();
  }
}
