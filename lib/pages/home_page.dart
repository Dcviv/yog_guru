import 'package:flutter/material.dart';
import 'package:yog_guru/database/localdb.dart';
import 'package:yog_guru/database/yogaDB.dart';
import 'package:yog_guru/model/model.dart';
import 'package:yog_guru/pages/startup.dart';
import 'package:yog_guru/widgets/custom_app_bar.dart';
import 'package:yog_guru/widgets/custom_drawer.dart';

import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class HomePageF extends StatefulWidget {
  const HomePageF({Key? key}) : super(key: key);

  @override
  State<HomePageF> createState() => _HomePageFState();
}

class _HomePageFState extends State<HomePageF> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textAnimationController;

  bool isloading = true;
  late List<YogaSummary> yogaSummaryList;
  Future readYogaSummaryEntry() async {
    yogaSummaryList = await YogaDatabase.instance.readAllYogaSummary();
    setState(() {
      isloading = false;
    });
    // print("size of list is ${yogaSummaryList.length}");
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue)
        .animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();

    readYogaSummaryEntry();
    GetFitnessData();
  }

  int? streak;
  int? kcal;
  int? womin;
  void GetFitnessData() async {
    streak = await LocalDB.getStreak();
    kcal = await LocalDB.getKcal();
    womin = await LocalDB.getWorkoutTime();

    print(await LocalDB.getLastDoneOn());
    setState(() {});
  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Scaffold(body: Center())
        : Scaffold(
            key: scaffoldKey,
            drawer: CustomDrawer(),
            backgroundColor: Colors.white,
            body: NotificationListener(
                onNotification: scrollListner,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          bottom: 50,
                                          top: 100),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              BigText(text: streak.toString()),
                                              SmallText(
                                                text: "Streak",
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              BigText(text: kcal.toString()),
                                              SmallText(
                                                text: "Calorie",
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              BigText(text: womin.toString()),
                                              SmallText(
                                                text: "Minutes",
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Column(children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: yogaSummaryList.length,
                                          itemBuilder:
                                              ((context, index) => InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => Startup(
                                                                  yogaSummary:
                                                                      yogaSummaryList[
                                                                          index],
                                                                  YogaKey: yogaSummaryList[
                                                                          index]
                                                                      .YogaKey
                                                                      .toString())));
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 30,
                                                          left: 10,
                                                          right: 10),
                                                      padding: EdgeInsets.only(
                                                          left: 20,
                                                          right: 20,
                                                          top: 20,
                                                          bottom: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          BigText(
                                                            text: yogaSummaryList[
                                                                    index]
                                                                .YogaWorkOutName,
                                                            size: 22,
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                height: 200,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Colors
                                                                            .black,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image: NetworkImage(yogaSummaryList[index]
                                                                              .BackgroundImage
                                                                              .toString()),
                                                                        )),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          CustomAppBar(
                              animationController: _animationController,
                              drawerTween: _drawerTween,
                              colorTween: _colorTween,
                              homeTween: _homeTween,
                              iconTween: _iconTween,
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              yogaTween: _yogaTween)
                        ],
                      ),
                    )
                  ],
                )),
          );
  }
}
