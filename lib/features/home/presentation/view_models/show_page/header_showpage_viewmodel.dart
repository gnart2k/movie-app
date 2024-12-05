import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/header.dart';
import 'package:movie_app/features/home/data/repositories/show_page/header_showpage_repository.dart';
import 'package:movie_app/features/home/data/sources/show_page/header_showpage_source.dart';

class HeaderShowPageViewModel extends StateNotifier<HeaderProps> {
  final HeaderShowPageRepository _repository;

  HeaderShowPageViewModel(this._repository)
      : super(HeaderProps(navigationLinks: [], logo: ''));

  Future<void> getHeaderInfo() async {
    try {
      final headerInfo = await _repository.getHeaderInfo();
      state = headerInfo;
    } catch (e) {
      state = HeaderProps(navigationLinks: [], logo: '');
    }
  }

  void toggleNavbar(
    int index,
  ) {
    state = state.toggleItem(requiredIndex: index);
  }
}

final headerSourceProvider = Provider((ref) => HeaderShowPageSource());
final headerShowPageRepositoryProvider = Provider(
  (ref) => HeaderShowPageRepository(ref.read(headerSourceProvider)),
);
final headerShowPageViewModelProvider =
    StateNotifierProvider<HeaderShowPageViewModel, HeaderProps>(
  (ref) => HeaderShowPageViewModel(ref.read(headerShowPageRepositoryProvider)),
);

class NavigationLinkModel {
  String url;
  bool isSelected;

  NavigationLinkModel({required this.url, this.isSelected = false});
}
