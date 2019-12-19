import 'package:flutter/cupertino.dart';
import 'package:sample_test/Constants.dart';

class ActivityModel with ChangeNotifier {
  Map<String, bool> goldActivities = {
    'Avoid processed food for a day': false,
    'Give up sugar for a day': false,
    'Do 10 minute workout': false,
    'Go for walking 30 min for a day': false
  };

  Map<String, bool> silverActivities = {
    'Avoid processed food for a day': false,
    'Eat 3 servings of vegetables a day': false,
    'Do not smoke through the day': false,
    'Do not eat food at midnight': false
  };

  updateGoldActivity(String s, bool isChecked) {
    goldActivities[s] = isChecked;
    notifyListeners();
  }

  updateSilverActivity(String s, bool isChecked) {
    silverActivities[s] = isChecked;
    notifyListeners();
  }

  getSelectedSilverCount() {
    int silverCount = 0;
    for (var i = 0; i < silverActivities.length; ++i) {
      if (silverActivities.values.elementAt(i))
        silverCount = silverCount + Constants.SILVER_VALUE;
    }
    return silverCount;
  }

  getSelectedGoldCount() {
    int silverCount = 0;
    for (var i = 0; i < goldActivities.length; ++i) {
      if (goldActivities.values.elementAt(i))
        silverCount = silverCount + Constants.GOLD_VALUE;
    }
    return silverCount;
  }
}
