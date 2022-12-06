import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivefinal/models/details.dart';
import 'package:path_provider/path_provider.dart';

import 'home.dart';

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/3419835294',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print('Ad loaded');
        openAd = ad;
        openAd!.show();
      }, onAdFailedToLoad: ((error) {
        print('Ad failed');
      })),
      orientation: AppOpenAd.orientationPortrait);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await loadAd();
  Directory directory = await getApplicationDocumentsDirectory();
  String path = directory.path;
  print(path);
  Hive.init(directory.path);
  Hive.registerAdapter(DetailsAdapter());
  var Dbox = await Hive.openBox<Details>('details');
  //print(Dbox.values);
  List<Details> details = Dbox.values.toList();
  print(details);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
