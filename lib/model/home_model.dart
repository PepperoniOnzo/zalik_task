import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import '../data/configurations.dart';

class HomeModel with ChangeNotifier {
  String institute = Configs.shedule.keys.first,
      group = Configs.shedule.values.first.first;

  bool initialized = false, dataLoaded = false, error = false;

  dom.Document document = dom.Document();

  void pressShow() {
    initialized = true;
    dataLoaded = false;
    notifyListeners();
    getData();
  }

  void getData() async {
    try {
      var response = await http.get(Uri.parse(
        Configs.link
            .replaceFirst(Configs.tagInstitute, institute)
            .replaceFirst(Configs.tagGroup, group),
      ));
      dataLoaded = true;

      if (response.statusCode == 200) {
        document = parse(response.body);
        error = false;
        notifyListeners();
      } else {
        error = true;
        notifyListeners();
      }
    } catch (e) {
      dataLoaded = true;
      error = true;
      notifyListeners();
    }
  }

  List<DropdownMenuItem<dynamic>>? itemsInstitute = Configs.shedule.keys
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ))
      .toList();

  List<DropdownMenuItem<dynamic>>? getGroups() => Configs.shedule[institute]!
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ))
      .toList();

  void setInstitute(String? newInstitute) {
    group = Configs.shedule[newInstitute]!.first;
    institute = newInstitute!;
    notifyListeners();
  }

  void setGroup(String? newGroup) {
    group = newGroup!;
    notifyListeners();
  }
}
