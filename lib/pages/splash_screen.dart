import 'package:flutter/material.dart';
import 'package:yog_guru/pages/home_page.dart';

import '../database/localdb.dart';
import '../database/yogaDB.dart';
import '../model/model.dart';
import '../widgets/small_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future makeYogaEntry(Yoga yoga, String TableName) async {
    await YogaDatabase.instance.insert(yoga, TableName);
  }

  Future makeYogaSummaryEntry(YogaSummary yogaSummary) async {
    await YogaDatabase.instance.insertYogaSummary(yogaSummary);
  }

  checkUp() async {
    await LocalDB.getfirstTime().then((value) async {
      if (value.toString() == "null" || value != false) {
        print("First Time Entering");
        await LocalDB.setStreak(0);
        await LocalDB.setLastDoneOn(
            DateTime.now().subtract(Duration(days: 1)).toString());
        await LocalDB.setKcal(0);
        await LocalDB.setWorkOutTime(0);
        await LocalDB.setFirstTime(false);

        // CREATING  YOGA WORKOUT PACKs
        makeYogaSummaryEntry(YogaSummary(
          BackgroundImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVm1G1cejqXyy36WeuwsRHhdB-Y5r2YGmaD98OvklorBDAtWSn3m6UTrN-t5lwkhdzmFs&usqp=CAU",
          TimeTaken: '7',
          TotalNoOfWorkouts: '3',
          YogaWorkOutName: YogaModel.YogaTable1,
          YogaKey: 1,
        ));
        makeYogaSummaryEntry(YogaSummary(
            BackgroundImage:
                "https://femina.wwmindia.com/thumb/content/2020/jul/thhealth1594801447.jpg?width=1200&height=900",
            TimeTaken: '7',
            TotalNoOfWorkouts: '3',
            YogaWorkOutName: YogaModel.YogaTable2,
            YogaKey: 2));
        makeYogaSummaryEntry(YogaSummary(
            BackgroundImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi7L4n8TG_iUFutWj3_m5OwXEBLIlZf-5NaFjDFbcIV4C4CACx6dB07fJ-igiOkMhUD3s&usqp=CAU",
            TimeTaken: '7',
            TotalNoOfWorkouts: '3',
            YogaWorkOutName: YogaModel.YogaTable3,
            YogaKey: 3));
        makeYogaSummaryEntry(YogaSummary(
            BackgroundImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTge832YtdYFeyse2WLvmIPMLFYlCSxK8QIYNppGpoK6TC7x3Jp2pVNol6Z2MyaWPl3nFI&usqp=CAU",
            TimeTaken: '7',
            TotalNoOfWorkouts: '3',
            YogaWorkOutName: YogaModel.YogaTableFat,
            YogaKey: 4));
        makeYogaSummaryEntry(YogaSummary(
            BackgroundImage:
                "https://static.onecms.io/wp-content/uploads/sites/35/2019/06/16183629/stretching-before-bed-yoga-poses_0.jpg",
            TimeTaken: '7',
            TotalNoOfWorkouts: '3',
            YogaWorkOutName: YogaModel.YogaTableBed,
            YogaKey: 5));
        makeYogaEntry(
            Yoga(
                Seconds: true,
                YogaTitle: 'Mountain Pose (Tadasana)',
                YogaImageURL:
                    "https://img.emedihealth.com/wp-content/uploads/2021/02/1-mountain-pose-tadasana.gif",
                SecondsOrTimes: '60',
                YogaIconUrl:
                    "https://www.wakefit.co/blog/wp-content/uploads/2019/06/Tadasana.gif"),
            YogaModel.YogaTable1);
        makeYogaEntry(
            Yoga(
                Seconds: true,
                YogaTitle: 'Childs Pose (Balasana)',
                YogaImageURL:
                    "https://img.emedihealth.com/wp-content/uploads/2020/03/childs-pose.gif",
                SecondsOrTimes: '300',
                YogaIconUrl:
                    "https://thumbs.gfycat.com/AdolescentIlliterateKoodoo-max-1mb.gif"),
            YogaModel.YogaTable1);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Cat/Cow Pose (Marjaryasana to Bitilasana)',
                YogaImageURL:
                    "https://www.verywellfit.com/thmb/1c9Ke9SVwUksCeNReuN8hVz9me4=/1333x1000/smart/filters:no_upscale()/Cat-CowStretch_annotated-8901d7787ad44b21bd3ffe2a2e97fdc9.gif",
                SecondsOrTimes: '150',
                YogaIconUrl:
                    "https://www.yogajournal.com/wp-content/uploads/2021/12/CatPose.gif?width=730"),
            YogaModel.YogaTable1);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Downward-Facing Dog (Adho Mukha Svanansana)',
                YogaImageURL:
                    "https://img.emedihealth.com/wp-content/uploads/2020/04/6-downward-facing-dog-pose.gif",
                SecondsOrTimes: '150',
                YogaIconUrl:
                    "https://www.yogajournal.com/wp-content/uploads/2016/01/nicki-eddie-cat-cow.gif?width=730"),
            YogaModel.YogaTable1);
        makeYogaEntry(
            const Yoga(
                Seconds: false,
                YogaTitle: 'Warrior I (Virabhadrasana I)',
                YogaImageURL:
                    "https://img.emedihealth.com/wp-content/uploads/2020/04/warrior-pose-II.gif",
                SecondsOrTimes: '10',
                YogaIconUrl:
                    "https://www.verywellfit.com/thmb/PIw9zruVcRk6F3lNrfPDEF71y44=/1500x1000/filters:fill(FFDB5D,1)/Verywell-01-3567198-WarriorOne-598a10b06f53ba00111d32f3.gif"),
            YogaModel.YogaTable1);
        makeYogaEntry(
            const Yoga(
                Seconds: false,
                YogaTitle: 'Warrior II (Virabhadrasana II)',
                YogaImageURL:
                    "https://img.emedihealth.com/wp-content/uploads/2020/04/warrior-pose-II.gif",
                SecondsOrTimes: '10',
                YogaIconUrl:
                    "https://www.verywellfit.com/thmb/6h-QCBgTWdUvHrmgDuq0FPLgcuA=/1500x844/smart/filters:no_upscale()/Verywell-03-3567198-Warrior2-598a10d4d963ac0011fc9d72.gif"),
            YogaModel.YogaTable1);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Corpse Pose (Shavasana)',
                YogaImageURL:
                    "https://img.emedihealth.com/wp-content/uploads/2020/03/corpse-pose-savasana.gif",
                SecondsOrTimes: '300',
                YogaIconUrl:
                    "https://imgk.timesnownews.com/story/savasana.gif"),
            YogaModel.YogaTable1);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Supta Virasana',
                YogaImageURL:
                    "https://www.eastcoastdaily.in/wp-content/uploads/2017/12/yoga-40-1-300x300.jpg",
                SecondsOrTimes: '30',
                YogaIconUrl:
                    "https://htv.com.pk/wp-content/uploads/aba000c0460adeee28781b75c38cb34c.gif"),
            YogaModel.YogaTable2);
        makeYogaEntry(
            const Yoga(
                Seconds: false,
                YogaTitle: 'Virabhadrhasana III (Warrior III)',
                YogaImageURL:
                    "https://omstars.com/blog/wp-content/uploads/2020/03/Warrior-3-Ajay-Tokas-infographic.png",
                SecondsOrTimes: '10',
                YogaIconUrl:
                    "https://post.greatist.com/wp-content/uploads/sites/2/2019/05/Warrior3.gif"),
            YogaModel.YogaTable2);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Uttanasana (Standing Forward Bend) ',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjuFHb-0wM-3nQWojjovohtH9eZIE0Rj320g&usqp=CAU",
                SecondsOrTimes: '30',
                YogaIconUrl:
                    "https://ohleh.com/wp-content/uploads/2021/01/Verywell-03-3567193-ForwardBend01-110-598b6652af5d3a0011ccd349.gif"),
            YogaModel.YogaTable2);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Plank Pose',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0UIkeQpibISRyGn8GwPLS4liBR74fld-5NA&usqp=CAU",
                SecondsOrTimes: '10',
                YogaIconUrl:
                    "https://thumbs.gfycat.com/ElectricEqualGoa-size_restricted.gif"),
            YogaModel.YogaTable2);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Vasisthasana (Side Plank Pose)',
                YogaImageURL:
                    "https://envato-shoebox-0.imgix.net/8e82/c9cc-65b2-4b11-951b-a358756d1f0b/IMG_1855.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=1600&s=2ecd30540bde56a57b6214f7889259bf",
                SecondsOrTimes: '10',
                YogaIconUrl:
                    "https://envato-shoebox-0.imgix.net/8e82/c9cc-65b2-4b11-951b-a358756d1f0b/IMG_1855.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=1600&s=2ecd30540bde56a57b6214f7889259bf"),
            YogaModel.YogaTable2);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Eka Hasta Bhujasana (Elephants Trunk Pose)',
                YogaImageURL:
                    "https://static.wixstatic.com/media/e2bff1_351f3896ae79440c8d45f24aa5151b5b~mv2_d_1256_1631_s_2.jpg/v1/fill/w_1000,h_1299,al_c,q_90,usm_0.66_1.00_0.01/e2bff1_351f3896ae79440c8d45f24aa5151b5b~mv2_d_1256_1631_s_2.jpg",
                SecondsOrTimes: '30',
                YogaIconUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSnpEkPYY_mOa_47xWZtFXyZZ7RMefPryxJA&usqp=CAU"),
            YogaModel.YogaTable2);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Matsyasana (Fish pose)',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVaozT0BJxnxHpqWkEC1dNdKpQHmCM3l6Ezw&usqp=CAU",
                SecondsOrTimes: '30',
                YogaIconUrl:
                    "https://www.epainassist.com/assets/alternative-therapy/2019/fish-pose-or-matsyasana.gif"),
            YogaModel.YogaTable3);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Virasana (Hero pose)',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4KsvdyNtrXt_vLKX30tRNGHdZcl6SV2Ok7Ft222lfnkqGS5SEs6J2yZK917wxXGWj_jU&usqp=CAU",
                SecondsOrTimes: '30',
                YogaIconUrl:
                    "https://www.verywellfit.com/thmb/F-WGBwdhr-CCiBpBGwkI-Hk1GYA=/2667x2000/smart/filters:no_upscale()/2-6567051-Reclined-Hero-Pose-GIF-eb30c4dad7684c4dbd8b1c7d94b561dc.gif"),
            YogaModel.YogaTable3);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Bhramari pranayam (Bee breathing)',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCCFE7A_SRCyf7ipABiAAwlR7ryAwYnb3ArQ&usqp=CAU",
                SecondsOrTimes: '15',
                YogaIconUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Vk8BZqHJsmsqD3NegUXbAk4gdvrVO5AEyA&usqp=CAU"),
            YogaModel.YogaTable3);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Vajrasana (Diamond or thunderbolt pose)',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqGLhOZyfAPxEkhpmlXmoJCoHDsv0zCnm2FA&usqp=CAU",
                SecondsOrTimes: '15',
                YogaIconUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyOn1liXACFtt0ZnWmHAmePep7RcRm53fIkQ&usqp=CAU"),
            YogaModel.YogaTable3);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Bhujangasana (Cobra pose)',
                YogaImageURL:
                    "https://i.pinimg.com/originals/54/01/9a/54019a40f3ab344c47fceeb56f7c6b77.gif",
                SecondsOrTimes: '15',
                YogaIconUrl:
                    "https://thumbs.gfycat.com/ViciousVelvetyJaeger-size_restricted.gif"),
            YogaModel.YogaTableFat);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Dhanurasana (Bow pose)',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5rp9DQUWC8uQHl0cTH_r_FcgX2ZW5lZbfTA&usqp=CAU",
                SecondsOrTimes: '15',
                YogaIconUrl:
                    "https://i.pinimg.com/originals/fa/5c/82/fa5c821d9e92531316911ea506277ea2.gif"),
            YogaModel.YogaTableFat);
        makeYogaEntry(
            const Yoga(
                Seconds: false,
                YogaTitle: 'Naukasana (Boat pose)',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvk1MffiYAFsJgDhq5ShY_WgAsbOetSsdJkQ&usqp=CAU",
                SecondsOrTimes: '3',
                YogaIconUrl:
                    "https://healthkeeda.com/wp-content/uploads/2020/08/Naukasana-Boat-Pose.gif"),
            YogaModel.YogaTableFat);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Ustrasana (Camel Pose)',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIxpDWgJiUHLhzuNgBm3rbtwHqAwDFH0V4CQ&usqp=CAU",
                SecondsOrTimes: '30',
                YogaIconUrl:
                    "https://www.epainassist.com/assets/alternative-therapy/2019/ustrasana-or-camel-pose.gif"),
            YogaModel.YogaTableFat);
        makeYogaEntry(
            const Yoga(
                Seconds: true,
                YogaTitle: 'Sleeping Swan',
                YogaImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq8aKdjJq6GykG7FSneBTLuTE4ccn01lSvUQ&usqp=CAU",
                SecondsOrTimes: '300',
                YogaIconUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-WT6h-rFnCIE7hdpWvC5YspunF7b0A113QA&usqp=CAU"),
            YogaModel.YogaTableBed);
        makeYogaEntry(
            const Yoga(
                Seconds: false,
                YogaTitle: 'Lizard Pose',
                YogaImageURL:
                    "https://www.verywellfit.com/thmb/GMXB5jWvNKSPSGAjgEOy_KePeo0=/735x0/17-3567096-Lizard-Pose-GIF-bcf6c74a326e4b92a7abf610649d62f4.gif",
                SecondsOrTimes: '5',
                YogaIconUrl:
                    "https://www.verywellfit.com/thmb/GMXB5jWvNKSPSGAjgEOy_KePeo0=/735x0/17-3567096-Lizard-Pose-GIF-bcf6c74a326e4b92a7abf610649d62f4.gif"),
            YogaModel.YogaTableBed);
        makeYogaEntry(
            const Yoga(
                Seconds: false,
                YogaTitle: 'Seated Forward Fold',
                YogaImageURL:
                    "https://177d01fbswx3jjl1t20gdr8j-wpengine.netdna-ssl.com/wp-content/uploads/2019/09/Seated-Forward-Fold-2.gif",
                SecondsOrTimes: '5',
                YogaIconUrl:
                    "https://177d01fbswx3jjl1t20gdr8j-wpengine.netdna-ssl.com/wp-content/uploads/2019/09/Seated-Forward-Fold-2.gif"),
            YogaModel.YogaTableBed);
        makeYogaEntry(
            const Yoga(
                Seconds: false,
                YogaTitle: 'Happy Baby',
                YogaImageURL:
                    "https://i0.wp.com/post.healthline.com/wp-content/uploads/2022/02/1727-How_To_Fart_Wind-400x400-Happy_Baby.gif?w=1155&h=840",
                SecondsOrTimes: '45',
                YogaIconUrl:
                    "https://i0.wp.com/post.healthline.com/wp-content/uploads/2022/02/1727-How_To_Fart_Wind-400x400-Happy_Baby.gif?w=1155&h=840"),
            YogaModel.YogaTableBed);
      } else {
        print("NOT A FIRST TIME");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUp();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePageF()));
    });
    //CHECK INSTALLATION,INSERT,READ,UPDATE,OPERATION STATUS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/64/41/61/644161b5ce15397473f2c4a49620ee8f.gif"),
                    fit: BoxFit.cover))),
      ),
    );
  }
}
