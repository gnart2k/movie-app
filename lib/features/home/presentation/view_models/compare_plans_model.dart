import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/compare_plans.dart';
import 'package:movie_app/features/home/data/repositories/compare_plans_repository.dart';
import 'package:movie_app/features/home/data/sources/compare_plans_source.dart';

class ComparePlansViewModel extends StateNotifier<ComparePlans> {
  final ComparePlansRepository _repository;

  ComparePlansViewModel(this._repository)
      : super(ComparePlans(title: '', columns: [], rows: []));

  Future<void> getComparePlans() async {
    try {
      final comparePlans = await _repository.getComparePlans();
      state = comparePlans;
    } catch (e) {
      state = ComparePlans(title: '', columns: [], rows: []);
    }
  }
}

final comparePlansSourceProvider = Provider((ref) => ComparePlansSource());
final comparePlansRepositoryProvider = Provider(
  (ref) => ComparePlansRepository(ref.read(comparePlansSourceProvider)),
);
final comparePlansViewModelProvider =
    StateNotifierProvider<ComparePlansViewModel, ComparePlans>(
  (ref) => ComparePlansViewModel(ref.read(comparePlansRepositoryProvider)),
);
