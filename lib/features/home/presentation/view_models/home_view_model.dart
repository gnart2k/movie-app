import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/home_props.dart';
import 'package:movie_app/features/home/data/repositories/home_repository.dart';
import 'package:movie_app/features/home/data/sources/home_source.dart';

class HomeViewModel extends StateNotifier<HomeProps> {
  final HomeRepository _repository;

  HomeViewModel(this._repository)
      : super(
          HomeProps(
            banner: BannerProps(title: '', button: ''),
            contentCategories: [],
            deviceCompatibilitiy:
                DeviceCompatibilitiyProps(title: '', devices: []),
            subscriptionPlans: SubscriptionPlanProps(title: '', plans: []),
            faqSection: FaqSectionProps(title: '', questions: []),
            footer: FooterProps(links: [], socialMedial: []),
          ),
        ) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final homeInfo = await _repository.getHomeInfo();
      state = homeInfo;
    } catch (e) {
      state = HomeProps(
        banner: BannerProps(title: '', button: ''),
        contentCategories: [],
        deviceCompatibilitiy: DeviceCompatibilitiyProps(title: '', devices: []),
        subscriptionPlans: SubscriptionPlanProps(title: '', plans: []),
        faqSection: FaqSectionProps(title: '', questions: []),
        footer: FooterProps(links: [], socialMedial: []),
      );
    }
  }
}

final homeSourceProvider = Provider((ref) => HomeSource());
final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(ref.read(homeSourceProvider)),
);
final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeProps>(
  (ref) => HomeViewModel(ref.read(homeRepositoryProvider)),
);
