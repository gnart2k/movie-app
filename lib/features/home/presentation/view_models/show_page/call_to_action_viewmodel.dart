import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/show_page/call_to_action.dart';
import 'package:movie_app/features/home/data/repositories/show_page/call_to_action_repository.dart';
import 'package:movie_app/features/home/data/sources/show_page/call_to_action_source.dart';

class CallToActionViewmodel extends StateNotifier<CallToAction> {
  final CallToActionRepository _repository;

  CallToActionViewmodel(this._repository)
      : super(CallToAction(text: '', button: ''));

  Future<void> getComparePlans() async {
    try {
      final source = await _repository.getBannerSource();
      state = source;
    } catch (e) {
      state = CallToAction(text: '', button: '');
    }
  }
}

final sourceProvider = Provider((ref) => CallToActionSource());
final repositoryProvider = Provider(
  (ref) => CallToActionRepository(ref.read(sourceProvider)),
);
final callToActionViewModelProvider =
    StateNotifierProvider<CallToActionViewmodel, CallToAction>(
  (ref) => CallToActionViewmodel(ref.read(repositoryProvider)),
);
