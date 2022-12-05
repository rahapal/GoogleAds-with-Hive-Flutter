import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hivefinal/viewpage.dart';

import 'elevatedbutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? _bannerAd;
  bool isLoad = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoad = true;
          });
          print('Ad loaded');
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
    _bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Flutter'),
      ),
      body: SizedBox(
        height: 700,
        child: Column(
          children: [
            ViewPage(),
            Button(),
            isLoad
                ? Container(
                    height: 150,
                    child: AdWidget(
                      ad: _bannerAd!,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
