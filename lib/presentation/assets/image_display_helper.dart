import 'package:goallook/presentation/assets/app_urls.dart';

class ImageDisplayHelper {
  static String generateLeagueCategoryImageURL(String title) {
    return AppUrls.leagueImage + title + AppUrls.alt;
  }
  static String generateJerseyImageURL(String title) {
    return AppUrls.jerseyImage + title + AppUrls.alt;
  }
}
