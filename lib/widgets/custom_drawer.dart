import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yog_guru/database/localdb.dart';
import 'package:yog_guru/pages/splash_screen.dart';
import 'package:yog_guru/widgets/small_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  Future<void> shareApp() async {
    await FlutterShare.share(
        title: 'Hey I am using Yoga For Beginners App',
        text:
            'Hey I am using Yoga For Beginners App. It has best yoga workout for all age groups. You should try it once.',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToToSFhz8Jq_4Tnp62yYwEqJ7daxqG6-h74g&usqp=CAU"))),
          ),
          ListTile(
            title: SmallText(
              text: "Reset Progress",
              size: 20,
            ),
            leading: Icon(
              Icons.restart_alt,
              size: 25,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('RESET PROGRESS'),
                        actionsAlignment: MainAxisAlignment.center,
                        actionsPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        content: Text(
                            'This will reset all of your fitness data including Total Workout Time, Streak and Burned Calories. The action cannot be revert once done.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 35))),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await LocalDB.setWorkOutTime(0);
                              await LocalDB.setKcal(0);
                              await LocalDB.setStreak(0);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SplashScreen()));
                            },
                            child: Text(
                              "Reset",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 35))),
                          )
                        ],
                      ));
            },
          ),
          ListTile(
              title: SmallText(
                text: "Share With Friends",
                size: 20,
              ),
              leading: Icon(
                Icons.share,
                size: 25,
              ),
              onTap: shareApp),
          ListTile(
            title: SmallText(
              text: "Rate Us",
              size: 20,
            ),
            leading: Icon(
              Icons.star,
              size: 25,
            ),
            onTap: () async {
              await launchUrl(
                  Uri.parse("https://play.google.com/store/games?hl=en&gl=US"));
            },
          ),
          ListTile(
              title: SmallText(
                text: "Feedback",
                size: 20,
              ),
              leading: Icon(
                Icons.feedback_rounded,
                size: 25,
              )),
          ListTile(
            title: SmallText(
              text: "Privacy Policy",
              size: 20,
            ),
            leading: Icon(
              Icons.security,
              size: 25,
            ),
            onTap: () async {
              // https://sites.google.com/view/yogaforbeginners-indianyoga/privacy-policy
              await launchUrl(Uri.parse(
                  "https://sites.google.com/view/yogaforbeginners-indianyoga/privacy-policy"));
            },
          ),
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 10,
          ),
          SmallText(text: "Version 1.21.0")
        ],
      ),
    );
  }
}
