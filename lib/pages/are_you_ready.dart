import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yog_guru/app_resources/qoutes.dart';
import 'package:yog_guru/database/yogaDB.dart';
import 'package:yog_guru/model/model.dart';
import 'package:yog_guru/pages/workout_details.dart';
import 'package:yog_guru/widgets/big_text.dart';
import 'package:yog_guru/widgets/small_text.dart';

class AreUReady extends StatelessWidget {
  String yogaTableName;
  AreUReady({required this.yogaTableName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context, yogaTableName: yogaTableName),
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 - 300,
                ),
                BigText(text: "ARE YOU READY?"),
                SizedBox(height: 30),
                Consumer<TimerModel>(builder: (context, myModel, child) {
                  return BigText(
                    text: "${myModel.countDown}",
                    size: 40,
                  );
                }),
                Divider(
                  thickness: 3,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: BigText(
                          text: "Tip: " +
                              QuotesList.getRandomQuotes(
                                  QuotesList.quotesList))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier {
  String yogaTableName;
  TimerModel(context, {required this.yogaTableName}) {
    FetchAllYoga(yogaTableName);
    MyTimer(context);
  }

  int countDown = 5;
  MyTimer(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countDown--;
      notifyListeners();
      if (countDown == 0) {
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WorkoutDetails(
                      listOfYoga: allYogaList,
                      yogaIndex: 0,
                      yogaTableName: yogaTableName,
                    )));
      }
    });
  }

  late List<Yoga> allYogaList;
  Future<List<Yoga>> FetchAllYoga(String yogaTableName) async {
    YogaDatabase.instance.readAllYogaSummary();
    allYogaList = await YogaDatabase.instance.readAllYoga(yogaTableName);
    notifyListeners();
    return allYogaList;
  }
}
