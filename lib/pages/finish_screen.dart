import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yog_guru/database/localdb.dart';
import 'package:yog_guru/widgets/big_text.dart';
import 'package:yog_guru/widgets/small_text.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  late BannerAd _bannerAdd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _initBannerAdd();
  }

  _initBannerAdd() {
    _bannerAdd = BannerAd(
        size: AdSize.fluid,
        adUnitId: "ca-app-pub-2831033879129253/1373850674",
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              setState(() {
                _isLoaded = true;
              });
            },
            onAdFailedToLoad: (ad, loadError) {}),
        request: AdRequest());
    _bannerAdd.load();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpdateFitnessModel>(
      create: (context) => UpdateFitnessModel(),
      child: Scaffold(
        body: Column(
          children: [
            //SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
              ),
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ9reNyRJosjM9s32DWYc3e8Rw0FdyAE3PTw&usqp=CAU"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
              ),
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "10"),
                      SmallText(text: "minutes"),
                    ],
                  ),
                  Column(
                    children: [
                      BigText(text: "145"),
                      SmallText(text: "Calorie"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
              ),
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "DO IT AGAIN"),
                  BigText(text: "SHARE"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: SmallText(
                    text: "RATE US",
                    color: Colors.white,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              color: Colors.grey,
              child: _isLoaded
                  ? AdWidget(ad: _bannerAdd)
                  : SizedBox(
                      height: 30,
                    ),
            ),
            Consumer<UpdateFitnessModel>(
              builder: (context, myModel, child) {
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateFitnessModel with ChangeNotifier {
  UpdateFitnessModel() {
    SetWorkoutTime();
    LastWorkOutDoneOn();
    SetMyKCAL(13);
  }
  int a = 1;

  void SetWorkoutTime() async {
    print("SetWorkoutTime");
    String? StartTime = await LocalDB.getStartTime();
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(StartTime ?? "2022-05-24 19:31:15.182");
    int difference = DateTime.now().difference(tempDate).inMinutes;
    int? mywotime = await LocalDB.getWorkoutTime();
    print(mywotime);
// LocalDB.setWorkOutTime( mywotime! + 59);
    LocalDB.setWorkOutTime(mywotime! + difference);
  }

  void LastWorkOutDoneOn() async {
    print("LAST WORKOUT ");

    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(await LocalDB.getLastDoneOn() ?? "2022-05-24 19:31:15.182");
    int difference = DateTime.now().difference(tempDate).inDays;
    if (difference == 0) {
      print("GOOD JOB");
    } else if (difference == 1) {
      int? streaknow = await LocalDB.getStreak();
      LocalDB.setStreak(streaknow! + 1);
    } else {
      LocalDB.setStreak(1);
    }

    await LocalDB.setLastDoneOn(DateTime.now().toString());
  }

  void SetMyKCAL(int myKCAL) async {
    print("SetMyKCAL");
    int? kcal = await LocalDB.getKcal();
    print(kcal);
    LocalDB.setKcal(kcal.toString() == "null" ? 0 : kcal! + myKCAL);
  }
//TODO: Set the initial value of straek and lastdone on in starting of app
}
