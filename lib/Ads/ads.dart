import 'package:firebase_admob/firebase_admob.dart';
class ShowAds{

  static bool banner = false;
  static BannerAd bannerAd;

  static BannerAd _getBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-4521252097059844/9629246349",
        size: AdSize.banner,
    );
  }

  static void showBannerAd() {
    bannerAd = _getBannerAd();
    bannerAd..load()..show();
    banner = true;
  }

  static void disposeBannerAd() {
    bannerAd = _getBannerAd();
    bannerAd.dispose();
    banner = false;
  }

  static InterstitialAd _interstitialAd;

  static InterstitialAd _getInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-4521252097059844/3529390789",
    );
  }

  static void showInterstitialAd() {
    _interstitialAd = _getInterstitialAd();
    _interstitialAd..load()
      ..show();
  }

  static loadRewardedAd(){
    coin();
     RewardedVideoAd.instance..load(
          adUnitId: "ca-app-pub-4521252097059844/9782796186",
    );
  }

  static showRewardedAd(){
    RewardedVideoAd.instance..show();
  }
  static int coins = 0;
  static coin(){
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        coins += rewardAmount;
      }
    };
  }
}