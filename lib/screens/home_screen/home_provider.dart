import 'package:billapp/validators.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
    Validators validator = Validators();
     final GlobalKey<FormState> calculateKey = GlobalKey<FormState>();
  TextEditingController billController = TextEditingController();
  String dropdownvalue = '5';
  double? billamount;
  double? tipPercentage;
  double grandTotal = 0.00;

  calculateAmt() {
    billamount = double.parse(billController.text);
    tipPercentage = double.parse(dropdownvalue);
    grandTotal = (billamount! + (billamount! * tipPercentage! / 100));
    notifyListeners();
  }
}
