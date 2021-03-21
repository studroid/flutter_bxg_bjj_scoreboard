import 'package:bxg_bjj_scoreboard/components/player_info.dart';
import 'package:bxg_bjj_scoreboard/components/score_handler.dart';
import 'package:bxg_bjj_scoreboard/local_asset.dart';
import 'package:bxg_bjj_scoreboard/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(PlayerController());

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
    PlayerController c = Get.find();

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
        child: Container(
          height: MediaQuery.of(context).size.height - 55,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(child: Text('control')),
                ]),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 1, child: ScoreHandler(PlayerType.green)),
                    Expanded(flex: 2, child: PlayerInfo(PlayerType.green)),
                    Expanded(flex: 2, child: PlayerInfo(PlayerType.red)),
                    Expanded(flex: 1, child: ScoreHandler(PlayerType.red)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
