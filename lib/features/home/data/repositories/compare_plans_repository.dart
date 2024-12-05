import 'package:movie_app/features/home/data/models/compare_plans.dart';
import 'package:movie_app/features/home/data/sources/compare_plans_source.dart';

class ComparePlansRepository {
  final ComparePlansSource _comparePlansSource;
  ComparePlansRepository(this._comparePlansSource);
  Future<ComparePlans> getComparePlans() {
    return _comparePlansSource.fetchComparePlans();
  }
}
