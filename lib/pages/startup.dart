import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yog_guru/database/yogaDB.dart';
import 'package:yog_guru/model/model.dart';
import 'package:yog_guru/pages/are_you_ready.dart';
import 'package:yog_guru/widgets/big_text.dart';
import 'package:yog_guru/widgets/small_text.dart';

class Startup extends StatefulWidget {
  YogaSummary yogaSummary;
  String YogaKey;

  Startup({required this.yogaSummary, required this.YogaKey, Key? key})
      : super(key: key);

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  late List<Yoga> AllYogaWorkOutList;
  bool isPressed = false;
  bool isLoading = true;
  Future ReadAllYoga() async {
    this.AllYogaWorkOutList = await YogaDatabase.instance
        .readAllYoga(widget.yogaSummary.YogaWorkOutName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    ReadAllYoga();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Container(),
          )
        : Scaffold(
            floatingActionButton: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AreUReady(
                            yogaTableName:
                                widget.yogaSummary.YogaWorkOutName)));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: BigText(
                  text: "START",
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      collapseMode: CollapseMode.parallax,
                      background: Image.network(
                        "${widget.yogaSummary.BackgroundImage.toString()}",
                        fit: BoxFit.cover,
                      )),
                  actions: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        icon: Icon(
                          Icons.thumb_up,
                          color: isPressed ? Colors.blue : Colors.white,
                        ))
                  ],
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        SmallText(
                          text: "${widget.yogaSummary.YogaWorkOutName}",
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 3,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                              thickness: 3,
                            ),
                        itemBuilder: (context, index) => ListTile(
                              leading: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Image.network(
                                  AllYogaWorkOutList[index]
                                      .YogaIconUrl
                                      .toString(),
                                  fit: BoxFit.cover, //add icon here
                                ),
                              ),
                              title: BigText(
                                  text: AllYogaWorkOutList[index].YogaTitle),
                              subtitle: SmallText(
                                text: AllYogaWorkOutList[index].Seconds
                                    ? "00:${AllYogaWorkOutList[index].SecondsOrTimes}"
                                    : "x${AllYogaWorkOutList[index].SecondsOrTimes}",
                              ),
                            ),
                        itemCount: AllYogaWorkOutList.length)
                  ],
                ))
              ],
            ),
          );
  }
}
