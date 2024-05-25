import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final cart = [];
  var loginData = '';
  addProduct(product) {
    cart.add(product);
    notifyListeners();
  }

  removeProduct(product) {
    cart.remove(product);
    notifyListeners();
  }

  setLoginData(data) {
    loginData = data.data.memberInfo.username;
    notifyListeners();
  }
}
