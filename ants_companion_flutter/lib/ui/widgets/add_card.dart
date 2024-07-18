import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdCard extends StatefulWidget {
  const AdCard({super.key});

  @override
  State<AdCard> createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  BannerAd? _bannerAd;
  LoadAdError? _error;
  void _loadAd() {
    final bannerAd = BannerAd(
      // size: widget.adSize,
      // adUnitId: widget.adUnitId,
      size: AdSize.mediumRectangle,
      // adUnitId: 'ca-app-pub-8577724747514488/6385588487',
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          setState(() {
            // _bannerAd = ad as BannerAd;
            _error = error;
          });
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }

  @override
  void initState() {
    if (_platformSupportsAds()) _loadAd();

    super.initState();
  }

  // bool _platformSupportsAds() =>
  //     Platform.isAndroid || Platform.isIOS ? true : false;

  bool _platformSupportsAds() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (!_platformSupportsAds()) return const SizedBox();
    final error = _error;
    if (error != null) {
      return const SizedBox(
        child: Center(
          child: Text('Ad Error'),
        ),
      );
    }

    return SizedBox(
      width: 200,
      height: 270,
      child: _bannerAd == null
          // Nothing to render yet.
          ? const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading Advertisement'),
                  SizedBox(height: 16),
                  CircularProgressIndicator(),
                ],
              ),
            )
          // The actual ad.
          : Card(child: AdWidget(ad: _bannerAd!)),
    );
  }
}
