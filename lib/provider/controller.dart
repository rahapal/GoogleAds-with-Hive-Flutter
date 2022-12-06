import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hivefinal/models/details.dart';

class DetailNotifier extends ChangeNotifier {
  List<Details> _detailsList = [];

  UnmodifiableListView<Details> get detailsList =>
      UnmodifiableListView(_detailsList);

  addDetails(Details details) {
    _detailsList.add(details);
    notifyListeners();
  }

  deleteDetails(index) {
    _detailsList.removeWhere((element) => element.id == index);
    notifyListeners();
  }

  // editDetails(Details details) {
  //   var index = _detailsList.indexWhere((element) => element.id == details.id);
  //   _detailsList[index] = details;
  //   notifyListeners();
  // }
}
