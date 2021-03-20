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
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${c.getPlayerScore(PlayerType.green)}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {c.changePlayerScore(PlayerType.green, 4)},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
