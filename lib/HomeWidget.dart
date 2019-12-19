import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/ActivityModel.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<HomeWidget> {
  var activityModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    activityModel = Provider.of<ActivityModel>(context);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(tabs: [
              Tab(
                  child: Text(
                "Gold",
                style: TextStyle(fontSize:18,color: Theme.of(context).primaryColor),
              )),
              Tab(
                  child: Text(
                "Silver",
                style: TextStyle(fontSize:18,color: Theme.of(context).primaryColor),
              )),
            ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(children: [
                Container(child: getGoldPoints()),
                Container(
                  child: getSilverPoints(),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  getGoldPoints() {
    List<Widget> clWidgets = List<Widget>(activityModel.goldActivities.length);
    for (var i = 0; i < activityModel.goldActivities.length; ++i) {
      clWidgets[i] = getCheckBoxWidget(i, true);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: clWidgets),
    );
  }

  getSilverPoints() {
    List<Widget> clWidgets = List<Widget>(activityModel.silverActivities.length);

    for (var i = 0; i < activityModel.silverActivities.length; ++i) {
      clWidgets[i] = getCheckBoxWidget(i, false);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: clWidgets,
      ),
    );
  }

  getCheckBoxWidget(int i, bool isGold) {
    String sKey;
    if (isGold) {
      sKey = activityModel.goldActivities.keys.elementAt(i);
    } else {
      sKey = activityModel.silverActivities.keys.elementAt(i);
    }
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(sKey,style: TextStyle(fontSize: 16),),
              Checkbox(
                key: Key('$i'),
                onChanged: (bool isChecked) {
                  setState(() {
                    if (isGold)
                      activityModel.updateGoldActivity(sKey,isChecked);
                    else
                      activityModel.updateSilverActivity(sKey,isChecked);
                  });
                },
                value: isGold ? activityModel.goldActivities[sKey] : activityModel.silverActivities[sKey],
              ),
            ],
          )
        ],
      ),
    );
  }
}
