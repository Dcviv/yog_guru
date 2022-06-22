class YogaModel {
  static String YogaTable1 = "BeginnerYoga";
  static String YogaTable2 = "ImmunityBoosterYoga";
  static String YogaTable3 = "YogaForStudents";
  static String YogaTableFat = "FatBurningYoga";
  static String YogaTableBed = "BedTimeYoga";
  static String YogaTable4 = "YogaSummary";
  static String IDName = 'ID';
  static String YogaName = 'YogaName';
  static String SecondsOrNot = 'SecondsOrNot';
  static String SecondsOrTimes = 'SecondsOrTimes';
  static String ImageName = 'ImageName';
  static String IconName = 'IconName';

  static String YogaWorkoutName = 'YogaWorkoutName';
  static String BackGroundImage = 'BackGroundImage';
  static String TimeTaken = 'TimeTaken';
  static String TotalNoOfWorkouts = 'TotalNoOfWorkouts';
  static String YogaKey = 'yogaKey';

  static List<String> YogaTable1ColumnName = [
    YogaModel.IDName,
    YogaModel.ImageName,
    YogaModel.SecondsOrNot,
    YogaModel.YogaName,
    YogaModel.SecondsOrTimes,
    YogaModel.IconName
  ];
}

class Yoga {
  final int? id;
  final bool Seconds;
  final String YogaTitle;
  final String YogaImageURL;
  final String SecondsOrTimes;
  final String YogaIconUrl;

  const Yoga(
      {this.id,
      required this.Seconds,
      required this.YogaTitle,
      required this.YogaImageURL,
      required this.SecondsOrTimes,
      required this.YogaIconUrl});
  Yoga copy({
    int? id,
    bool? seconds,
    String? YogaTitle,
    String? imageURL,
    String? secondsOrTimes,
    String? iconURL,
  }) {
    return Yoga(
        id: id ?? this.id,
        Seconds: seconds ?? this.Seconds,
        YogaTitle: YogaTitle ?? this.YogaTitle,
        YogaImageURL: imageURL ?? this.YogaImageURL,
        SecondsOrTimes: secondsOrTimes ?? this.SecondsOrTimes,
        YogaIconUrl: iconURL ?? this.YogaIconUrl);
  }

  static Yoga fromJSON(Map<String, Object?> json) {
    return Yoga(
        id: json[YogaModel.IDName] as int?,
        Seconds: json[YogaModel.SecondsOrNot] == 1,
        YogaTitle: json[YogaModel.YogaName] as String,
        YogaImageURL: json[YogaModel.ImageName] as String,
        SecondsOrTimes: json[YogaModel.SecondsOrTimes] as String,
        YogaIconUrl: json[YogaModel.IconName] as String);
  }

  Map<String, Object?> toJSON() {
    return {
      YogaModel.IDName: id,
      YogaModel.SecondsOrNot: Seconds ? 1 : 0,
      YogaModel.YogaName: YogaTitle,
      YogaModel.ImageName: YogaImageURL,
      YogaModel.SecondsOrTimes: SecondsOrTimes,
      YogaModel.IconName: YogaIconUrl
    };
  }
}

class YogaSummary {
  final int? id;

  final String YogaWorkOutName;
  final String BackgroundImage;
  final String TimeTaken;
  final String TotalNoOfWorkouts;
  final int YogaKey;

  const YogaSummary({
    this.id,
    required this.BackgroundImage,
    required this.TimeTaken,
    required this.TotalNoOfWorkouts,
    required this.YogaWorkOutName,
    required this.YogaKey,
  });
  YogaSummary copy({
    int? id,
    String? YogaWorkoutName,
    String? TimeTaken,
    String? BackGroundImage,
    String? TotalNoOfWorkouts,
    int? YogaKey,
  }) {
    return YogaSummary(
        id: id ?? this.id,
        BackgroundImage: BackGroundImage ?? this.BackgroundImage,
        TimeTaken: TimeTaken ?? this.TimeTaken,
        TotalNoOfWorkouts: TotalNoOfWorkouts ?? this.TotalNoOfWorkouts,
        YogaWorkOutName: YogaWorkoutName ?? this.YogaWorkOutName,
        YogaKey: YogaKey ?? this.YogaKey);
  }

  static YogaSummary fromJSON(Map<String, Object?> json) {
    return YogaSummary(
      id: json[YogaModel.IDName] as int?,
      BackgroundImage: json[YogaModel.BackGroundImage] as String,
      TimeTaken: json[YogaModel.TimeTaken] as String,
      TotalNoOfWorkouts: json[YogaModel.TotalNoOfWorkouts] as String,
      YogaWorkOutName: json[YogaModel.YogaWorkoutName] as String,
      YogaKey: json[YogaModel.YogaKey] as int,
    );
  }

  Map<String, Object?> toJSON() {
    return {
      YogaModel.IDName: id,
      YogaModel.BackGroundImage: BackgroundImage,
      YogaModel.TimeTaken: TimeTaken,
      YogaModel.TotalNoOfWorkouts: TotalNoOfWorkouts,
      YogaModel.YogaWorkoutName: YogaWorkOutName,
      YogaModel.YogaKey: YogaKey
    };
  }
}
