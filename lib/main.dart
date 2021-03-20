import 'package:bxg_bjj_scoreboard/components/score_handler.dart';
import 'package:bxg_bjj_scoreboard/controller.dart';
import 'package:bxg_bjj_scoreboard/local_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());

    return MaterialApp(
      title: 'BxG BJJ Scoreboard',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          spacing: 30,
          children: <Widget>[
            Image(
              image: LocalAsset.bxgLogo,
              width: 200,
            ),
            Text("BxG BJJ Scoreboard"),
            SizedBox(width: 160)
          ],
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScoreHandler(PlayerType.green),
              Text('${c.getPlayerScore(PlayerType.green)}'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {c.changePlayerScore(PlayerType.green, 4)},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
