import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/show_page/banner.dart';
import 'package:movie_app/features/home/data/repositories/show_page/banner_repository.dart';
import 'package:movie_app/features/home/data/sources/show_page/banner_source.dart';

class BannerViewmodel extends StateNotifier<Banner> {
  final BannerRepository _repository;

  BannerViewmodel(this._repository)
      : super(Banner(title: '', buttons: []));

  Future<void> getComparePlans() async {
    try {
      final banner = await _repository.getBannerSource();
      state = banner;
    } catch (e) {
      state = Banner(title: '', buttons: []);
    }
  }
}

final bannerSourceProvider = Provider((ref) => BannerSource());
final bannerRepositoryProvider = Provider(
  (ref) => BannerRepository(ref.read(bannerSourceProvider)),
);
final bannerViewModelProvider =
    StateNotifierProvider<BannerViewmodel, Banner>(
  (ref) => BannerViewmodel(ref.read(bannerRepositoryProvider)),
);
