// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// ignore_for_file: public_member_api_docs

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   MobileAds.instance.initialize();
//   runApp(AdsTestScreen());
// }

// You can also test with your own ad unit IDs by registering your device as a
// test device. Check the logs for your device's ID value.
const String testDevice = '16D265166C7DAF515FA40F177BD4D2C3';
const int maxFailedLoadAttempts = 3;

// RequestConfiguration.Builder().setTestDeviceIds(Arrays.asList("16D265166C7DAF515FA40F177BD4D2C3"))

class AdsTestScreen extends StatefulWidget {
  @override
  _AdsTestScreenState createState() => _AdsTestScreenState();
}

class _AdsTestScreenState extends State<AdsTestScreen> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  static const interstitialButtonText = 'InterstitialAd';
  static const rewardedButtonText = 'RewardedAd';
  static const rewardedInterstitialButtonText = 'RewardedInterstitialAd';
  static const fluidButtonText = 'Fluid';
  static const inlineAdaptiveButtonText = 'Inline adaptive';
  static const anchoredAdaptiveButtonText = 'Anchored adaptive';
  static const nativeTemplateButtonText = 'Native template';
  static const webviewExampleButtonText = 'Register WebView';
  static const adInspectorButtonText = 'Ad Inspector';

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  RewardedInterstitialAd? _rewardedInterstitialAd;
  int _numRewardedInterstitialLoadAttempts = 0;

  @override
  void initState() {
    super.initState();
    // ConsentDebugSettings debugSettings = ConsentDebugSettings(
    //     debugGeography: DebugGeography.debugGeographyEea,
    //     testIdentifiers: ['loremIpsum?']);
    // final params =
    //     ConsentRequestParameters(consentDebugSettings: debugSettings);
    // ConsentInformation.instance.requestConsentInfoUpdate(params, () async {
    //   log('UMP Success');
    //   if (await ConsentInformation.instance.isConsentFormAvailable()) {
    //     log('UMP Load thing');
    //     loadForm();
    //   }
    // }, (error) {
    //   log('UMP Error, nothing to show here.');
    // });
    MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: [testDevice]));
    _createInterstitialAd();
    _createRewardedAd();
    _createRewardedInterstitialAd();
  }

  // void loadForm() {
  //   log('UMP loadForm');
  //   ConsentForm.loadAndShowConsentFormIfRequired((formError) async {
  //     if (formError != null) {
  //       log('UMP loadAndShow Error');
  //       loadForm();
  //       return;
  //     }
  //
  //     log('UMP loadAndShow no Error');
  //
  //     switch (await ConsentInformation.instance
  //         .getPrivacyOptionsRequirementStatus()) {
  //       case PrivacyOptionsRequirementStatus.notRequired:
  //         log('UMP PrivacyOptionsRequirementsStatus is Not Required');
  //         break;
  //       case PrivacyOptionsRequirementStatus.required:
  //         log('UMP PrivacyOptionsRequirementsStatus is Required');
  //         await ConsentForm.showPrivacyOptionsForm((formError) {
  //           if (formError != null) {
  //             log('UMP PrivacyOptions Form error');
  //             return;
  //           }
  //           log('UMP PrivacyOptions Shown happily?');
  //         });
  //         break;
  //       case PrivacyOptionsRequirementStatus.unknown:
  //         log('UMP PrivacyOptionsRequirementsStatus is Unknown');
  //         break;
  //       default:
  //         log('UMP What?');
  //     }
  //
  //     if (await ConsentInformation.instance.canRequestAds()) {
  //       log('UMP can Request Ads');
  //       await MobileAds.instance.updateRequestConfiguration(
  //           RequestConfiguration(testDeviceIds: [testDevice]));
  //       _createInterstitialAd();
  //       _createRewardedAd();
  //       _createRewardedInterstitialAd();
  //     }
  //   });
  // }

  void _createInterstitialAd() {
    final adUnitId = Platform.isAndroid
        ? 'ca-app-pub-8577724747514488/1326890776'
        : 'ca-app-pub-8577724747514488/1326890776';
    InterstitialAd.load(
        // adUnitId: Platform.isAndroid
        //     ? 'ca-app-pub-7319269804560504/6941421099'
        //     : 'ca-app-pub-7319269804560504/3520838807',
        adUnitId: adUnitId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-7319269804560504/6645907620'
            : 'ca-app-pub-7319269804560504/2207757133',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedAd = null;
  }

  void _createRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5354046379'
            : 'ca-app-pub-3940256099942544/6978759866',
        request: request,
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            _rewardedInterstitialAd = ad;
            _numRewardedInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            _rewardedInterstitialAd = null;
            _numRewardedInterstitialLoadAttempts += 1;
            if (_numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedInterstitialAd();
            }
          },
        ));
  }

  void _showRewardedInterstitialAd() {
    if (_rewardedInterstitialAd == null) {
      print('Warning: attempt to show rewarded interstitial before loaded.');
      return;
    }
    _rewardedInterstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
          print('$ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedInterstitialAd();
      },
      onAdFailedToShowFullScreenContent:
          (RewardedInterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedInterstitialAd();
      },
    );

    _rewardedInterstitialAd!.setImmersiveMode(true);
    _rewardedInterstitialAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedInterstitialAd = null;
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _rewardedInterstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _showInterstitialAd();
                },
                child: Text('SHOW INTERSTTIAL ADD'),
              )
            ],
          ),
        );
      }),
    );
  }
}
