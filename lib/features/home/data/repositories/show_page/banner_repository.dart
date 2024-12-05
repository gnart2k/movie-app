import 'package:movie_app/features/home/data/models/show_page/banner.dart';
import 'package:movie_app/features/home/data/sources/show_page/banner_source.dart';

class BannerRepository {
  final BannerSource _bannerSource;
  BannerRepository(this._bannerSource);
  Future<Banner> getBannerSource() {
    return _bannerSource.fetchBanner();
  }
}
