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
      adUnitId: 'ca-app-pub-3940256099942544/2934735716',
      request: AdRequest(),
      size: AdSize.banner,
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
            Spacer(),
            isLoad
                ? Container(
                    height: 30,
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
