import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/show_page/footer_showpage.dart';
import 'package:movie_app/features/home/data/repositories/show_page/footer_showpage_repository.dart';
import 'package:movie_app/features/home/data/sources/show_page/footer_showpage_source.dart';

class FooterShowpageViewmodel extends StateNotifier<FooterShowPage> {
  final FooterShowpageRepository _repository;

  FooterShowpageViewmodel(this._repository)
      : super(FooterShowPage(navigationLinks: [], socialMedia: []));

  Future<void> getFooterShowPage() async {
    try {
      final source = await _repository.getSource();
      state = source;
    } catch (e) {
      state = FooterShowPage(navigationLinks: [], socialMedia: []);
    }
  }
}

final sourceProvider = Provider((ref) => FooterShowpageSource());
final repositoryProvider = Provider(
  (ref) => FooterShowpageRepository(ref.read(sourceProvider)),
);
final footerShowPageViewModelProvider =
    StateNotifierProvider<FooterShowpageViewmodel, FooterShowPage>(
  (ref) => FooterShowpageViewmodel(ref.read(repositoryProvider)),
);
