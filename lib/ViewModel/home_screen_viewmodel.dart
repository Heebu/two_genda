import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  bool isBuss = true;
  bool isPersonal = false;

  void isTouched1() {
    isBuss = true;
    isPersonal = false;
    notifyListeners();
  }

  void isTouched2() {
    isBuss = false;
    isPersonal = true;
    notifyListeners();
  }

  void navigateToSearch(context) {
    Navigator.pushNamed(context, '/search');
  }

  void navigateToCart(context) {
    Navigator.pushNamed(context, '/');
  }
}
