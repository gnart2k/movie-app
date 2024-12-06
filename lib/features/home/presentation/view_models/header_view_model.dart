import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/header.dart';
import 'package:movie_app/features/home/data/repositories/header_repository.dart';
import 'package:movie_app/features/home/data/sources/header_source.dart';

class HeaderViewModel extends StateNotifier<HeaderProps> {
  final HeaderRepository _repository;

  HeaderViewModel(this._repository)
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
    for (int i = 0; i < state.navigationLinks.length; i++) {
      if (state.navigationLinks[i].isSelected) {

      }
    }
  }
}

final headerSourceProvider = Provider((ref) => HeaderSource());
final headerRepositoryProvider = Provider(
  (ref) => HeaderRepository(ref.read(headerSourceProvider)),
);
final headerViewModelProvider =
    StateNotifierProvider<HeaderViewModel, HeaderProps>(
  (ref) => HeaderViewModel(ref.read(headerRepositoryProvider)),
);

class NavigationLinkModel {
  String url;
  bool isSelected;

  NavigationLinkModel({required this.url, this.isSelected = false});
}
