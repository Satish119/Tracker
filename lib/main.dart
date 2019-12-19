import 'package:flutter/material.dart';
import 'package:sample_test/HomeWidget.dart';
import 'package:provider/provider.dart';

import 'model/ActivityModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sample Test',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ChangeNotifierProvider<ActivityModel>(
          create: (_) => ActivityModel(),
          child: MyHomePage(title: 'Tracking'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double size = 100;
    var activityModel = Provider.of<ActivityModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  'Your Monthly Score',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).accentColor,
                        blurRadius: 20.0, // has the effect of softening the shadow
                        spreadRadius: 1,
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  child: Center(
                      child: Text(
                    '${activityModel.getSelectedGoldCount() + activityModel.getSelectedSilverCount()}',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'A simple checklist for you to monitor daily what small steps you are taking to keep yourself healthy.',
                  style: TextStyle(
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child: HomeWidget())
            ],
          )),
        ));
  }
}
