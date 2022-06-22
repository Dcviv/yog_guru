import 'package:shared_preferences/shared_preferences.dart';
import 'package:yog_guru/pages/workout_details.dart';

class LocalDB {
  static String timeKey = "TIMEKEY";
  static String lastDoneOn = "LASTDONEON";
  static String streakKey = "STREAKKEY";
  static String kcalKey = "KCALKEY";
  static String workOutTimeKey = "WORKOUTTIMEKEY";
  static String firstTime = "FIRSTTIME";

//to calculate workout duration
  static Future<bool> setStartTime(String Time) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(timeKey, Time);
  }

  static Future<String?> getStartTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(timeKey);
  }

//to maintain the streak increement
  static Future<bool> setLastDoneOn(String date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(lastDoneOn, date);
  }

  static Future<String?> getLastDoneOn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(lastDoneOn);
  }

  //to fetch and save the value of streak
  static Future<bool> setStreak(int streak) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(streakKey, streak);
  }

  static Future<int?> getStreak() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(streakKey);
  }

  //fetch and set kcal
  static Future<bool> setKcal(int kCal) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(kcalKey, kCal);
  }

  static Future<int?> getKcal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(kcalKey);
  }

  //fetch and save overallworkout time
  static Future<bool> setWorkOutTime(int minutes) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(workOutTimeKey, minutes);
  }

  static Future<int?> getWorkoutTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(workOutTimeKey);
  }

  static Future<bool> setFirstTime(bool isFirstTime) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(firstTime, isFirstTime);
  }

  static Future<bool?> getfirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(firstTime);
  }
}
