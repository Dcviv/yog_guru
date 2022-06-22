import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:yog_guru/pages/workout_details.dart';

import '../model/model.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class BreakTime extends StatelessWidget {
  int yogaIndex;
  List<Yoga> listOfYoga;
  String YogaTableName;
  BreakTime(
      {required this.YogaTableName,
      required this.listOfYoga,
      required this.yogaIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel3>(
      create: (context) =>
          TimerModel3(context, listOfYoga, yogaIndex, YogaTableName),
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: 20,
          ),
          padding: EdgeInsets.only(
            top: 10,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_42/3058061/191017-workout-sneakers-stretch-ac-924p.jpg"),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(
                text: "Break Time",
                color: Colors.white,
              ),
              Consumer<TimerModel3>(builder: (context, myModel, child) {
                return BigText(
                  text: "${myModel.countDown}",
                  color: Colors.white,
                  size: 40,
                );
              }),
              Consumer<TimerModel3>(
                builder: (context, myModel, child) => ElevatedButton(
                    onPressed: () {
                      myModel.skip();
                    },
                    child: SmallText(
                      text: "SKIP",
                      size: 18,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimerModel3 with ChangeNotifier {
  TimerModel3(
      context, List<Yoga> listOfYoga, int yogaIndex, String yogaTableName) {
    MyTimer(context, listOfYoga, yogaIndex, yogaTableName);
  }

  int countDown = 10;
  bool isSkip = false;
  MyTimer(context, List<Yoga> listOfYoga, int yogaIndex,
      String yogaTableName) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countDown--;
      notifyListeners();
      if (countDown == 0 || isSkip) {
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WorkoutDetails(
                      listOfYoga: listOfYoga,
                      yogaIndex: yogaIndex,
                      yogaTableName: yogaTableName,
                    )));
      }
    });
  }

  void skip() {
    isSkip = true;
    notifyListeners();
  }
}
