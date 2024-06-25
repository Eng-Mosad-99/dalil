import 'package:dalil/core/database/cache/cache_helper.dart';
import 'package:dalil/core/services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: 'isOnBoardingShown', value: true);
}
