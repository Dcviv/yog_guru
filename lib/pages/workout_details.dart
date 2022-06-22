import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yog_guru/database/localdb.dart';
import 'package:yog_guru/model/model.dart';
import 'package:yog_guru/pages/are_you_ready.dart';
import 'package:yog_guru/pages/break.dart';
import 'package:yog_guru/pages/finish_screen.dart';

import '../app_resources/qoutes.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class WorkoutDetails extends StatelessWidget {
  int yogaIndex;
  List<Yoga> listOfYoga;
  String yogaTableName;
  WorkoutDetails(
      {required this.yogaTableName,
      required this.yogaIndex,
      required this.listOfYoga,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel2>(
        create: (context) => TimerModel2(context, listOfYoga, yogaIndex + 1,
            yogaTableName, listOfYoga[yogaIndex].SecondsOrTimes),
        child: Consumer<TimerModel2>(builder: (context, myModel, child) {
          return WillPopScope(
            onWillPop: () async {
              myModel.show();
              return false;
            },
            child: Scaffold(
                body: Stack(
              children: [
                Container(
                  child: Column(children: [
                    Container(
                      height: 300,
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 50, bottom: 10),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            listOfYoga[yogaIndex].YogaImageURL.toString()),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Spacer(),
                    BigText(text: listOfYoga[yogaIndex].YogaTitle),
                    Spacer(),
                    Container(
                        width: 200,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(50)),
                        child: listOfYoga[yogaIndex].Seconds
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    " : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white),
                                  ),
                                  Consumer<TimerModel2>(
                                    builder: (context, myModel, child) {
                                      return Text(
                                        myModel.countDown.toString().length == 1
                                            ? "0" + myModel.countDown.toString()
                                            : myModel.countDown.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white),
                                      );
                                    },
                                  )
                                ],
                              )
                            : Text(
                                "x${listOfYoga[yogaIndex].SecondsOrTimes}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              )),
                    Spacer(),
                    Consumer<TimerModel2>(builder: (context, myModel, child) {
                      return ElevatedButton(
                          onPressed: () {
                            myModel.show();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: SmallText(
                              text: "PAUSE",
                              color: Colors.white,
                            ),
                          ));
                    }),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          yogaIndex != 0
                              ? Consumer<TimerModel2>(
                                  builder: (context, myModel, child) =>
                                      TextButton(
                                          onPressed: () {
                                            myModel.pressedPrev();
                                            Future.delayed(Duration(
                                                seconds:
                                                    1)); ////this line  added because myModel.pressedMext() function is asynchronus and takes time to complete
                                            //meanwhile the other function i.e Navigator.push starts and that causes an error thats why we have used future.delayed here;
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BreakTime(
                                                          listOfYoga:
                                                              listOfYoga,
                                                          yogaIndex:
                                                              yogaIndex - 1,
                                                          YogaTableName:
                                                              yogaTableName,
                                                        )));
                                          },
                                          child: SmallText(
                                            text: "PREVIOUS",
                                            size: 18,
                                          )),
                                )
                              : Container(),
                          yogaIndex != (listOfYoga.length - 1)
                              ? Consumer<TimerModel2>(
                                  builder: (context, myModel, child) =>
                                      TextButton(
                                          onPressed: () {
                                            myModel.pressedNext();
                                            Future.delayed(Duration(
                                                seconds:
                                                    1)); //this line  added because myModel.pressedMext() function is asynchronus and takes time to complete
                                            //meanwhile the other function i.e Navigator.push starts and that causes an error thats why we have used future.delayed here;
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BreakTime(
                                                          listOfYoga:
                                                              listOfYoga,
                                                          yogaIndex:
                                                              yogaIndex + 1,
                                                          YogaTableName:
                                                              yogaTableName,
                                                        )));
                                          },
                                          child: SmallText(
                                            text: "NEXT",
                                            size: 18,
                                          )),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    yogaIndex != (listOfYoga.length - 1)
                        ? Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: SmallText(
                                  text:
                                      "Next: ${listOfYoga[yogaIndex + 1].YogaTitle}",
                                  size: 20,
                                )),
                          )
                        : Container(
                            child: SmallText(
                                text: "Tip: " +
                                    QuotesList.getRandomQuotes(
                                        QuotesList.quotesList)),
                          ),
                  ]),
                ),
                Consumer<TimerModel2>(builder: (context, myModel, child) {
                  return Visibility(
                      visible: myModel.visible,
                      child: Container(
                        color: Colors.blueAccent.withOpacity(0.8),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<TimerModel2>(
                                builder: (context, myModel, child) {
                              return OutlinedButton(
                                  onPressed: () {
                                    myModel.hide();
                                  },
                                  child: BigText(
                                    text: "RESUME",
                                  ));
                            }),
                            SizedBox(
                              height: 10,
                            ),
                            Consumer<TimerModel2>(
                                builder: (context, myModel, child) {
                              return OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: BigText(
                                    text: "QUIT",
                                  ));
                            })
                          ],
                        ),
                      ));
                })
              ],
            )),
          );
        }));
  }
}

class TimerModel2 with ChangeNotifier {
  TimerModel2(context, List<Yoga> listOfYoga, int yogaIndex,
      String yogaTableName, String count) {
    setCountDownValue(
        int.parse(count),
        listOfYoga[yogaIndex - 1]
            .Seconds); //we did -1 here bwcause when we called timermodel2 we had passed index+1 for showing next
    //but here we want to get the data of yoga at the current index
    checkLast(yogaIndex >= listOfYoga.length - 1);
    MyTimer(context, listOfYoga, yogaIndex, yogaTableName);
    readTime(yogaIndex);
  }
  bool visible = false;
  bool nextPressed = false;
  bool prevPressed = false;
  bool isLast = false;
  int countDown = 0;

  void setCountDownValue(int count, bool isSeconds) {
    print(isSeconds);
    print("count is $count ");
    countDown = isSeconds ? count : 1000;
  }

  void show() {
    visible = true;
    notifyListeners();
  }

  void pressedNext() {
    nextPressed = true;
    notifyListeners();
  }

  void pressedPrev() {
    prevPressed = true;
    notifyListeners();
  }

  void checkLast(bool last) {
    isLast = last;
  }

  void hide() {
    visible = false;
    notifyListeners();
  }

  MyTimer(context, List<Yoga> listOfYoga, int yogaIndex,
      String yogaTableName) async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      visible ? countDown + 0 : countDown--;
      notifyListeners();
      if (countDown == 0) {
        timer.cancel();
        isLast
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const FinishScreen()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BreakTime(
                          listOfYoga: listOfYoga,
                          yogaIndex: yogaIndex,
                          YogaTableName: yogaTableName,
                        )));
      } else if (nextPressed || prevPressed) {
        timer.cancel();
      }
    });
  }

  void readTime(int yogaIndex) {
    if (yogaIndex == 1) {
      String now = DateTime.now().toString();
      LocalDB.setStartTime(now);
    }
  }
}
