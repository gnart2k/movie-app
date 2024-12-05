import 'package:movie_app/features/home/data/models/show_page/call_to_action.dart';
import 'package:movie_app/features/home/data/sources/show_page/call_to_action_source.dart';

class CallToActionRepository {
  final CallToActionSource _bannerSource;
  CallToActionRepository(this._bannerSource);
  Future<CallToAction> getBannerSource() {
    return _bannerSource.fetchCallToAction();
  }
}
